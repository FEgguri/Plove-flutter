import 'package:flutter/material.dart';

class MyInfoScreen extends StatelessWidget {
  const MyInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,

          decoration: BoxDecoration(color: Colors.grey[200]),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                height: 70.0,
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('기본정보'),
                        Text('프로필사진'),
                        Text('자기 소개'),
                        Text('스토리'),
                      ],
                    ),
                  ),
                ),
              ),
              _ListContainer(
                content: Column(
                  children: [
                    _InfoList(
                      imgurl: 'asset/icon/verified.png',
                      text: '인증 추가하기',
                    ),
                    _InfoList(
                      imgurl: 'asset/icon/invite.png',
                      text: '초대코드로 다이아 받기',
                    ),
                    _InfoList(
                      imgurl: 'asset/icon/satisfaction.png',
                      text: '프러버 매력지수',
                    ),
                    _InfoList(
                      imgurl: 'asset/icon/friends.png',
                      text: '아는 사람 만나지 않기',
                    ),
                  ],
                ),
              ),
              _ListContainer(
                content: Column(
                  children: [
                    _InfoList(
                      imgurl: 'asset/icon/announcement.png',
                      text: '공지사항',
                    ),
                    _InfoList(
                      imgurl: 'asset/icon/faq.png',
                      text: '프러버 이용 방법',
                    ),
                    _InfoList(
                      imgurl: 'asset/icon/cart.png',
                      text: '프러버 스토어',
                    ),
                    _InfoList(
                      imgurl: 'asset/icon/operator.png',
                      text: '고객센터',
                    ),
                    _InfoList(
                      imgurl: 'asset/icon/event.png',
                      text: '이벤트',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: _Bottom(),
    );
  }
}

class _ListContainer extends StatelessWidget {
  final content;
  const _ListContainer({required this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 8.0),
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: content,
    );
  }
}

class _InfoList extends StatelessWidget {
  final imgurl;
  final text;

  const _InfoList({
    required this.imgurl,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.only(right: 8.0),
              child: Image.asset(
                imgurl,
                width: 32.0,
              )),
          Text(
            text,
            style:
                TextStyle(fontWeight: FontWeight.w700, color: Colors.grey[700]),
          )
        ],
      ),
    );
    ;
  }
}
class _Bottom extends StatelessWidget {

  const _Bottom({ Key? key})
      : super(key: key);

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
            onTap: (){
      Navigator.of(context).pushNamed('/');
      },
          child: Text('소개')),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/historyScreen',
                  arguments: {

                  },
                );
              },
              child: Text('관심카드'),
            ),
        GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed('/rounge');
            },
            child: Text('라운지')),
            Text('프로필평가'),
            GestureDetector(
                onTap: (){
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
