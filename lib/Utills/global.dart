import 'package:all_quotes/Model/category_model.dart';
import 'package:flutter/material.dart';

import '../Model/quotes_model.dart';

class Global {
  static Global g1 = Global();

  List<CategoryModel> categoryList = [
    CategoryModel(
        name: "Motivation",image: "assets/img/motivation.png",color: Colors.amber),
    CategoryModel(
        name: "Single",image: "assets/img/single.png",color: Colors.brown.shade300),
    CategoryModel(
        name: "Lonely", image: "assets/img/lonely.png", color: Colors.blue),
    CategoryModel(
        name: "Attitude",image: "assets/img/attitude.png",color: Colors.brown.shade900),
    CategoryModel(
        name: "Happiness",image: "assets/img/happiness.png",color: Colors.pink.shade200),
    CategoryModel(
        name: "Sad", image: "assets/img/sad.png", color: Colors.brown.shade300),
    CategoryModel(
        name: "Funny", image: "assets/img/funny.png", color: Colors.red),
    CategoryModel(
        name: "Beautiful",image: "assets/img/beautiful.png",color: Colors.deepOrangeAccent),
    CategoryModel(
        name: "Best", image: "assets/img/best.png", color: Colors.green),
    CategoryModel(
        name: "Work", image: "assets/img/work.png", color: Colors.deepPurple),
    CategoryModel(
        name: "Romentic",image: "assets/img/romance.png",color: Colors.red.shade900),
    CategoryModel(
        name: "Love",image: "assets/img/love.png",color: Colors.brown.shade700),
    CategoryModel(
        name: "Success",image: "assets/img/success.png",color: Colors.pink.shade200),
    CategoryModel(
        name: "Thinking",image: "assets/img/thinking.png",color: Colors.brown.shade300),
    CategoryModel(
        name: "Sorry", image: "assets/img/sorry.png", color: Colors.amber),
    CategoryModel(
        name: "Smile",image: "assets/img/smile.png",color: Colors.brown.shade300),
  ];

  String? categoryName;

  List<Map> quotesList = [
    {"quotes":
          "” The road to success and the road to failure are almost exactly the same. ”",
      "author": "Colin R. Davis","category": "Single","color": Colors.cyanAccent
    },
    {"quotes":
          "” Success usually comes to those who are too busy looking for it. ”",
      "author": "Henry David Thoreau","category": "Love","color": Colors.cyanAccent
    },
    {"quotes":
          "” Discouragement and failure are two of the surest stepping stones to success. ”",
      "author": "Dale Carnegie","category": "Thinking","color": Colors.brown
    },
    {"quotes": "” I never dreamed about success. I worked for it. ”",
      "author": "Estée Lauder","category": "Success","color": Colors.blueGrey
    },
    {"quotes":
          "” It is better to fail in originality than to succeed in imitation. ”",
      "author": "Herman Melville","category": "Motivation","color": Colors.red
    },
    {"quotes": "“ He who conquers himself is the mightiest warrior. ”",
      "author": "Confucius","category": "Motivation","color": Colors.brown
    },
    {"quotes": "“ One man with courage makes a majority. ”",
      "author": "Andrew Jackson","category": "Motivation","color": Colors.pink
    },
    {"quotes": "“ When I believe in something, I’m like a dog with a bone. ”",
      "author": "Melissa McCarthy","category": "Motivation","color": Colors.indigo
    },
    {"quotes": "“ The standard you walk past, is the standard you accept. ”",
      "author": "David Hurley","category": "Motivation","color": Colors.amber
    },
    {"quotes":
          "” The road to success and the road to failure are almost exactly the same. ”",
      "author": "Colin R. Davis","category": "Single","color": Colors.deepPurpleAccent
    },
    {"quotes": "“ I'm single because I was born that way. ”",
      "author": "Mae West","category": "Single","color": Colors.green
    },
    {"quotes":
          "“ You know, a heart can be broken, but it keeps on beating, just the same. “",
      "author": "Fannie Flagg","category": "Sad","color": Colors.grey
    },
    {"quotes":
          "“ Awful pain that comes with loving someone more than they love you. “",
      "author": "Steve Maraboli","category": "Sad","color": Colors.blueGrey
    },
    {"quotes":
          "“ I'm sick of following my dreams, man. I'm just going to ask where they're going. ”",
      "author": "Mitch Hedberg","category": "Funny","color": Colors.blue
    },
    {"quotes":
          "” Success usually comes to those who are too busy looking for it. ”",
      "author": "Henry David Thoreau","category": "Lonely","color": Colors.red
    },
    {"quotes":
          "” It’s that heart of gold and stardust soul that makes you beautiful. ”",
      "author": "R.M. Broderick","category": "Beautiful","color": Colors.orange
    },
    {"quotes":
          "” Tumhara result decide nahi karta hai ki tum loser ho ki nahi. ”",
      "author": "3 Idiots","category": "Best","color": Colors.lightGreen
    },
    {"quotes":
          "” If you do not change direction, you may end up where you are heading. ”",
      "author": "Lao Tzu","category": "Work","color": Colors.indigo
    },
    {"quotes":
          "” Love is patient, love is kind. It does not envy, it does not boast, it is not proud. ”",
      "author": "1 Corinthians 13","category": "Romentic","color": Colors.red
    },
    {"quotes":
          "” Discouragement and failure are two of the surest stepping stones to success. ”",
      "author": "Dale Carnegie","category": "Attitude","color": Colors.indigo
    },
    {"quotes": "” I never dreamed about success. I worked for it. ”",
      "author": "Estée Lauder","category": "Happiness","color": Colors.red
    },
    {"quotes": "” Everything is my fault, I'll take the blame. ”",
      "author": "Nirvana","category": "Sorry","color": Colors.blueGrey
    },
    {"quotes":
          "” The human race has one really effective weapon, and that is laughter. ”",
      "author": "Mark Twain.","category": "Smile","color": Colors.green
    },
  ];

  List<QuotesModel> modelList = [];
}
