import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ttf/database/drift_database.dart';

import '../component/addcontents.dart';

class RoungeFront extends StatefulWidget {
  const RoungeFront({Key? key}) : super(key: key);

  @override
  State<RoungeFront> createState() => _RoungeFrontState();
}

class _RoungeFrontState extends State<RoungeFront> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[300],
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) {
                return AddContent();
              });
        },
        child: Text('글쓰기'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              './asset/image/logo.png',
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ],
        ),
        centerTitle: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 50.0,
                bottom: 40.0,
              ),
              child: Text(
                'PLOVE 라운지',
                style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.purple[300],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<List<Content>>(
                  stream: GetIt.I<LocalDatabase>().watchContents(),
                  builder: (context, snapshot) {

                    List<Content> contents = [];
                    if (snapshot.hasData) {
                      contents = snapshot.data!.toList();
                      contents.sort((a,b)=> b.id.compareTo(a.id));
                    }


                    return ListView.separated(
                      scrollDirection: Axis.vertical,
                        itemCount: contents.length,

                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 8.0,
                          );
                        },
                        itemBuilder: (context, index) {
                          final content = contents[index];
                          return GestureDetector(
                            onTap: (){
                              Navigator.of(context).pushNamed('/rounge/front/contentview',
                                  arguments:content.id
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.purple,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(16.0))
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 300.0,
                                    height: 20.0,
                                    child: Text(content.title,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),),
                                  ),
                                  Container(
                                      width: 50.0,
                                      child: Text('번호 ${content.id.toString()}',
                                      style: TextStyle(
                                        fontSize: 10.0
                                      ),),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }),
            ),
            SizedBox(
              height: 65.0,
            )
          ],
        ),
      ),
      bottomSheet: _Bottom(),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/');
                },
                child: Text('소개')),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/historyScreen',
                  arguments: {},
                );
              },
              child: Text('관심카드'),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/rounge');
                },
                child: Text('라운지')),
            Text('프로필평가'),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/myinfo',
                  );
                },
                child: Text('내정보')),
          ],
        ),
      ),
    );
  }
}
