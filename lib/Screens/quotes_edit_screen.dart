import 'package:all_quotes/Model/quotes_model.dart';
import 'package:all_quotes/Utills/app_color.dart';
import 'package:all_quotes/Utills/global.dart';
import 'package:all_quotes/Utills/image_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

class QuotesEditScreen extends StatefulWidget {
  const QuotesEditScreen({Key? key}) : super(key: key);

  @override
  State<QuotesEditScreen> createState() => _QuotesEditScreenState();
}

class _QuotesEditScreenState extends State<QuotesEditScreen> {
  int colorbgindex = 0, fontcolor = 1;
  bool bold = false;
  bool italic = false;
  TextAlign txtAlign = TextAlign.center;

  @override
  Widget build(BuildContext context) {
    QuotesModel model =
        ModalRoute.of(context)!.settings.arguments as QuotesModel;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      if (colorbgindex < colorbg.length - 1) {
                        colorbgindex++;
                      } else {
                        colorbgindex = 0;
                      }
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: colorbg[colorbgindex],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${model.quotes}",
                          textAlign: txtAlign,
                          style: GoogleFonts.playfairDisplay(
                              color: colorbg[fontcolor],
                              fontSize: 30,
                              fontWeight:
                                  bold ? FontWeight.bold : FontWeight.normal,
                              fontStyle:
                                  italic ? FontStyle.italic : FontStyle.normal),
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.4,
                    width: MediaQuery.of(context).size.width * 0.98,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15)),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        txtAlign = TextAlign.left;
                                      });
                                    },
                                    icon: const Icon(Icons.format_align_left,color: Colors.white,)),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        txtAlign = TextAlign.center;
                                      });
                                    },
                                    icon: const Icon(Icons.format_align_center,color: Colors.white)),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        txtAlign = TextAlign.right;
                                      });
                                    },
                                    icon: const Icon(Icons.format_align_right,color: Colors.white)),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (fontcolor < colorbg.length - 1) {
                                        fontcolor++;
                                      } else {
                                        fontcolor = 0;
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.color_lens,color: Colors.white),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      Clipboard.setData(
                                          ClipboardData(text: "${model.quotes}"));
                                    });
                                  },
                                  icon: const Icon(Icons.copy,color: Colors.white),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      bold = !bold;
                                    });
                                  },
                                  icon: const Icon(Icons.format_bold_sharp,color: Colors.white),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      italic = !italic;
                                    });
                                  },
                                  icon: const Icon(Icons.format_italic,color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 100,
                              child: ListView.builder(itemCount: imageList.length,
                                itemExtent: 100,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.all(10),
                                    height: MediaQuery.of(context).size.height*0.2,
                                    width: MediaQuery.of(context).size.width*0.2,
                                    child: Image.asset("assets/img/bg/${imageList[index]}"),
                                  );
                                },),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
