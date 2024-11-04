
import 'dart:isolate';

void main() {
  print("[main isolate] start");
  createIsolate();
  print("[main isolate] over");
}

void createIsolate() {
  var rp = ReceivePort();// 创建 ReceivePort；
  var sp = rp.sendPort;// 通过 ReceivePort对象，创建SendPort对象。
  // 调用 Isolate的 spawnUri() 方法来创建 Isolate 对象，并将 其与 SendPort 关联起来。
  Isolate.spawnUri(Uri(path: "./OtherIsolate.dart"), ["main isolate", "main isolate args"], sp);
  // 通过 ReceivePort对象 rp来监听 chuild Isolate发过来的消息。
  rp.listen((message) {
    print("[main isolate] message: $message");
  });
}



































