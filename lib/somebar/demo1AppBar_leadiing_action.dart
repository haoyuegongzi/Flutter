import 'package:flutter/material.dart';
import 'package:learnflutterdemo/somebar/KeepAliveWrapper.dart';

main() {
  runApp(MaterialApp(
    // 去掉右上角的 “debug” 标识；
    debugShowCheckedModeBanner: false,
    // 关于这个 title，如果该界面是显示在 网页上面，那么 该网页的头部标题就是 这个title的内容。
    title: "有选择状态的导航bar",
    theme: ThemeData(primarySwatch: Colors.cyan),
    home: const HomeTab(),
  ));
}

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<StatefulWidget> createState() {
    return CreateHomeTab();
  }
}

class CreateHomeTab extends State<HomeTab> with SingleTickerProviderStateMixin {
  // 这里设置默认选中哪一个 Item
  int currenPosition = 0;
  late TabController mTabController;
  List<Widget> tabListPage = [
    const Text(
      "推荐",
    ),
    const Text(
      "直播",
    ),
    const Text(
      "财经",
    ),
    // 这里用我们自定义的 KeepAliveWrapper 来保持 列表的滑动状态（更准确的说是保持 汽车 这个子模块的界面的状态）
    // 注意使用方式：是将要保存的 界面 的Widget 作为 child 放在 KeepAliveWrapper 的内部。
    KeepAliveWrapper(
      keepAlive: true,
      child: ListView(
        children: const [
          ListTile(
              title: Text(
            "比亚迪王朝系列-秦",
          )),
          ListTile(
              title: Text(
            "比亚迪王朝系列-汉",
          )),
          ListTile(
              title: Text(
            "比亚迪王朝系列-宋",
          )),
          ListTile(
              title: Text(
            "比亚迪王朝系列-唐",
          )),
          ListTile(
              title: Text(
            "比亚迪王朝系列-元",
          )),
          ListTile(
              title: Text(
            "比亚迪海洋系列-驱逐舰",
          )),
          ListTile(
              title: Text(
            "比亚迪海洋系列-护卫舰",
          )),
          ListTile(
              title: Text(
            "比亚迪海洋系列-海鸥",
          )),
          ListTile(
              title: Text(
            "比亚迪海洋系列-海豹",
          )),
          ListTile(
              title: Text(
            "比亚迪-仰望",
          )),
          ListTile(
              title: Text(
            "比亚迪-方程豹",
          )),
        ],
      ),
    ),

    const Text(
      "影视",
    ),
    const Text(
      "情感",
    ),
    const Text(
      "健康",
    ),
    const Text(
      "历史",
    ),
    ListView(
      children: const [
        ListTile(
          title: Text("八卦列表"),
        )
      ],
    ),
    // Icon(Icons.more_horiz)
  ];
  final List<Tab> tabList = const [
    Tab(
        child: Text(
      "推荐",
    )),
    Tab(
        child: Text(
      "直播",
    )),
    Tab(
        child: Text(
      "财经",
    )),
    Tab(
        child: Text(
      "汽车",
    )),
    Tab(
        child: Text(
      "影视",
    )),
    Tab(
        child: Text(
      "情感",
    )),
    Tab(
        child: Text(
      "健康",
    )),
    Tab(
        child: Text(
      "历史",
    )),
    Tab(
        child: Text(
      "八卦",
    )),
  ];

