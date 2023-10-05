import 'package:all_quotes/Model/quotes_model.dart';
import 'package:all_quotes/Utills/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({Key? key}) : super(key: key);

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  @override
  Widget build(BuildContext context) {
    List<QuotesModel> dataList =
        ModalRoute.of(context)!.settings.arguments as List<QuotesModel>;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "${Global.g1.categoryName}",
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  QuotesModel model = dataList[index];
                  Navigator.pushNamed(context, 'edit',arguments: model);
                },
                child: quotesTile(
                  dataList[index],
                ),
              )),
    ));
  }

  Container quotesTile(QuotesModel q1) {
    return Container(
      margin: const EdgeInsets.all(15),
      height: 280,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: q1.color),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "${q1.quotes}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "${q1.author}",
                style: GoogleFonts.martianMono(fontSize: 18,color: Colors.white),
              ),
            ),
            const SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.download_sharp),
                const Icon(Icons.image_search),
                const Icon(Icons.color_lens),
                InkWell(onTap: (){setState(() {
                  Clipboard.setData(ClipboardData(text: "${q1.quotes}"));
                });},child: const Icon(Icons.copy)),
                const Icon(Icons.fullscreen,size: 30,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
