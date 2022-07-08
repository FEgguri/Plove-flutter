import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var count = 1;

  List<String> proList = [
    'asset/image/proflie/people_1.png',
    'asset/image/proflie/people_2.png',
    'asset/image/proflie/people_3.png',
    'asset/image/proflie/people_4.png',
    'asset/image/proflie/people_5.png',
    'asset/image/proflie/people_6.png',
    'asset/image/proflie/people_7.png',
    'asset/image/proflie/people_8.png',
    'asset/image/proflie/people_9.png',
    'asset/image/proflie/people_10.png',
    'asset/image/proflie/people_11.png',
    'asset/image/proflie/people_12.png',
    'asset/image/proflie/people_13.png',
    'asset/image/proflie/people_14.png',
    'asset/image/proflie/people_15.png',
  ];

  List<String> usedList = [];
  List<String> viewList = [];
  List<String> stayList = [];

  ProList() {
    if (stayList.length == 0) {
      stayList.addAll(proList);
    }
    if (usedList.length >= proList.length) {
      usedList.clear();
    }

    stayList.clear();
    stayList.addAll(proList);
    usedList.forEach((v) {
      stayList.remove('$v');
    });

    stayList.shuffle();
    viewList.clear();

    for (int i = 0; i < 5; i++) {
      viewList.add(stayList[i]);
    }
    usedList.addAll(viewList);
    print(usedList);
  }

  @override
  Widget build(BuildContext context) {
    ProList();

    //print('$del  STAY: $stayList VIEW: $viewList');

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          './asset/image/logo.png',
          fit: BoxFit.cover,
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          height: 250.0,
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              _btnStyle(),
              _List(
                viewList: viewList,
              ),
              _btnChange(
                changeList: changeList,
                  count:count,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeList() {
    setState(() {
      proList.shuffle();
      count++;
    });
  }
}

class _btnStyle extends StatelessWidget {
  const _btnStyle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '데일리 카드',
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

class _List extends StatelessWidget {
  final viewList;
  const _List({
    required this.viewList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ...viewList.map(
              (e) => Container(
                width: 128,
                height: 148,
                margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      '$e',
                    ),
                  ),
                ),
              ),
            ),
          ],
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
      margin: EdgeInsets.only(
        right: 20.0,
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        child: TextButton(
          onPressed: () {
            this.changeList();
            print('tab');
          },
          child: Container(
            width: 68,
            height: 28,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    width: 1, color: Color.fromRGBO(125, 100, 189, 1))),
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
      ),
    );
  }
}