  @override
  void initState() {
    super.initState();
    mTabController = TabController(length: tabList.length, vsync: this);
    // 这里给 mTabController 添加监听，通过 mTabController 可以获取到 对应的数据;
    // 注意：1、状态的监听，只能是在 initState() 方法里面 实现。
    //      2、addListener() 监听会被调用两次，效果不是很理想；需要额外的判断来过滤。
    //      3、好处是：可以同时监听 点击事件 和 滑动事件。
    mTabController.addListener(() {
      // 这个 判断可以过滤监听被多次调用；只调用一次。
      if (mTabController.animation!.value == mTabController.index) {// mTabController 的 animation 有可能为空。
        print("addListener() mTabController.animation.value：${mTabController.animation!.value}");
      }
    });
  }
  // 要监听界面的 位置index，有以下两种方式实现：
  //    1、在 initState() 方法里面给 mTabController 添加 addListener() 监听；
  //    2、在 TabBar 内部 添加 onTap:(index) 监听。
  @override
  Widget build(BuildContext context) {
    // 点击 BottomNavigationBar 实现大模块切换功能，我们可以将 AppBar-TabBar 下放到 子级模块里面去，
    // 通过 Scaffold 嵌套 Scaffold 的方式来实现；
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90), // AppBar的整体高度
          child: AppBar(
            title: const Text(
              "尝试AppBar与TabBar的组合",
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            backgroundColor: Colors.white,
            centerTitle: false,
            // 控制title是否必须水平居中显示
            leading: IconButton(
              // 配置的是标题左侧的图标；
              iconSize: 32,
              color: Colors.blueGrey,
              focusColor: Colors.blueGrey,
              icon: const Icon(Icons.account_circle),
              onPressed: () {
                // 通过 setState()方法 将 BottomNavigationBar 的Item切换到指定的位置去；这里是切换到最后一个；
                // 这里，必须通过 setState() 方法来动态的更新状态。相当于Android中的 notify... 方法
                setState(() {
                  currenPosition = 3;
                });
                print("leading图标表示的账户信息：。。。。。。");
              },
            ),
            leadingWidth: 45,
            // 控制 title 与 leading 的距离
            actions: [
              // 配置的是标题右侧的图标
              SizedBox(
                width: 40,
                height: double.infinity,
                child: IconButton(
                  iconSize: 25,
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    print("search图标表示的搜索信息：。。。。。。");
                  },
                ),
              ),
              SizedBox(
                  width: 40,
                  height: double.infinity,
                  child: IconButton(
                    iconSize: 25,
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () {
                      print("more_horiz图标表示更多信息：。。。。。。");
                    },
                  )),
            ],
            // TabBar 需要结合下面的 TabBarView 一起使用，然后通过 TabController 作为纽带，实现 上下界面的联动切换。
            // TabBar 也是 AppBar 的一部分。
            bottom: TabBar(
              // 控制 TabBar 的对齐方式，
              // start:左对齐，左边没有间距；center:居中对齐，这个参数在宽度/高度超过一屏时，无效；
              // startOffset:左边有一个间距，大约一个Item宽度大小；
              // 上面 3 个属性必须配合 isScrollable = true 来使用，否则，抛异常
              // fill:必须配合 isScrollable = false 来使用，否则出现意想不到的异常。
              tabAlignment: TabAlignment.start,
              controller: mTabController,
              dividerColor: Colors.pinkAccent,
              // 控制label标签的内间距。
              // labelPadding: const EdgeInsetsDirectional.all(5),
              tabs: tabList,
              indicatorWeight: 2,
              // 控制 indicator 指示器 的 高度。
              isScrollable: true,
              //控制TabBar是可以滑动显示还是 占满宽度。如果是可以滑动，那么效果就跟Android的ViewPager一样的效果
              indicatorPadding: const EdgeInsetsDirectional.all(2),
              // 控制 indicator 指示器与周边部的距离
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.red,
              indicatorColor: Colors.red,
              labelStyle: const TextStyle(color: Colors.red, fontSize: 16),
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: const TextStyle(color: Colors.black, fontSize: 13),
              // onTap()监听 只能监听到 点击事件，监听不到滑动事件。
              onTap: (index) {
                print("onTap(): index = $index}");
              },
            ),
          )),
      // 在这里，将上面的bottom：TabBar 与下面的 body：TabBarView 结合起来，结合的纽带是：controller
      body: TabBarView(
        controller: mTabController,
        children: tabListPage,
      ),
      // index
      // 注意：当 BottomNavigationBar 里面的 子BottomNavigationBarItem 数量超过 3个 的时候, 会出现背景色变白，文字消失的问题。
      // 我们需要将 BottomNavigationBar的 type属性 特别设置为 BottomNavigationBarType.fixed，item才会显示正常。
      // 但Item数量在3个及以下时，设置该属性，会运行失败。
      // type属性默认是 BottomNavigationBarType.shifting。
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.shifting,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        selectedLabelStyle: const TextStyle(
            color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.black26,
        unselectedLabelStyle:
            const TextStyle(color: Colors.black26, fontSize: 14),
        selectedIconTheme: const IconThemeData(color: Colors.green),
        unselectedIconTheme: const IconThemeData(color: Colors.black26),
        backgroundColor: Colors.white,
        iconSize: 20,
        // 下面几行是实现 底部导航栏 实现 点击选中 效果的关键；
        currentIndex: currenPosition,
        onTap: (index) {
          setState(() {
            currenPosition = index;
            print("currenPosition: $currenPosition");
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance,
                color: Colors.black26,
              ),
              label: "首页",
              backgroundColor: Colors.black26),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_chart,
                color: Colors.black26,
              ),
              label: "账单",
              backgroundColor: Colors.black26),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_alarm_sharp,
                color: Colors.black26,
              ),
              label: "紧急事件",
              backgroundColor: Colors.black26),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: Colors.black26,
              ),
              label: "我的",
              backgroundColor: Colors.black26)
        ],
      ),
    );
  }

  // Widget组件销毁时会调用触发；
  @override
  void dispose() {
    super.dispose();
    mTabController.dispose();
  }
}
