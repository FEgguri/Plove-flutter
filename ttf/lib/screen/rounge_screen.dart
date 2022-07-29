import 'package:flutter/material.dart';

class RoungeScreen extends StatefulWidget {
  const RoungeScreen({Key? key}) : super(key: key);

  @override
  State<RoungeScreen> createState() => _RoungeScreenState();
}

class _RoungeScreenState extends State<RoungeScreen> {
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
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            bottom: 90.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: 32.0,
                ),
                child: Column(
                  children: [
                    Container(
                      margin:EdgeInsets.symmetric(vertical: 32.0),
                      child: Text('PLOVE 라운지',style:
                        TextStyle(
                          color: Colors.purple,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                    Text('이곳은 프러버 회원님들만의 익명 커뮤니티 공간입니다'   )
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width:MediaQuery.of(context).size.width * 0.8,
                      padding: EdgeInsets.all(16.0),

                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('다음은 허용되지 않습니다.',
                            style:TextStyle(
                              fontWeight: FontWeight.bold,
                            ) ,),
                          Text('-욕설과 비속어,실명거론 및 저격글',
                          style: TextStyle(
                            fontSize: 13.0,
                          ),),
                          Text('-성적 대상화 및 저속한 표현',
                            style: TextStyle(
                              fontSize: 13.0,
                            ),),
                          Text('-매칭 상대 언급 및 매칭 기능에 대한 이야기',
                            style: TextStyle(
                              fontSize: 13.0,
                            ),),
                          Text('-분란 조장성이 있는 이야기',
                            style: TextStyle(
                              fontSize: 13.0,
                            ),),
                          Text('-다음은 허용되지 않습니다.',
                            style: TextStyle(
                              fontSize: 13.0,
                            ),),
                          Text('-오픈 카톡 등 연락처 공유',
                            style: TextStyle(
                              fontSize: 13.0,
                            ),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                margin: EdgeInsets.symmetric(vertical: 32.0),
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pushNamed('/rounge/front');
                    },
                    child: Text('입장하기')),
              )
            ],
          ),
        ),
      ),
      bottomSheet: _Bottom(),
    );
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
