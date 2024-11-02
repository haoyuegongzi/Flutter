// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
//
// main() {
//   runApp(
//     const MaterialApp(
//       title: "网络请求",
//       debugShowCheckedModeBanner: false,
//       home: HttpRequest(),
//     )
//   );
// }
//
// class HttpRequest extends StatefulWidget {
//   const HttpRequest({super.key});
//
//   @override
//   State<HttpRequest> createState() {
//     return HttpRequestWidget();
//   }
// }
//
// class HttpRequestWidget extends State<HttpRequest> {
//
//   Dio dio = Dio();
//
//   //  GET 请求
//   void getData() async {
//     try {
//       Response response = await dio.get('https://jsonplaceholder.typicode.com/posts/1');
//       print("Dart环境下的 dio-get 请求: ${response.data}");
//       // 在这里处理响应数据
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   //  Post 请求
//   void postData() async {
//     try {
//       String path = 'https://jsonplaceholder.typicode.com/posts';
//       // 定义一个 Key是String类型，Value是任意类型（相当于Java的Object类型）的Map；
//       Map<String, dynamic> queryParametersMap =  {'title': 'foo', 'body': 'bar', 'userId': 1};
//       // 定义一个Map，Key和Value 类型 是任意类型的；
//       Map queryParameters =  {1: 'foo', 'body': 'bar', 3: 1, 9: false, 3.14: null};
//       Response response = await Dio().post(path, data: queryParametersMap);
//       print("Dart环境下的 dio-post 请求: ${response.data}");
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   //  带参数的 Get 请求
//   void getWithParameters() async{
//     try {
//       String path = 'https://jsonplaceholder.typicode.com/posts';
//       Map<String, dynamic> map = {'userId': 1};
//       Response response = await Dio().get(path, queryParameters: map);
//       print("Dart环境下的 带参数的 Get 请求: ${response.data}");
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   //  带 Header 的 Get 请求
//   void getWithHeaders() async {
//     try {
//       String path = 'https://jsonplaceholder.typicode.com/posts';
//       Map<String, String> header = {'Authorization': 'Bearer token'};
//       Response response = await Dio().get(
//         path, options: Options(headers: header),
//       );
//       print("Dart环境下的 带 Header 的 Get 请求: ${response.data}");
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             "Flutter网络请求",
//             style: TextStyle(
//                 fontSize: 24,
//                 color: Colors.deepPurple,
//                 fontStyle: FontStyle.italic),
//           ),
//         ),
//         body: Container(
//           width: double.infinity,
//           height: double.infinity,
//           alignment: AlignmentDirectional.center,
//           margin: const EdgeInsetsDirectional.all(10),
//           padding: const EdgeInsetsDirectional.all(10),
//           child: Column(
//             children: [
//               OutlinedButton(
//                   onPressed: () {
//                     getData();
//                   },
//                   child: const Text("Dart环境下的 dio-get 请求")),
//               const Divider(),
//               OutlinedButton(
//                   onPressed: (){
//                     postData();
//                   },
//                   child: const Text("Dart环境下的 dio-post 请求")),
//               const Divider(),
//               OutlinedButton(
//                 onPressed: (){
//                   getWithParameters();
//                 },
//                 child: const Text("Dart环境下的 带参数的 dio-Get 请求")),
//               const Divider(),
//               OutlinedButton(
//                   onPressed: (){
//                     getWithHeaders();
//                   },
//                   child: const Text("Dart环境下的 带 Header 的 Get 请求")),
//             ],
//           ),
//         ),
//     );
//   }
// }
//
