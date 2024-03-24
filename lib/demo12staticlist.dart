import 'package:flutter/material.dart';

main() {
  runApp(
    MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
                "学习Flutter的列表技能",
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                color: Colors.purple,
                fontSize: 32,
                fontFamily: "这是什么属性？",
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                wordSpacing: 1.2,
                decorationColor: Colors.teal,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
          ),
          body: const HorizontalListView(),
    )),
  );
}

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsetsDirectional.all(15),
      children: <Widget>[
        const ListTile(
          title: Text("Flutter的List列表的第一个Item：时钟"),
          tileColor: Colors.blue,
          // leading是指Item前面的图标；trailing是指Item后面的图标。
          leading: Icon(
            Icons.access_time_filled_sharp,
            color: Colors.orange,
          ),
          trailing:Icon(Icons.chevron_right),
        ),
        const Divider(),
        const ListTile(
          title: Text("Flutter的List列表的第二个Item：雪花"),
          tileColor: Colors.blue,
          leading: Icon(
            Icons.ac_unit_rounded,
            color: Colors.purpleAccent,
          ),
          trailing: Icon(Icons.chevron_right),
        ),
        const Divider(),
        const ListTile(
          title: Text("Flutter的List列表的第三个Item：雪花"),
          tileColor: Colors.blue,
          leading: Icon(
            Icons.add_a_photo_rounded,
            color: Colors.lightBlueAccent,
          ),
          trailing: Icon(Icons.chevron_right),//chevron_right
        ),
        const Divider(),
        ListTile(
          leading: Image.network("https://www.itying.com/images/flutter/5.png"),
          title: const Text('鸿星尔克捐1个亿帮助困难残疾群体 网友：企业有担当'),
        ),
        const Divider(),
        ListTile(
          leading: Image.network("https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=false&word=%E5%AE%87%E5%AE%99%E5%A3%81%E7%BA%B8%E9%BB%91%E8%89%B2&step_word=&hs=0&pn=8&spn=0&di=7308398814245683201&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=0&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=-1&cs=290574476%2C4084036938&os=4198044595%2C1813455489&simid=290574476%2C4084036938&adpicid=0&lpn=0&ln=1424&fr=&fmq=1710665714219_R&fm=rs1&ic=undefined&s=undefined&hd=undefined&latest=undefined&copyright=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&ist=&jit=&cg=wallpaper&bdtype=0&oriquery=%E5%A3%81%E7%BA%B8&objurl=https%3A%2F%2Fimg-baofun.zhhainiao.com%2Ffs%2F0213f139eb92ee7058f85c24829f8b21.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fktzit_z%26e3Bt3tgfiwg_z%26e3Bv54AzdH3FlAzdH3Fnd9cad_z%26e3Bfip4s&gsm=1e&rpstart=0&rpnum=0&islist=&querylist=&nojc=undefined&lid=11065455671771836309"),
          title: const Text(
              "data",
            style: TextStyle(
              color: Colors.brown
            ),
          ),
          subtitle: const Text("宇宙壁纸黑色"),
        ),
        const Divider(),
        ListTile(
          leading: Image.network(
              "https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=false&word=%E5%AE%87%E5%AE%99%E5%A3%81%E7%BA%B8%E9%BB%91%E8%89%B2&step_word=&hs=0&pn=8&spn=0&di=7308398814245683201&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=0&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=-1&cs=290574476%2C4084036938&os=4198044595%2C1813455489&simid=290574476%2C4084036938&adpicid=0&lpn=0&ln=1424&fr=&fmq=1710665714219_R&fm=rs1&ic=undefined&s=undefined&hd=undefined&latest=undefined&copyright=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&ist=&jit=&cg=wallpaper&bdtype=0&oriquery=%E5%A3%81%E7%BA%B8&objurl=https%3A%2F%2Fimg-baofun.zhhainiao.com%2Ffs%2F0213f139eb92ee7058f85c24829f8b21.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fktzit_z%26e3Bt3tgfiwg_z%26e3Bv54AzdH3FlAzdH3Fnd9cad_z%26e3Bfip4s&gsm=1e&rpstart=0&rpnum=0&islist=&querylist=&nojc=undefined&lid=11065455671771836309"
          ),
          // leading: Image.network("https://www.itying.com/images/flutter/1.png"),
          // leading: Image.asset("images/3.0x/3xp.jpg"),
          title: const Text('上古十大神器之一'),
          subtitle: const Text("东皇太一的法器"),
        ),
      ],
    );
  }
}

