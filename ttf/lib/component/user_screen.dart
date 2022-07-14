import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userList =  (ModalRoute.of(context)!.settings.arguments as List<Map<String, dynamic>>)[0];
    print(userList);
    print(userList['age']);
    

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
                              fontSize: 40.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.purple),
                        ),
                        Text(
                          userList['name'],
                          style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.purple[700]),
                        ),
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
