
import 'package:learnflutterdemo/storage/SQliteLibTodo.dart';
import 'package:sqflite/sqflite.dart';

class SQliteLibProvider {
  late Database database;

  open(String path) async {
    database = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async{
          db.execute(
            '''
              create table $tableTodo(
                $columnId integer primary key autoincrement,
                $columnTitle text not null,
                $columnDone intteger not null
              )
            '''
          );
        });
  }

  // inser 插入
  Future<Todo> insert(Todo todo) async {
    todo.id = await database.insert(tableTodo, todo.toMap());
    return todo;
  }

  // queryTodo: query查询
  Future<Todo?> queryTodo(int id) async {
    List<Map> maps = await database.query(
      tableTodo,
      columns: [columnId, columnDone, columnTitle],
      where: "$columnId = ?",
      whereArgs: [id]
    );

    if (maps.isNotEmpty) {
      return Todo.formMap(maps.first);
    }
  }

  // delete： 删除
  Future<int> delete(int id) async {
    return await database.delete(
      tableTodo,
      where: "$columnId = ?",
      whereArgs: [id]
    );
  }

  Future<int> update(Todo todo) async {
    return await database.update(
        tableTodo,
        todo.toMap(),
      where: "$columnId = ?",
      whereArgs: [todo.id]
    );
  }
}



