// HttpClient时Dart自带的网络请求模块，位于 Dart 的 io 包中。
// 可以使用它进行一些基本的网络请求，比如：GET/POST/DELETE等。
// 但是对于复杂的网络通信场景，HttpClient就无法胜任了。
import 'dart:convert';
import 'dart:io';

main() {
  requestGetData();
  // requestPostData();
}

void requestGetData() async {
  var httpClient = HttpClient();
  var uri = Uri.parse("https://wanandroid.com/harmony/index/json");
  var request = await httpClient.getUrl(uri);
  var response = await request.close();
  if (response.statusCode == HttpStatus.ok) {
    print("HttpClient 网络GET请求：${response.transform(utf8.decoder).join()}");
  } else {
    print("HttpClient 网络GET请求：${response.statusCode}");
  }
  httpClient.close();
}

void requestPostData() async {
  var httpClient = HttpClient();
  var uri = Uri.parse("https://www.wanandroid.com/lg/collect/1165/json");
  var request = await httpClient.postUrl(uri);
  var response = await request.close();
  if (response.statusCode == HttpStatus.ok) {
    print("HttpClient 网络Post请求：${response.transform(utf8.decoder).join()}");
  } else {
    print("HttpClient 网络Post请求：${response.statusCode}");
  }
  httpClient.close();
}
