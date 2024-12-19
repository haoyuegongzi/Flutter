import 'dart:async';

main() {

  late StreamSubscription subscription;

  // 创建一个单订阅 Stream
  Stream<int> numberStream = Stream<int>.periodic(const Duration(seconds: 1), (count) => count);
  // 监听 Stream
  subscription = numberStream.listen((number) {
    print('Received number: $number');

    if (number == 15) {
      subscription.cancel();
    }
  });
}