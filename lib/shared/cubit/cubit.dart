import 'package:akhbari/modules/business/business_screen.dart';
import 'package:akhbari/modules/science/science_screen.dart';
import 'package:akhbari/modules/settings/settings.dart';
import 'package:akhbari/modules/sports/sports_screen.dart';
import 'package:akhbari/shared/cubit/states.dart';
import 'package:akhbari/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> screens =[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_outlined), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports_outlined), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science_outlined), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: 'Settings'),
  ];

  void changeBottomNavIndex(int index){
    currentIndex=index;
    emit(NewsBottomNavlState());
  }

  List business =[];
  List sports =[];
  List science =[];
  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url:'v2/top-headlines' ,query:{
      'country':'eg',
      'category':'business',
      'apiKey':'693215a9a40f4e57acae85d25d39f265'
    } ).then((value) => {
      //print(value.data['totalResults']),
      business=value.data['articles'],
      print(business[0]['title']),
      emit(NewsGetBusinessSucessState())
    }).onError((error, stackTrace) => {
      emit(NewsGetBusinessErrorState()),

      print(error.toString())});
  }
  void getSports(){
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(url:'v2/top-headlines' ,query:{
      'country':'eg',
      'category':'sports',
      'apiKey':'693215a9a40f4e57acae85d25d39f265'
    } ).then((value) => {
      //print(value.data['totalResults']),
      sports=value.data['articles'],
      print(sports[0]['title']),
      emit(NewsGetSportsSucessState())
    }).onError((error, stackTrace) => {
      emit(NewsGetSportsErrorState()),

      print(error.toString())});
  }
  void getScience(){
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(url:'v2/top-headlines' ,query:{
      'country':'eg',
      'category':'science',
      'apiKey':'693215a9a40f4e57acae85d25d39f265'
    } ).then((value) => {
      //print(value.data['totalResults']),
      science=value.data['articles'],
      print(science[0]['title']),
      emit(NewsGetScienceSucessState())
    }).onError((error, stackTrace) => {
      emit(NewsGetScienceErrorState()),

      print(error.toString())});
  }

}
