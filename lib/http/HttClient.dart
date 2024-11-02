//
// import 'dart:convert';
// import 'dart:io';
//
// // Flutter的 原生 Http请求：
// Future<void> http(Uri uri, String name, String value) async {
//   HttpClient httpClient = HttpClient();
//   HttpClientRequest request = await httpClient.getUrl(uri);
//   request.headers.add(name, value);
//
//   String payload="...";
//
//   request.add(utf8.encode(payload));
//   //request.addStream(_inputStream); //可以直接添加输入流
//
//   // 等待连接服务器
//   HttpClientResponse response = await request.close();
//   // 读取响应内容
//   String responseBody = await response.transform(utf8.decoder).join();
//   // 请求结束，关闭HttpClient
//   httpClient.close();
// }