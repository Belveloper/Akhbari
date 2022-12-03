import 'package:akhbari/layout/news_layout.dart';
import 'package:akhbari/shared/bloc_observer.dart';
import 'package:akhbari/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  Bloc.observer=MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          backwardsCompatibility: false,
          backgroundColor: Colors.white,
          elevation: 0.0,
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          elevation: 20.0,
        ),
        primarySwatch: Colors.deepOrange,
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.grey,
      ),
      themeMode: ThemeMode.light,
      home: Directionality(textDirection: TextDirection.rtl,
      child: NewsLayout()),
    );
  }
}
