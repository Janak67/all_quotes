class QuotesModel {
  String? quotes, author, category;

  QuotesModel({this.quotes, this.author, this.category});

  factory QuotesModel.formMap(Map m1) {
    QuotesModel q1 = QuotesModel(
        quotes: m1['quotes'], author: m1['author'], category: m1['category']);
    return q1;
  }
}
