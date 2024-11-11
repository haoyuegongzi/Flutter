import 'package:flutter/material.dart';
import 'package:learnflutterdemo/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MultilingualInternationalLessWidget());
}

// 1. pubspec.yaml添加依赖库：
//    dependencies:
//        intl: ^0.18.1、
//    dev_dependencies:
//        intl_generator: ^0.4.1
// 2. AndroidStudio菜单栏--->Tools--->Flutter IntL--->Initialize for the project;
//    生成 l10n文件夹（包含intl_en.arb文件）和 generated文件夹（包含l10n.dart文件
//    和intl文件夹（包含messages_all.dart、messages_en.dart、messages_zh.dart三个文件））
// 3. 在  l10n文件夹 中新建 “intl_zh.arb”文件；
// 4. 在 “intl_zh.arb”文件、“intl_en.arb文件”中分别输入：
//    {
//      "title": "Flutter 国际化",
//      "content": "您多次点击按钮"
//    }
//  ============================================================================
//    {
//      "title": "Flutter intl",
//      "content": "You have click the button many times"
//    }
// 5. 编辑、实现如下界面和逻辑（参考：https://zhuanlan.zhihu.com/p/702521807）
class MultilingualInternationalLessWidget extends StatelessWidget {
  const MultilingualInternationalLessWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  String title = "";

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(S.of(context).title)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(S.of(context).content),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () {
        //   incrementCounter();
        // },
        onPressed: incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
