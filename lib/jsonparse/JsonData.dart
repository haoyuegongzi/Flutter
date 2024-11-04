import 'package:learnflutterdemo/jsonparse/HarmonyBean.dart';

import 'package:dio/dio.dart';

main() {
  requestGetData();
}
// json字符串解析为Bean对象的流程：
// 1、请求接口，拿到服务器返回的数据，比如这里，我们先请求接口: "https://wanandroid.com/harmony/index/json";
// 2、拿到上面的接口返回来的数据后，完整地复制该数据字符串；
// 3、右键单击要保存的Bean文件所在的文件夹，比如这里的 文件夹是 “jsonparse”，然后在弹出的菜单中，
//    依次操作“New”→→“JsonToDartBeanAction”选项；
// 4、在弹出的窗口中，输入解析的Bean文件的class名字，将复制的完整的字符串粘贴到下面的大输出框，点击完成即可；
// 5、也可以解注在线工具，来解析并生成Bean文件：https://javiercbk.github.io/json_to_dart/
void requestGetData() async {
  var httpDio = Dio();
  var response = await httpDio.get("https://wanandroid.com/harmony/index/json");
  if(response.statusCode == 200) {
    print("Dio 网络GET请求：${response.data}\n\n");
    HarmonyBean harmonyBean = HarmonyBean.fromJson(response.data);

    // print("Dio 网络GET请求：${harmonyBean.data.toString()}\n\n");
    print("harmonyBean.data.links 网络GET请求：${harmonyBean.data?.tools?.toString()}\n\n");
    print("harmonyBean.data.openSources 网络GET请求：${harmonyBean.data?.openSources.toString()}\n\n");
    print("harmonyBean.data.tools 网络GET请求：${harmonyBean.data?.links.toString()}\n\n");

    // List<ArticleList>? articleList = harmonyBean.data?.links?.articleList;
    // if (articleList!.isNotEmpty) {
    //   articleList.forEach((element) {
    //     print("harmonyBean.data.links的网络GET请求数据：${element.toString()}\n\n");
    //   });
    // }
    // List<ArticleList>? openSourcesList = harmonyBean.data?.openSources?.articleList;
    // if (openSourcesList!.isNotEmpty) {
    //   openSourcesList.forEach((element) {
    //     print("harmonyBean.data.openSources的网络GET请求数据：${element.toString()}\n\n");
    //   });
    // }
    // List<ArticleList>? toolsList = harmonyBean.data?.tools?.articleList;
    // if (toolsList!.isNotEmpty) {
    //   toolsList.forEach((element) {
    //     print("harmonyBean.data.tools的网络GET请求数据：${element.toString()}\n\n");
    //   });
    // }
  } else {
    print("Dio 网络GET请求：${response.statusCode}");
  }
  httpDio.close();
}









