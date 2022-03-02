import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:my_deen/model/models.dart';
import 'package:sqflite/sqflite.dart';

class DbDzikir {
  static var _dbName = 'dzikir.sqlite';
  static Database? _db;

  static Future _init() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);
    final exist = await databaseExists(path);
    if (!exist) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {}
      ByteData data = await rootBundle.load(join("assets/db/dzikir.sqlite"));
      List<int> bytes =
          data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }
    await openDatabase(path);
    _db = await openDatabase(path);
  }

  static Future<List<ModelDzikir>> dzikirpagi() async {
    if (_db == null) await _init();

    try {
      List<Map<String, dynamic>> map = [];
      await _db!.transaction((txn) async => map = await txn.query("pagi"));
      List<ModelDzikir> data = [];
      for (var i = 0; i < map.length; i++) {
        ModelDzikir model = ModelDzikir.fromJson(map[i]);
        data.add(model);
      }
      print('dapat ini');
      return data;
    } catch (e) {
      print('ini error db : $e');
      return [];
    }
  }

  static Future<List<ModelDzikir>> dzikirpetang() async {
    if (_db == null) await _init();

    try {
      List<Map<String, dynamic>> map = [];
      await _db!.transaction((txn) async => map = await txn.query("petang"));
      List<ModelDzikir> data = [];
      for (var i = 0; i < map.length; i++) {
        ModelDzikir model = ModelDzikir.fromJson(map[i]);
        data.add(model);
      }
      print('dapat ini');
      return data;
    } catch (e) {
      print('ini error db : $e');
      return [];
    }
  }

}
