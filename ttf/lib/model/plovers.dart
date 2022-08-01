import 'package:drift/drift.dart';

class Contents extends Table {
  //PRIMARY KEY
  IntColumn get id =>
      integer().autoIncrement()(); //함수가 리턴이 되기 때문에 한번 더 괄호를 써줘야한다

  //title
  TextColumn get name => text()();
  //age
  IntColumn get age => integer()();
  //intro
  TextColumn get intro => text()();
  //location
  TextColumn get location => text()();
  //res
  //content
  TextColumn get innercontent => text()();
  //date
  DateTimeColumn get createdate => dateTime().clientDefault(
        () => DateTime.now(),
  )();
}
