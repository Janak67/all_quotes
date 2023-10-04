import 'package:all_quotes/Model/quotes_model.dart';
import 'package:flutter/material.dart';
import '../Utills/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Global.g1.quotesList.map((e) {
      QuotesModel q1 = QuotesModel.formMap(e);
      Global.g1.modelList.add(q1);
    }).toList();
  }

  bool isGrid = false;

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
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isGrid = !isGrid;
                  });
                },
                icon: Icon(isGrid ? Icons.list : Icons.grid_view))
          ],
        ),
        body: isGrid
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 130),
                itemCount: Global.g1.categoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        List<QuotesModel> dataList = [];
                        Global.g1.categoryName =
                            Global.g1.categoryList[index].name;
                        for (var x in Global.g1.modelList) {
                          if (x.category ==
                              Global.g1.categoryList[index].name) {
                            dataList.add(x);
                          }
                        }
                        Navigator.pushNamed(context, 'quotes',
                            arguments: dataList);
                      },
                      child: quotesTile(index));
                })
            : ListView.builder(
                itemCount: Global.g1.categoryList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        List<QuotesModel> dataList = [];
                        Global.g1.categoryName =
                            Global.g1.categoryList[index].name;
                        for (var x in Global.g1.modelList) {
                          if (x.category ==
                              Global.g1.categoryList[index].name) {
                            dataList.add(x);
                          }
                        }
                        Navigator.pushNamed(context, 'quotes',
                            arguments: dataList);
                      },
                      child: quotesTile(index));
                },
              ),
      ),
    );
  }

  Container quotesTile(int index) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Global.g1.categoryList[index].color,
            borderRadius: BorderRadius.circular(10)),
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
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                "${Global.g1.categoryList[index].image}",
                height: 50,
                width: 60,
              ),
            )
          ],
        ));
  }
}
