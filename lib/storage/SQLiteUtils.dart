import 'dart:io';

import 'package:flutter/material.dart';
import 'package:learnflutterdemo/storage/SQliteLibProvider.dart';
import 'package:learnflutterdemo/storage/SQliteLibTodo.dart';
import 'package:learnflutterdemo/storage/StorageFile.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(
      const MaterialApp(
          home: SqliteLessWidget()
      )
  );
}

class SqliteLessWidget extends StatelessWidget {
  const SqliteLessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( "尝试数据库Todo", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueGrey,
      ),
      body: const PageTodoWidget(),
    );
  }
  
}

class PageTodoWidget extends StatefulWidget {
  const PageTodoWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return PageTodoState();
  }
}

class PageTodoState extends State<StatefulWidget> {
  SQliteLibProvider provider = SQliteLibProvider();
  StorageFile storageFile = StorageFile();
  var result = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSQLite();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsetsDirectional.fromSTEB(5, 1, 5, 1),
      children: [
        Text(
            result,
          style: const TextStyle(
            height: 2,
            wordSpacing: double.infinity,
            backgroundColor: Colors.black12,
            letterSpacing: 2
          ),
        ),
        OutlinedButton(
          onPressed: (){
            insertData();
          },
          child: const Text("SQLite:insert插入")
        ),
        OutlinedButton(
            onPressed: (){
              queryData();
            },
            child: const Text("SQLite:query查询")
        ),
        OutlinedButton(
            onPressed: (){
              updateData();
            },
            child: const Text("SQLite:update更新")
        ),
        OutlinedButton(
            onPressed: (){
              deleteData();
            },
            child: const Text("SQLite:delete删除")
        ),
        OutlinedButton(
            onPressed: (){
              obtainTempPath();
            },
            child: const Text("获取设备临时目录")
        ),
        OutlinedButton(
            onPressed: (){
              obtainDocumentsPath();
            },
            child: const Text("获取设备文档目录")
        ),
        OutlinedButton(
            onPressed: (){
              obtainExternalPath();
            },
            child: const Text("获取设备外部存储目录")
        ),
        OutlinedButton(
            onPressed: (){
              obtainAppCachePath();
            },
            child: const Text("获取设备应用缓存目录")
        ),
        OutlinedButton(
            onPressed: (){
              obtainDownloadsPath();
            },
            child: const Text("获取设备下载目录")
        ),
      ],
    );
  }

  void initSQLite() async {
    var dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, "FlutterTodo.db");
    provider.open(path);
  }

  void insertData() async {
    Todo todo = Todo();
    todo.id = 5;
    todo.title = "经济事项";
    todo.done = false;
    var insertTodo = await provider.insert(todo);
    print("SQLite数据库插入结果：${insertTodo.toString()}");
    setState(() {
      result = "SQLite数据库插入结果：${insertTodo.toString()}";
    });
  }

  void queryData() async{
    Todo? todo = await provider.queryTodo(5);
    print("SQLite数据库查询结果：${todo.toString()}");
    if (todo != null) {
      setState(() {
        result = "SQLite数据库查询结果：${todo.toString()}";
      });
    }
  }

  void updateData() async {
    Todo todo = Todo();
    todo.id = 5;
    todo.title = "J-35亮相珠海航展";
    todo.done = true;
    var todoResult = await provider.update(todo);
    print("SQLite数据库更新结果：${todoResult.toString()}");
    setState(() {
      result = "SQLite数据库更新结果：${todoResult.toString()}";
    });
  }

  void deleteData() async {
    int deleteResult = await provider.delete(5);
    print("SQLite数据库删除结果：${deleteResult.toString()}");
    setState(() {
      result = "SQLite数据库删除结果：$deleteResult";
    });
  }

  void obtainTempPath() async {
    Directory directory = await getTemporaryDirectory();
    print("obtainPath:获取到的临时目录是：${directory.path}");
    setState(() {
      result = "获取到的临时目录是：${directory.path}";
    });
  }

  void obtainDocumentsPath() async {
    Directory di = await getApplicationDocumentsDirectory();
    print("obtainPath:获取到的文档目录是：${di.path}");
    setState(() {
      result = "获取到的文档目录是：${di.path}";
    });
  }

  void  obtainExternalPath() async {
    Directory? directory = await getExternalStorageDirectory();
    print("obtainPath:获取到的外部存储目录是：${directory?.path}");
    setState(() {
      result = "获取到的外部存储目录是：${directory?.path}";
    });
  }

  void obtainAppCachePath() async {
    Directory directory = await getApplicationCacheDirectory();
    print("obtainPath:获取到的应用缓存目录是：${directory.path}");
    setState(() {
      result = "获取到的应用缓存目录是：${directory.path}";
    });
  }

  void obtainDownloadsPath() async {
    Directory? directory = await getDownloadsDirectory();
    print("obtainPath:获取到的下载目录是：${directory?.path}");
    setState(() {
      result = "获取到的下载录是：${directory?.path}";
    });
  }
}






