import 'package:dio/dio.dart';

main() {
  requestGetData();
  // requestPostData();
}

void requestGetData() async {
  var httpDio = Dio();
  var response = await httpDio.get("https://wanandroid.com/harmony/index/json");
  if (response.statusCode == 200) {
    print("Dio 网络GET请求：${response.data}");
  } else {
    print("Dio 网络GET请求：${response.statusCode}");
  }
  httpDio.close();
}

void requestPostData() async {
  var httpDio = Dio();
  var httpUrl = "https://www.wanandroid.com/user/login";
  Map<String, String> loginMap = {"username": "gongzi", "password": "gongZI"};

  var response = await httpDio.post(httpUrl, queryParameters: loginMap);
  if (response.statusCode == 200) {
    print("Dio 网络Post请求：${response.data}");
  } else {
    print("Dio 网络Post请求：${response.statusCode}");
  }
  httpDio.close();
}
