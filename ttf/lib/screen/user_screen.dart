import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userList = (ModalRoute.of(context)!.settings.arguments
        as List<Map<String, dynamic>>)[0];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                './asset/image/logo.png',
                fit: BoxFit.cover,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
            ],
          ),
        ),
        centerTitle: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Color(0xFFBA68C8),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Expanded(
                  flex: 6,
                  child: Image.asset(
                    userList['img'],
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Color(0xFFBA68C8),
                          Colors.white,
                        ])),
                    child: Column(
                      children: [
                        Text(
                          userList['age'],
                          style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.purple),
                        ),
                        Text(
                          userList['name'],
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.purple[700]),
                        ), 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '평점',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.purple[700]),
                            ),
                            Text(
                              userList['rate'],
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.purple[700]),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _Rating(
                              userList: userList,
                              rate: 0.5,
                            ),
                            _Rating(
                              userList: userList,
                              rate: 1,
                            ),
                            _Rating(
                              userList: userList,
                              rate: 1.5,
                            ),
                            _Rating(
                              userList: userList,
                              rate: 2,
                            ),
                            _Rating(
                              userList: userList,
                              rate: 2.5,
                            ),
                            _Rating(
                              userList: userList,
                              rate: 3,
                            ),
                            _Rating(
                              userList: userList,
                              rate: 3.5,
                            ),
                            _Rating(
                              userList: userList,
                              rate: 4,
                            ),
                            _Rating(
                              userList: userList,
                              rate: 4.5,
                            ),
                            _Rating(
                              userList: userList,
                              rate: 5,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Rating extends StatelessWidget {
  final userList;
  final rate;
  const _Rating({
    required this.userList,
    required this.rate,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pop(
            {
              "idx" : userList['idx'],
              "rate" : rate,
            }
        );
      },
      child: Container(
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        )
        ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${rate}',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold
              ),

            ),
          ],
        ),
      ),
    );
  }
}
