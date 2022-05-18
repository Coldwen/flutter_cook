import 'package:sqflite/sqflite.dart';

class SqUtils {
  static Database? db;
  static int dbVersion = 1;
  static List dbDatas = [];
  static String? dbPath;

  ///获取数据库路径
  static getDbPath() async {
    dbPath = await getDatabasesPath();
    print(dbPath);
  }

  ///打开数据库
  static openDb() async {
    await getDbPath();
    db = await openDatabase(
      '${dbPath!}/caipu.db',
      version: dbVersion,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE CaiPu (caipuId INTEGER PRIMARY KEY,caipuImage TEXT,caipuVideo TEXT, name TEXT, caipuIntro TEXT, useds TEXT, steps TEXT, tips TEXT, duration TEXT, nandu TEXT, sort TEXT, createTime INTEGER, patchTime INTEGER)');
      },
    );
  }

  ///插入数值
  static insertItem({
    required String caipuImage,
    String? caipuVideo,
    required String name,
    String? caipuIntro,
    required String useds,
    required String steps,
    String? tips,
    required String duration,
    required String nandu,
    required String sort,
  }) async {
    await openDb();
    if (db != null && db!.isOpen) {
      await db!.insert(
        'CaiPu',
        {
          'caipuId': dbDatas.length + 1,
          'caipuImage': caipuImage,
          'caipuVideo': caipuVideo,
          'name': name,
          'caipuIntro': caipuIntro,
          'useds': useds,
          'steps': steps,
          'tips': tips,
          'duration': duration,
          'nandu': nandu,
          'sort': sort,
          'createTime': DateTime.now().millisecondsSinceEpoch,
          'patchTime': DateTime.now().millisecondsSinceEpoch,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  ///查询数据
  static queryItems() async {
    await openDb();
    if (db != null && db!.isOpen) {
      dbDatas = await db!.query('CaiPu');
    }
    return dbDatas;
  }

  ///删除数据
  static deleteItems(int caipuId) async {
    await openDb();
    if (db != null && db!.isOpen) {
      await db!.delete(
        'CaiPu',
        where: 'caipuId = ?',
        whereArgs: [caipuId],
      );
    }
  }

  ///关闭数据库
  static closeDb() async {
    if (db != null && db!.isOpen) {
      await db!.close();
    }
  }
}
