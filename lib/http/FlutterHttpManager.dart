// import 'dart:core';
//
// import 'package:learnflutterdemo/http/FlutterHttpError.dart';
//
//
// ///http请求成功回调
// typedef HttpSuccessCallback<T> = void Function(dynamic data);
//
// ///失败回调
// typedef HttpFailureCallback = void Function(FlutterHttpError data);
//
// ///数据解析回调
// typedef T JsonParse<T>(dynamic data);
//
//
// /// @desc  封装 http 请求
// /// @time 2019/3/15 10:35 AM
// /// @author Cheney
// // class FlutterHttpManager {
// //   init                        : 初始化baseUrl,超时时间等
// //   get                         : get请求同步回调
// //   post                        : post请求同步回调
// //   upload                      : 文件上传同步回调
// //   download                    : 文件下载同步回调
// //   getAsync                    : get 请求异步方式
// //   postAsync                   : post 请求异步方式
// //   uploadAsync                 : 文件上传异步方式
// //   downloadAsync               : 文件下载异步方式
// //   [...]
// // }
