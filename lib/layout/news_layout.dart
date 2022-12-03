import 'package:akhbari/shared/cubit/cubit.dart';
import 'package:akhbari/shared/cubit/states.dart';
import 'package:akhbari/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness()..getSports()..getScience(),
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text('Akhbari'),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(onPressed:(){},icon: Icon(Icons.search_outlined,size: 30,)),
                  ),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index){
                 cubit.changeBottomNavIndex(index);
                },
                items:cubit.bottomItems,

              ),
              body: cubit.screens[cubit.currentIndex],
            );
          }),
    );
  }
}
