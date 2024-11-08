
String tableTodo = "todo";
String columnId = "_id";
String columnTitle = "_title";
String columnDone = "_done";

class Todo {
  int id = 0;
  String title = "";
  bool done = false;

  Todo() {

  }

  Map<String, Object> toMap() {
    var map = <String, Object>{
      columnTitle: title,
      columnDone: done
    };

    map[columnId] = id;
    return map;
  }

  Todo.formMap(Map<dynamic, dynamic> map) {
    id = map[columnId];
    title = map[columnTitle];
    done = map[columnDone];
  }

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, done: $done}';
  }
}