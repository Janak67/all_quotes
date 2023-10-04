import 'package:flutter/material.dart';

class QuotesModel {
  String? quotes, author, category;
  Color? color;

  QuotesModel({this.quotes, this.author, this.category, this.color});

  factory QuotesModel.formMap(Map m1) {
    QuotesModel q1 = QuotesModel(
        quotes: m1['quotes'],
        author: m1['author'],
        category: m1['category'],
        color: m1['color']);
    return q1;
  }
}
