import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:ttf/model/contents.dart';

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    Contents,
  ],
)


class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  Future<int> createContent(ContentsCompanion data) =>
        into(contents).insert(data);

  Stream<List<Content>> watchContents()=>
      select(contents).watch();



 // Future<List<Contents>> getContents() =>
 //     select(contents).get();




  @override
  int get schemaVersion => 1;

}

LazyDatabase _openConnection(){
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);

  });
}
