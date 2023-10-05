import 'package:all_quotes/Model/quotes_model.dart';
import 'package:all_quotes/Utills/global.dart';
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
  bool first = true;

  @override
  Widget build(BuildContext context) {
    QuotesModel model =
        ModalRoute.of(context)!.settings.arguments as QuotesModel;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "${Global.g1.categoryName}",
            style: const TextStyle(color: Colors.white),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_drop_down,
                size: 30,
                color: Colors.white,
              )),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  color: !first ? Colors.indigo : Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${model.quotes}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.playfairDisplay(color: Colors.black,fontSize: 30),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(color: Colors.grey.shade400,borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(onPressed: () {}, icon: Icon(Icons.download),),
                                IconButton(onPressed: () {}, icon: Icon(Icons.image),),
                                IconButton(onPressed: () {setState(() {
                                  first=!first;
                                });}, icon: const Icon(Icons.color_lens),),
                                IconButton(onPressed: () {setState(() {
                                  Clipboard.setData(ClipboardData(text: "${model.quotes}"));
                                });}, icon: const Icon(Icons.copy),),
                                IconButton(onPressed: () {}, icon: Icon(Icons.share),),
                                LikeButton()
                              ],
                            ),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
