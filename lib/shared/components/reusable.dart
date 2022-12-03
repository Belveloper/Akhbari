import 'dart:async';

import 'package:flutter/material.dart';


Widget buildArticleItem(dynamic article)=>  Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      article['urlToImage']!=null ?Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          image: DecorationImage(
            image: NetworkImage(
                '${article['urlToImage']}',

            ),
            fit: BoxFit.cover,
          ),
        ),
      ):SizedBox(
        width: 110,
          child: Column(
            children: [
              Icon(Icons.error_outlined,color: Colors.red,),
              SizedBox(height: 5,),
              Text('No image',style: TextStyle(wordSpacing: 3,fontWeight: FontWeight.w100),),
            ],
          )),
      SizedBox(width: 20.0,),
      Expanded(
        child: Container(
          height: 120.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Text('${article['title']}',maxLines: 3,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18.0),)),
              Text('${article['publishedAt'].toString().replaceAll('T', ' ').replaceAll('Z', ' ')}',maxLines: 3,style: TextStyle(color: Colors.grey),),
            ],
          ),
        ),
      )
    ],
  ),
);