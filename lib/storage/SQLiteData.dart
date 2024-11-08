import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SqliteLessState(),
    )
  );
}

class SqliteLessState extends StatelessWidget {
  late Database database;

  SqliteLessState({super.key});

  @override
  Widget build(BuildContext context) {
    initSQLite();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Flutter的SQLite数据库",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            color: Colors.white,
            backgroundColor: Colors.blueGrey,
          ),
        ),
      ),
      body: OutlinedButton(
        onPressed: () {
        },
        child: Text("Flutter的SQLite数据库"),
      ),
    );
  }

  void initSQLite() async {
    print("initSQLite: start");
    var dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, "FlutterDemo.db");
    database = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) {
          db.execute("CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, run REAL)");
        });

    print("initSQLite: end");
  }
}

