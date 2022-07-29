import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ttf/database/drift_database.dart';

class ContentViewScreen extends StatelessWidget {
  const ContentViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pushId = (ModalRoute.of(context)?.settings.arguments);



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
      body: Container(
        decoration: BoxDecoration(
          color: Colors.purple[300],

        ),
        padding: EdgeInsets.all(20.0),
        child: StreamBuilder<List<Content>>(
            stream: GetIt.I<LocalDatabase>().watchContents(),
            builder: (context, snapshot) {
              List contents = [];

              if (snapshot.hasData) {
                contents = snapshot.data!
                    .where((element) => element.id == pushId).toList().toList();

              }
              final String title = contents[0].title;
              final String innercontent = contents[0].innercontent;


              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.purple[100],
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    child: Text(title),
                  ),
                  Container(
                    width: double.infinity,
                    height: 300,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.purple[200],
                        border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      )
                    ),
                    child: Text(innercontent),
                  ),
                ],
              );
            }),
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