class MyListWidget extends StatelessWidget {
  const MyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // ListView控件没有设置宽高的参数
    return ListView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
      children: <Widget>[
        Container(
          // 在 ListView 中，对 Container容器控件 设置 width宽度，是无效的。设置 height高度是可以的。
          padding: const EdgeInsets.fromLTRB(10, 25, 10, 25),
          decoration: const BoxDecoration(color: Colors.teal),
          child: Column(
            children: [
              SizedBox(
                child: Image.network(
                  "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313",
                    fit: BoxFit.cover
                ),
              ),
              const Text(
                  "111",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 32
                ),
              ),
            ]
          ),
        )
      ],
    );
  }
}

class MyListImage extends StatelessWidget {
  const MyListImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(32, 24, 32, 24),
      children: <Widget>[
        Image.network(
            height: 320,
            width: 500,
          "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
        ),
        // Image.asset('images/2xp.jpg'),
        const Divider(),
        Image.network(
            height: 320,
            width: 500,
          "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
        ),
        // Image.asset('images/donghuang.jpg'),
        const Divider(),
        Image.network(
          "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313",
          height: 320,
          width: 500,
        ),
        // Image.asset('images/px.jpg'),
        const Divider(),
        Image.network(
            height: 320,
            width: 500,
          "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
        ),
        const Divider(),
        Image.network(
            height: 320,
            width: 500,
          "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
        ),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 500,
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          Image.network("https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"),
          Container(
            padding:const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: const Text(
              '我是一个标题',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const Divider(),
          Image.network("https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"),
          Container(
            padding:const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: const Text(
              '我是二个标题',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const Divider(),
          Image.network("https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"),
          Container(
            padding:const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: const Text(
              '我是三个标题',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const Divider(),
          Image.network("https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"),
          Container(
            padding:const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: const Text(
              '我是四个标题',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const Divider(),
          Image.network("https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"),
          Container(
            padding:const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: const Text(
              '我是五个标题',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const Divider(),
          Image.network("https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"),
          Container(
            padding:const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: const Text(
              '我是六个标题',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const Divider(),
          Image.network("https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"),
          Container(
            padding:const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: const Text(
              '我是七个标题',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const Divider(),
          Image.network("https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"),
          const Divider(),
          Image.network("https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"),
          const Divider(),
          Image.network("https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"),
        ],
      ),
    );
  }
}

class MySizedBoxListWidget extends StatelessWidget {
  const MySizedBoxListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // ListView控件没有设置宽高的参数，因此，想要给ListView设置宽高参数，
    // 就需要在其外面包裹一层其他控件，比如：Container 或者 SizedBox
    return SizedBox(
        width: 600,
        height: 720,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
          children: <Widget>[
            Container(
              // 在 ListView 中，对 Container容器控件 设置 width宽度，是无效的。设置 height高度是可以的。
              decoration: const BoxDecoration(color: Colors.teal),
              child: Column(
                  children: [
                    SizedBox(
                      height: 150, //图片高度需要设置比box高低,不然会报错
                      child: Image.network(
                        "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313",
                          fit: BoxFit.cover
                      ),
                    ),
                    const Text(
                      "Title标题",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 32
                      ),
                    ),
                  ]
              ),
            ),
            Container(
              // 在 ListView 中，对 Container容器控件 设置 width宽度，是无效的。设置 height高度是可以的。
              decoration: const BoxDecoration(color: Colors.teal),
              child: Column(
                  children: [
                    SizedBox(
                      height: 150, //图片高度需要设置比box高低,不然会报错
                      child: Image.network(
                        "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313",
                          fit: BoxFit.cover),
                    ),
                    const Text(
                      "Title标题",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 32
                      ),
                    ),
                  ]
              ),
            )
          ],
        )
    );
  }
}

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 600,
      height: 320,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
        children: <Widget>[
          Container(
            // color: Colors.purple,
            width: 220,
            decoration: const BoxDecoration(
              color: Colors.lime,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Image.network(
                      "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
                  ),
                ),
                const Text("limeCDDC39FF色")
              ],
            ),
          ),
          Container(
            // color: Colors.teal,
            width: 220,
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Image.network(
                      fit: BoxFit.cover,
                      "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
                  ),
                ),
                const Text("redF44336FF色")
              ],
            ),
          ),
          Container(
            // color: Colors.brown,
            width: 220,
            decoration: const BoxDecoration(
              color: Colors.black87,
            ),
            child: Column(
              children: [
                SizedBox(
                  width: 100,
                  child: Image.network(
                      fit: BoxFit.cover,
                      "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
                  ),
                ),
                const Text("black87000000DD色", style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
          Container(
            // color: Colors.blue,
            width: 220,
            decoration: const BoxDecoration(
              color: Colors.yellow,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Image.network(
                      fit: BoxFit.cover,
                      "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
                  ),
                ),
                const Text("yellowFFEB3BFF色")
              ],
            ),
          ),
          Container(
            // color: Colors.blue,
            width: 220,
            decoration: const BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Image.network(
                      fit: BoxFit.cover,
                      "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
                  ),
                ),
                const Text("indigo3F51B5FF色")
              ],
            ),
          ),
          Container(
            // color: Colors.blue,
            width: 220,
            decoration: const BoxDecoration(
              color: Colors.black54,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Image.network(
                      fit: BoxFit.cover,
                      "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
                  ),
                ),
                const Text("black540000008A色")
              ],
            ),
          ),
          Container(
            // color: Colors.blue,
            width: 220,
            decoration: const BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Image.network(
                      fit: BoxFit.cover,
                      "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
                  ),
                ),
                const Text("deepPurple673AB7FF色")
              ],
            ),
          ),
          Container(
            // color: Colors.blue,
            width: 220,
            decoration: const BoxDecoration(
              color: Colors.brown,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Image.network(
                      fit: BoxFit.cover,
                      "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313"
                  ),
                ),
                const Text("brown795548FF色")
              ],
            ),
          ),
          Container(
            // color: Colors.blue,
            width: 220,
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Image.network(
                      "https://img0.baidu.com/it/u=1378072409,595584516&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313",
                    fit: BoxFit.cover,
                  ),
                ),
                const Text("blueGrey607D8BFF色")
              ],
            ),
          ),
        ],
      ),
    );
    // return ListView(
    //   scrollDirection: Axis.horizontal,
    //   padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
    //   children: <Widget>[
    //     Container(
    //       // color: Colors.purple,
    //       width: 320,
    //       height: 800,
    //       decoration: const BoxDecoration(
    //         color: Colors.lime,
    //       ),
    //     ),
    //     Container(
    //       // color: Colors.teal,
    //       width: 320,
    //       height: 800,
    //       decoration: const BoxDecoration(
    //         color: Colors.red,
    //       ),
    //     ),
    //     Container(
    //       // color: Colors.brown,
    //       width: 320,
    //       height: 800,
    //       decoration: const BoxDecoration(
    //         color: Colors.black87,
    //       ),
    //     ),
    //     Container(
    //       // color: Colors.blue,
    //       width: 320,
    //       height: 800,
    //       decoration: const BoxDecoration(
    //         color: Colors.yellow,
    //       ),
    //     ),
    //   ],
    // );
  }
}












