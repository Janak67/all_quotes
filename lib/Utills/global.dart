import 'package:all_quotes/Model/categoryModel.dart';
import 'package:flutter/material.dart';

import '../Model/QuotesModel.dart';

class Global {
  static Global g1 = Global();

  List<CategoryModel>categoryList=[
    CategoryModel(name: "Motivation",image: "assets/img/motivation.png",color: Colors.amber),
    CategoryModel(name: "Single",image: "assets/img/single.png",color: Colors.brown),
    CategoryModel(name: "Lonely",image: "assets/img/lonely.png",color: Colors.blue),
    CategoryModel(name: "Attitude",image: "assets/img/attitude.png",color: Colors.green),
    CategoryModel(name: "Happiness",image: "assets/img/happiness.png",color: Colors.amber),
    CategoryModel(name: "Sad",image: "assets/img/sad.png",color: Colors.amber),
    CategoryModel(name: "Funny",image: "assets/img/funny.png",color: Colors.amber),
    CategoryModel(name: "Beautiful",image: "assets/img/beautiful.png",color: Colors.amber),
    CategoryModel(name: "Best",image: "assets/img/best.png",color: Colors.amber),
    CategoryModel(name: "Work",image: "assets/img/work.png",color: Colors.amber),
    CategoryModel(name: "Romentic",image: "assets/img/romance.png",color: Colors.amber),
    CategoryModel(name: "Love",image: "assets/img/love.png",color: Colors.amber),
    CategoryModel(name: "Success",image: "assets/img/success.png",color: Colors.amber),
    CategoryModel(name: "Thinking",image: "assets/img/thinking.png",color: Colors.amber),
    CategoryModel(name: "Sorry",image: "assets/img/sorry.png",color: Colors.amber),
    CategoryModel(name: "Smile",image: "assets/img/smile.png",color: Colors.amber),
  ];

  List<QuotesModel> modelList = [];
}
