import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Ramadhan {
  static late Database _database;
  static Future<Database> getData() async {
    var dbDir = await getDatabasesPath();
    var dbPath = join(dbDir, "database.db");
    var exist = await databaseExists(dbPath);
    if (!exist) {
      ByteData data = await rootBundle.load("assets/database.db");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(dbPath).writeAsBytes(bytes);
    }
    return await openDatabase(dbPath);
  }

  static Future<List<Map<String, dynamic>>> getMonth() async {
    _database = await getData();
    List<Map<String, dynamic>> ramadhan = await _database.query('month');
    return List.generate(
        ramadhan.length,
        (index) => {
              'niya': ramadhan[index]['niya'],
              'wodou2': ramadhan[index]['wodou2'],
              'adan': ramadhan[index]['adan'],
              'siwak': ramadhan[index]['siwak'],
              'fajr_before': ramadhan[index]['fajr_before'],
              'fajr_dikr': ramadhan[index]['fajr_dikr'],
              'dohr_before': ramadhan[index]['dohr_before'],
              'dohr_after': ramadhan[index]['dohr_after'],
              'dohr_dikr': ramadhan[index]['dohr_dikr'],
              'asr_before': ramadhan[index]['asr_before'],
              'asr_dikr': ramadhan[index]['asr_dikr'],
              'maghrib_after': ramadhan[index]['maghrib_after'],
              'maghrib_dikr': ramadhan[index]['maghrib_dikr'],
              'isha_after': ramadhan[index]['isha_after'],
              'isha_dikr': ramadhan[index]['isha_dikr'],
              'douha': ramadhan[index]['douha'],
              'kiyam': ramadhan[index]['kiyam'],
              'read_quran': ramadhan[index]['read_quran'],
              'listen_quran': ramadhan[index]['listen_quran'],
              'getting_up': ramadhan[index]['getting_up'],
              'morning': ramadhan[index]['morning'],
              'evening': ramadhan[index]['morning'],
              'sleeping': ramadhan[index]['sleeping'],
              'sahar': ramadhan[index]['sahar'],
              'iftar': ramadhan[index]['iftar'],
              'tahara': ramadhan[index]['tahara'],
              'hidden': ramadhan[index]['hidden'],
              'jalsa': ramadhan[index]['jalsa'],
            });
  }

  static Future<void> updateIbada(int day, String ibada, int val) async {
    _database = await getData();
    _database.execute('UPDATE month SET $ibada = "$val" WHERE day = "$day"');
  }

  static Future<Map<String, dynamic>> getUser() async {
    _database = await getData();
    final List<Map<String, dynamic>> user = await _database.query('settings');
    return {
      'user': user[0]['user'],
      'avatar': user[0]['avatar'],
      'ramadhanDay': user[0]['currentDay']
    };
  }

  static void updateUser(String user, String avatar) async {
    _database = await getData();
    _database.execute('UPDATE settings SET user = "$user"');
    _database.execute('UPDATE settings SET avatar = "$avatar"');
  }

  static void updateDay(int ramadhanDay) async {
    _database = await getData();
    _database.execute('UPDATE settings SET currentDay = "$ramadhanDay"');
  }
}
