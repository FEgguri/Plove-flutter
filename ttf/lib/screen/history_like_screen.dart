import 'package:flutter/material.dart';

class History extends StatelessWidget {

  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final arg = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final proList = arg['proList'];
    final usedList = arg['usedList'];

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
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _ListDeploy(
                  data: proList,
                  titletxt: '인기있는 프러버(평점 3.5이상)',
                  listFliter: _likefunction(proList),
                ),
                _ListDeploy(
                  data: usedList,
                  titletxt: '지나간 프러버',
                  listFliter: _Nomfunction(usedList),
                ),
                _ListDeploy(
                  data: null,
                  titletxt: '나에게 관심있는 프러버',
                  listFliter: _Nomfunction(proList),
                ),
                _ListDeploy(
                  data: null,
                  titletxt: '나를 좋아하는 프러버',
                  listFliter: '',
                ),
                _ListDeploy(
                  data: proList,
                  titletxt: '추가 리스트',
                  listFliter: _Nomfunction(proList),
                ),
                _ListDeploy(
                  data: proList,
                  titletxt: '추가 리스트',
                  listFliter: _Nomfunction(proList),
                ),
                _ListDeploy(
                  data: proList,
                  titletxt: '추가 리스트',
                  listFliter: _Nomfunction(proList),
                ),
                _ListDeploy(
                  data: null,
                  titletxt: '프러브',
                  listFliter: '',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                )
              ],
            ),
          ),
        ],
      ),
      bottomSheet:_Bottom(),
    );
  }

  _likefunction(list) {
    return (context, index) {
      if (double.parse(list[index]['rate']) >= 3.5) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              _ListContents(
                list: list,
                index: index,
              ),
            ],
          ),
        );
      } else {
        return SizedBox(
          width: 0,
          height: 0,
        );
      }
    };
  }

  _Nomfunction(list) {
    return (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            _ListContents(
              list: list,
              index: index,
            ),
          ],
        ),
      );
    };
  }
}

class _ListDeploy extends StatelessWidget {
  final data;
  final titletxt;
  final listFliter;

  const _ListDeploy({
    required this.data,
    required this.titletxt,
    required this.listFliter,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: data != null || data == '' ?  200 : 50,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                titletxt,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          data == null
              ? SizedBox()
              : Expanded(
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    shrinkWrap: true,
                    itemBuilder: listFliter != null ? listFliter : null,
                  ),
                )
        ],
      ),
    );
  }
}

class _ListContents extends StatelessWidget {
  final list;
  final index;

  const _ListContents({
    required this.list,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            width: list != null ? 120.0 : 0,
            height: list != null ? 120.0 : 0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(list[index]['img']),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.purpleAccent[100],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'D-2',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              Text(
                '${list[index]['name']}',
              ),
              Text('${list[index]['age']}'),
            ],
          )
        ],
      ),
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