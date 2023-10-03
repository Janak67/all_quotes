import 'package:all_quotes/Screens/home_screen.dart';
import 'package:all_quotes/Screens/quotes_screen.dart';
import 'package:flutter/material.dart';

import '../Screens/splash_screen.dart';

Map<String, WidgetBuilder> screenroutes = {
  '/': (context) => SplashScreen(),
  'home': (context) => HomeScreen(),
  'quotes':(context) => QuotesScreen(),
};
