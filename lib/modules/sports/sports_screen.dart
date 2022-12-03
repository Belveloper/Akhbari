import 'package:akhbari/shared/components/reusable.dart';
import 'package:akhbari/shared/cubit/cubit.dart';
import 'package:akhbari/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          var list =cubit.sports;

          return cubit.business.length > 0
              ? ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildArticleItem(list[index]),
              separatorBuilder: (context, index) => Divider(),
              itemCount: list.length)
              : Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10,),
              Text('...Loading',),
            ],
          ));
        });
  }
}
