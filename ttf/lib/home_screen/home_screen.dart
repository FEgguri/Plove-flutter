import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ttf/component/user_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var count = 1;
  List<Map<String, String>> proList = [
    {
      "key": '1',
      "img": 'asset/image/proflie/people_1.png',
      "name": "robin",
      "age": '23',
    },
    {
      "key": '2',
      "img": 'asset/image/proflie/people_2.png',
      "name": "jasi",
      "age": '34',
    },
    {
      "key": '3',
      "img": 'asset/image/proflie/people_3.png',
      "name": "robert",
      "age": '34',
    },
    {
      "key": '4',
      "img": 'asset/image/proflie/people_4.png',
      "name": "teemo",
      "age": '17',
    },
    {
      "key": '5',
      "img": 'asset/image/proflie/people_5.png',
      "name": "jinger",
      "age": '25',
    },
    {
      "key": '6',
      "img": 'asset/image/proflie/people_6.png',
      "name": "pola",
      "age": '23',
    },
    {
      "key": '7',
      "img": 'asset/image/proflie/people_7.png',
      "name": "rubi",
      "age": '25',
    },
    {
      "key": '8',
      "img": 'asset/image/proflie/people_8.png',
      "name": "trip",
      "age": '33',
    },
    {
      "key": '9',
      "img": 'asset/image/proflie/people_9.png',
      "name": "tom",
      "age": '31',
    },
    {
      "key": '10',
      "img": 'asset/image/proflie/people_10.png',
      "name": "rabet",
      "age": '35',
    },
    {
      "key": '11',
      "img": 'asset/image/proflie/people_11.png',
      "name": "jeager",
      "age": '28',
    },
    {
      "key": '12',
      "img": 'asset/image/proflie/people_12.png',
      "name": "sora",
      "age": '25',
    },
    {
      "key": '13',
      "img": 'asset/image/proflie/people_13.png',
      "name": "hubo",
      "age": '21',
    },
    {
      "key": '14',
      "img": 'asset/image/proflie/people_14.png',
      "name": "rachat",
      "age": '27',
    },
    {
      "key": '15',
      "img": 'asset/image/proflie/people_15.png',
      "name": "jijo",
      "age": '30',
    },
  ];

  List<Map> usedList = [];
  List<Map> viewList = [];
  List<Map> stayList = [];

  ArrayListFilter() {
    if (stayList.length == 0) {
      stayList.addAll(proList);
    }
    if (usedList.length >= proList.length) {
      usedList.clear();
    }

    stayList.clear();
    stayList.addAll(proList);
    usedList.forEach((v) {
      stayList.removeWhere((e) => e['key'] == v['key']);
    });

    stayList.shuffle();
    viewList.clear();

    for (int i = 0; i < 5; i++) {
      viewList.add(stayList[i]);
    }
    usedList.addAll(viewList);
  }

  var now = DateTime.now();

  @override
  void initState() {
    ArrayListFilter();
    Timer.periodic(Duration(seconds: 1), (v) {
      setState(() {
        now = DateTime.now();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var secount = 60 - now.second;
    if (secount == 60) {
      ArrayListFilter();
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              './asset/image/logo.png',
              fit: BoxFit.cover,
            ),
            _btnChange(
              changeList: changeList,
              count: count,
            ),

          ],
        ),
        centerTitle: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            _Timeleft(
              now: secount,
            ),
            SizedBox(
              height: 30.0,
            ),
            _ListOperater(
              viewList: viewList,
            ),

          ],
        ),
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * 0.09,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
            color: Colors.grey,
            width: 0.8,
          ))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('소개'),
              Text('관심카드'),
              Text('라운지'),
              Text('프로필평가'),
              Text('더보기'),
            ],
          ),
        ),
      ),
    );
  }

  void changeList() {
    setState(() {
      ArrayListFilter();
      count++;
    });
  }
}



class _Timeleft extends StatelessWidget {
  final now;

  const _Timeleft({required this.now, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: Text(
          '다음소개까지 남은 시간 ${now}',
          style: TextStyle(
            color: Color.fromRGBO(89, 57, 89, 1),
            fontFamily: 'NotoSans',
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}

class _btnChange extends StatelessWidget {
  final changeList;
  final count;
  const _btnChange({
    required this.changeList,
    required this.count,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
          this.changeList();
        },
        child: Container(
          width: 68,
          height: 28,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset('asset/image/like_pupple.svg',
                    semanticsLabel: 'vector'),
                Text('$count'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileLIst extends StatelessWidget {
  final VoidCallback onTap;
  final userImg;
  final userName;
  const _ProfileLIst(
      {required this.onTap,
      required this.userImg,
      required this.userName,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.28,
        height: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.purple,
          image: DecorationImage(
            image: AssetImage(
              userImg,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )),
            child: Text(
              userName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.purple,
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ListOperater extends StatelessWidget {
  final viewList;

  const _ListOperater({
    required this.viewList,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        direction: Axis.horizontal,
        spacing: 10,
        runSpacing: 10,
        children: [
          ...viewList.map(
                (e) => _ProfileLIst(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => UserScreen(),
                    settings: RouteSettings(arguments: [
                      {
                        'key': '${e['key']}',
                        'age': '${e['age']}',
                        'name': '${e['name']}',
                        'img': '${e['img']}',
                      }
                    ])));
              },
              userImg: e['img'],
              userName: e['name'],
            ),
          )
        ],
      ),
    );
  }
}
