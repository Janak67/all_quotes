import 'package:all_quotes/Model/QuotesModel.dart';
import 'package:all_quotes/Model/categoryModel.dart';
import 'package:flutter/material.dart';
import '../Utills/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "All Best English Quotes",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 130),
        itemCount: Global.g1.categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              List<QuotesModel> dataList = [];
              Navigator.pushNamed(context, 'quotes');
            },
            child: quotesTile(index),
          );
        }
    ),
    ),
    );
  }

  Container quotesTile(int index) {
    return Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Global.g1.categoryList[index].color, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${Global.g1.categoryList[index].name}",
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  "${Global.g1.categoryList[index].image}",
                  height: 60,
                  width: 60,
                ),
              )
            ],
          ),
        ));
  }
}
