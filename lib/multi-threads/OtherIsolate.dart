
import 'dart:io';
import 'dart:isolate';

void main(args, SendPort mSendPort) {
  print("[child isolate] start");
  print("[child isolate] over, args: $args");// args 是 主isolate 发送过来的
  createIsolate(mSendPort);
  mSendPort.send([1, "[child isolate] finish"]);// 通过事件，发给 主isolate
}

void createIsolate(mSendPort) {
  var childReceivePort = ReceivePort();// 创建 ReceivePort；
  var childSendReceivePort = childReceivePort.sendPort;// 通过 ReceivePort对象，创建SendPort对象。
  // 这里因为没有其他的 sendport（isolate）发消息过来，所以，这里的监听没有什么作用。
  childReceivePort.listen((message) {
    print("[child isolate] message: $message");
  });
  mSendPort.send([0, childSendReceivePort]);// 调用 主Isolate的 SendPort 对象发送消息给 主Isolate。
  // sleep(const Duration(seconds: 5));
}