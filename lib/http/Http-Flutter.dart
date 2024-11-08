import 'package:http/http.dart' as http;

// Http是Flutter官方推荐的一个网络请求库；相比于 Dart语言自带的网络请求库 HttpClient，
// Http在易用性和可扩展性方， 有了较大的提升。由于Http网络请求库没有被Flutter默认集成到
// SDK中，因此，需要我们手动在 pubspec.yaml 中添加依赖（ http: ^1.2.0 ）
main() {
  requestGetData();
  // requestPostData();
}

void requestGetData() async {
  var client = http.Client();
  var uri = Uri.parse("https://wanandroid.com/harmony/index/json");
  var response = await client.get(uri);
  if (response.statusCode == 200) {
    print("http-Flutter 网络GET请求：${response.body}");
  } else {
    print("http-Flutter 网络GET请求：${response.statusCode}");
  }
  client.close();
}

void requestPostData() async {
  var client = http.Client();
  var uri = Uri.parse("https://www.wanandroid.com/user/login");
  Map<String, String> loginMap = {
    "username": "gongzi",
    "password": "gong*163ZI"
  };
  var response = await client.post(uri, body: loginMap);
  if (response.statusCode == 200) {
    print("http-Flutter 网络Post请求：${response.body}");
  } else {
    print("http-Flutter 网络Post请求：${response.statusCode}");
  }
  client.close();
}
