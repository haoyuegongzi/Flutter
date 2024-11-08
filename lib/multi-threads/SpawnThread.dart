import 'dart:io';
import 'dart:isolate';

void main() {
  print("[Spawn Thread main isolate] start");
  createIsolate();
  print("[Spawn Thread main isolate] over");
}

void createIsolate() async {
  var mainReceivePort = ReceivePort();
  var mainSendPort = mainReceivePort.sendPort;

  //  在main主Isolate进程中，通过 Isolate.spawn() 创建 child子Isolate进程
  await Isolate.spawn((message) {
    // 在这里面创建 child子Isolate进程
    print("[Spawn Thread child isolate] start");
    var childReceivePort = ReceivePort(); // 创建子Isolate的 ReceivePort
    var childSendPort = childReceivePort.sendPort; // 创建子Isolate的 SendPort
    childReceivePort.listen((message) {
      // 通过 child子Isolate的ReceivePort监听 child子SendPort；
      print("[Spawn Thread child isolate] message: $message");
    });
    mainSendPort.send([
      0,
      childSendPort
    ]); // 在 child子Isolate里面，通过 main主 SendPort 向 main主Isolate发送message消息；
    sleep(const Duration(seconds: 3)); // 当前Isolate，也就是 child子Isolate 休眠 3s；
    mainSendPort.send([
      1,
      "[child isolate] finish"
    ]); // 在 child子Isolate里面，通过 main主 SendPort 向 main主Isolate发送message消息；

    print("[Spawn Thread child isolate] over");
  }, mainSendPort);

  mainReceivePort.listen((message) {
    print("[main isolate ] message: $message");
  });
}
