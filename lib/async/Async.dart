import 'dart:async';

import 'package:flutter/cupertino.dart';

/**
 * 异步任务 及 多个异步任务
 */
main() {
  // aDelayedTask();
  // aDelayedTaskWithError();
  // aDelayedTaskComplete();
  // arrayAsyncTask();

  // streamSingleListener();
  streamMutableListener();
}

void aDelayedTask() {
  debugPrint("Async, dart， before");
  // TODO: Future调用 delayed()方法，创建一个延时执行的异步任务。
  // TODO: Future.delayed 只能启动一个异步任务。
  Future.delayed(const Duration(seconds: 3), () {
    return "hello, Dart";
  }).then((value) => debugPrint("Async: $value"));
  debugPrint("Async, dart， after");
}

void aDelayedTaskWithError() {
  debugPrint("Async, dart， before");
  // TODO: Future调用 delayed()方法，创建一个延时执行的异步任务。
  Future.delayed(const Duration(seconds: 3), () {
    int index = getIndex("999");
    if (index == 0) {
      throw AssertionError("AssertionError");
    } else {
      return "hello, Dart";
    }
  })
      .then((value) => debugPrint("Async, Success: $value"))
      .catchError((onError) {
    debugPrint("Async, Failed: $onError");
  });
  debugPrint("Async, dart， after");
}

int getIndex(String tag) {
  return tag.isEmpty ? 0 : 9;
}

void aDelayedTaskComplete() {
  debugPrint("Async, dart， before");
  // TODO: Future调用 delayed()方法，创建一个延时执行的异步任务。
  String result = "";
  Future.delayed(const Duration(seconds: 3), () {
    debugPrint("Async, delayed(3)");
    int index = getIndex("999");
    if (index == 0) {
      throw AssertionError("AssertionError");
    } else {
      return "hello, Dart";
    }
  })
      .then((value) => {result = value, debugPrint("Async, Success: $value")})
      .catchError((onError) {
    result = onError.toString();
    debugPrint("Async, Failed: $onError");
  }).whenComplete(() => {
            print("Async, whenComplete, $result"),
            debugPrint(
                "Async, whenComplete, It is Success or not, must excute this ")
          });
  debugPrint("Async, dart， after");
}

void arrayAsyncTask() {
  // TODO: 在这里，我们通过Future.wait()方法可以同时启动多个异步任务，然后在 .then() 方法中，
  // TODO：再对 多个任务的结果做统一的处理。 多个异步任务是同是启动的。这一点，跟Kotlin的协程很类似了。
  print("ArrayAsyncTask, 同时启动多个异步任务");
  Future.wait([
    Future.delayed(const Duration(milliseconds: 2500), () {
      debugPrint("ArrayAsyncTask, 第一个异步任务");
      return "Dart的多任务异步执行, ";
    }),
    Future.delayed(const Duration(milliseconds: 5000), () {
      debugPrint("ArrayAsyncTask, 这是第二个异步任务");
      return "是通过Future.wait()的方式启动的，这一点跟Kotlin的协程很类似";
    })
  ])
      .then((value) => {
            debugPrint(
                "ArrayAsyncTask, Future.wait() 多任务的执行结果如下：${value[0]}${value[1]}"),
            debugPrint(
                "ArrayAsyncTask, Future.wait() 多任务的执行结果如下：${value.first}${value.last}"),
          })
      .catchError((onError) {
    debugPrint("ArrayAsyncTask, 这里跑出了异常：${onError.toString()}");
  }).whenComplete(() => debugPrint("ArrayAsyncTask, 无论如何，最终都会执行这里的。"));
}

void streamSingleListener() {
  StreamController<String> singleStream = StreamController();
  singleStream.add("event");
  singleStream.add("Bus");
  singleStream.stream.listen((event) {
    print("streamSingleListener: $event");
  }, onError: () {}, onDone: () {});
  singleStream.close();
}

void streamMutableListener() {
  StreamController<String> mutableStream = StreamController.broadcast();
  mutableStream.stream.listen((event) {
    debugPrint("mutableStream, listen: $event");
  }, onError: (error) {
    debugPrint("mutableStream, onError: ${error.toString()}");
  }, onDone: () {
    debugPrint("mutableStream, onDone: 执行结束");
  });
  mutableStream.add("event bus A");

  StreamController<String> streamController = StreamController();
  Stream stream = streamController.stream.asBroadcastStream();
  stream.listen((event) {
    debugPrint("mutableStream, listen: $event");
  });
  streamController.sink.add("event Bus B");
  mutableStream.close();
  streamController.close();
}
