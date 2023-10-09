import 'package:all_quotes/Model/quotes_model.dart';
import 'package:all_quotes/Utills/app_color.dart';
import 'package:all_quotes/Utills/image_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class QuotesEditScreen extends StatefulWidget {
  const QuotesEditScreen({Key? key}) : super(key: key);

  @override
  State<QuotesEditScreen> createState() => _QuotesEditScreenState();
}

class _QuotesEditScreenState extends State<QuotesEditScreen> {
  int colorbgindex = 0, fontcolor = 2, image = 0;
  bool bold = false;
  bool italic = false;
  TextAlign txtAlign = TextAlign.center;
  bool isimageindex = true;
  int fontStyle = 0;

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
              Stack(
                alignment: Alignment.center,
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
                      height: MediaQuery.of(context).size.height * 0.65,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: colorbg[colorbgindex],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isimageindex,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isimageindex = false;
                        });
                      },
                      child: Image.asset(
                        "assets/img/bg/${imageList[image]}",
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.69,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${model.quotes}",
                        textAlign: txtAlign,
                        style: TextStyle(
                            fontFamily: fontList[fontStyle],
                            color: colorbg[fontcolor],
                            fontSize: 30,
                            fontWeight:
                                bold ? FontWeight.bold : FontWeight.normal,
                            fontStyle:
                                italic ? FontStyle.italic : FontStyle.normal),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.27,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    txtAlign = TextAlign.left;
                                  });
                                },
                                icon: const Icon(
                                  Icons.format_align_left,
                                  color: Colors.black,
                                )),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    txtAlign = TextAlign.center;
                                  });
                                },
                                icon: const Icon(Icons.format_align_center,
                                    color: Colors.black)),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    txtAlign = TextAlign.right;
                                  });
                                },
                                icon: const Icon(Icons.format_align_right,
                                    color: Colors.black)),
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
                              icon: const Icon(Icons.color_lens,
                                  color: Colors.black),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  Clipboard.setData(
                                      ClipboardData(text: "${model.quotes}"));
                                });
                              },
                              icon: const Icon(Icons.copy, color: Colors.black),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  bold = !bold;
                                });
                              },
                              icon: const Icon(Icons.format_bold_sharp,
                                  color: Colors.black),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  italic = !italic;
                                });
                              },
                              icon: const Icon(Icons.format_italic,
                                  color: Colors.black),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  colorbgindex = 0;
                                  fontcolor = 2;
                                  image = 0;
                                  bold = false;
                                  italic = false;
                                  txtAlign = TextAlign.center;
                                  isimageindex = true;
                                  fontStyle=0;
                                });
                              },
                              icon: const Icon(Icons.restart_alt,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          itemCount: imageList.length,
                          itemExtent: 100,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isimageindex = true;
                                      image = index;
                                    });
                                  },
                                  child: Image.asset(
                                    "assets/img/bg/${imageList[index]}",
                                    fit: BoxFit.cover,
                                  )),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: fontList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  fontStyle = index;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Hello",
                                  style: TextStyle(
                                      fontSize: 25, fontFamily: fontList[index]),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
