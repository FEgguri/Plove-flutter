

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:path/path.dart';
import 'package:ttf/screen/myinfo_screen.dart';
import 'package:ttf/screen/rounge_screen.dart';
import 'package:ttf/screen/roungefront_screen.dart';
import 'package:ttf/database/drift_database.dart';
import 'package:ttf/screen/content_view_screen.dart';
import 'screen/history_like_screen.dart';
import 'screen/user_screen.dart';
import 'screen/home_screen.dart';

const  PROLIST = [
  {
    "idx": '1',
    "img": 'asset/image/proflie/people_1.png',
    "name": "robin",
    "age": '23',
    "rate": "3"
  },
  {
    "idx": '2',
    "img": 'asset/image/proflie/people_2.png',
    "name": "jasi",
    "age": '34',
    "rate": "2.5"
  },
  {
    "idx": '3',
    "img": 'asset/image/proflie/people_3.png',
    "name": "robert",
    "age": '34',
    "rate": "4"
  },
  {
    "idx": '4',
    "img": 'asset/image/proflie/people_4.png',
    "name": "teemo",
    "age": '17',
    "rate": "1.5"
  },
  {
    "idx": '5',
    "img": 'asset/image/proflie/people_5.png',
    "name": "jinger",
    "age": '25',
    "rate": "2"
  },
  {
    "idx": '6',
    "img": 'asset/image/proflie/people_6.png',
    "name": "pola",
    "age": '23',
    "rate": "4.5"
  },
  {
    "idx": '7',
    "img": 'asset/image/proflie/people_7.png',
    "name": "rubi",
    "age": '25',
    "rate": "5"
  },
  {
    "idx": '8',
    "img": 'asset/image/proflie/people_8.png',
    "name": "trip",
    "age": '33',
    "rate": "3.5"
  },
  {
    "idx": '9',
    "img": 'asset/image/proflie/people_9.png',
    "name": "tom",
    "age": '31',
    "rate": "2"
  },
  {
    "idx": '10',
    "img": 'asset/image/proflie/people_10.png',
    "name": "rabet",
    "age": '35',
    "rate": "1"
  },
  {
    "idx": '11',
    "img": 'asset/image/proflie/people_11.png',
    "name": "jeager",
    "age": '28',
    "rate": "1.5"
  },
  {
    "idx": '12',
    "img": 'asset/image/proflie/people_12.png',
    "name": "sora",
    "age": '25',
    "rate": "3"
  },
  {
    "idx": '13',
    "img": 'asset/image/proflie/people_13.png',
    "name": "hubo",
    "age": '21',
    "rate": "2"
  },
  {
    "idx": '14',
    "img": 'asset/image/proflie/people_14.png',
    "name": "rachat",
    "age": '27',
    "rate": "2.5"
  },
  {
    "idx": '15',
    "img": 'asset/image/proflie/people_15.png',
    "name": "jijo",
    "age": '30',
    "rate": "4"
  },
];





void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting;

  final database = LocalDatabase();
  GetIt.I.registerSingleton<LocalDatabase>(database);
  //final list =await database.contents;
  //print(database);











  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/userscreen': (context) => UserScreen(),
        '/historyScreen': (context) => History(),
        '/myinfo' : (context) => MyInfoScreen(),
        '/rounge' : (context) => RoungeScreen(),
        '/rounge/front' : (context) => RoungeFront(),
        '/rounge/front/contentview': (context) => ContentViewScreen(),
      },
    ),
  );
}
