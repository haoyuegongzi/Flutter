import 'package:flutter/material.dart';

// Flutter的Card 类似 Android中的 CardView；
main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Container组件与Align组件的搭配",
          style: TextStyle(
              fontSize: 24,
              color: Colors.deepPurple,
              fontStyle: FontStyle.italic,
              fontFamily: "fontFamily啥作用的属性？"),
        ),
      ),
      body: const CardVideoInfoWidget(),
    ),
  ));
}

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.greenAccent,
      margin: const EdgeInsetsDirectional.all(12),
      padding: const EdgeInsetsDirectional.all(12),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Card(
            shadowColor: Colors.black54,
            surfaceTintColor: Colors.blue,
            elevation: 10,
            margin: const EdgeInsetsDirectional.only(bottom: 20),
            shape: const RoundedRectangleBorder(
                // 四个角都是 R = 10的圆角
                // borderRadius: BorderRadius.all(Radius.circular(10))
                // 左下角和右下角为 R = 10的圆角
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Container(
              width: 320,
              padding: const EdgeInsetsDirectional.all(8),
              margin: const EdgeInsetsDirectional.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "王二麻子货",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 24,
                    ),
                  ),
                  const Text(
                    "高级软件工程师",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsetsDirectional.only(top: 16),
                    color: Colors.black45,
                    width: double.infinity,
                    height: 1,
                  ),
                  Container(
                    margin: const EdgeInsetsDirectional.only(top: 20),
                    child: const Text(
                      "高级软件工程师",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsetsDirectional.only(top: 30),
                    child: const Text(
                      "地址：北京故宫博物院",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Card(
            shadowColor: Colors.black54,
            surfaceTintColor: Colors.blue,
            elevation: 10,
            shape: const RoundedRectangleBorder(
                // 四个角都是 R = 10的圆角
                // borderRadius: BorderRadius.all(Radius.circular(10))
                // 左下角和右下角为 R = 10的圆角
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Container(
              width: 320,
              padding: const EdgeInsetsDirectional.all(8),
              margin: const EdgeInsetsDirectional.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "李四",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 24,
                    ),
                  ),
                  const Text(
                    "高级注册会计师",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsetsDirectional.only(top: 16),
                    color: Colors.black45,
                    width: double.infinity,
                    height: 1,
                  ),
                  Container(
                    margin: const EdgeInsetsDirectional.only(top: 20),
                    child: const Text(
                      "电话：19903725847",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsetsDirectional.only(top: 30),
                    child: const Text(
                      "地址：上海徐家汇金融街",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardWidgetByListTitle extends StatelessWidget {
  const CardWidgetByListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.greenAccent,
      margin: const EdgeInsetsDirectional.all(12),
      padding: const EdgeInsetsDirectional.all(12),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: const [
          Card(
              elevation: 10,
              // color: Colors.black12,
              shadowColor: Colors.black45,
              surfaceTintColor: Colors.blue,
              margin: EdgeInsetsDirectional.only(bottom: 20),
              shape: RoundedRectangleBorder(
                  // 四个角都是 R = 10的圆角
                  borderRadius: BorderRadius.all(Radius.circular(10))
                  // 左下角和右下角为 R = 10的圆角
                  //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
                  ),
              child: Column(
                children: [
                  ListTile(
                    // 下面的 "王二麻子货" 和 "高级软件工程师" 很明显是 标题 和副标题 的关系，因此，这里用 title 和 subtitle 更合理。
                    title: Text(
                      "王二麻子货",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 24,
                      ),
                    ),
                    subtitle: Text(
                      "高级软件工程师",
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      "电话：139876543210",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "地址：北京市三合屯大市场",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              )),
          Card(
              elevation: 10,
              // color: Colors.black12,
              shadowColor: Colors.black45,
              surfaceTintColor: Colors.blue,
              margin: EdgeInsetsDirectional.only(bottom: 20),
              shape: RoundedRectangleBorder(
                  // 四个角都是 R = 10的圆角
                  borderRadius: BorderRadius.all(Radius.circular(10))
                  // 左下角和右下角为 R = 10的圆角
                  //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
                  ),
              child: Column(
                children: [
                  ListTile(
                    // 下面的 "王二麻子货" 和 "高级软件工程师" 很明显是 标题 和副标题 的关系，因此，这里用 title 和 subtitle 更合理。
                    title: Text(
                      "李四",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 24,
                      ),
                    ),
                    subtitle: Text(
                      "资深架构师",
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      "电话：18934512304212",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "地址：深圳龙岗新区",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class CardVideoInfoWidget extends StatelessWidget {
  const CardVideoInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.all(15),
      child: Column(
        children: [
          Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            elevation: 10,
            shadowColor: Colors.black54,
            child: Image.network(
              "https://img2.baidu.com/it/u=1898128106,2722598876&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800",
              width: double.infinity,
              height: 400,
              fit: BoxFit.fill,
            ),
          ),

        ],
      ),
    );
  }
}
