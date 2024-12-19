

class Singleton {
  // 私有构造函数
  Singleton._privateConstructor();

  // 唯一实例
  static final Singleton _instance = Singleton._privateConstructor();

  // 获取实例的方法
  static Singleton get instance => _instance;

  // 示例方法
  void someMethod() {
    print("This is a singleton method.");
  }
}

// 使用
void main() {
  var singleton1 = Singleton.instance;
  var singleton2 = Singleton.instance;

  print(identical(singleton1, singleton2)); // 输出: true
  print("singleton1 == singleton2：${singleton1 == singleton2}"); // 输出: true
}