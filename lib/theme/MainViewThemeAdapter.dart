
import 'package:flutter/material.dart';
import 'package:learnflutterdemo/theme/ThemeManager.dart';
import 'package:provider/provider.dart';

final ThemeData lightTheme = ThemeData.light();
final ThemeData darkTheme = ThemeData.dark();

main() {
  runApp(const MainViewThemeAdapter());
}

class MainViewThemeAdapter extends StatelessWidget{
  const MainViewThemeAdapter({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( // 这里我们借助于 provider三方库 来实现主题Theme的更换
        create: (context) => ThemeManager(lightTheme),
      child: const MaterialAppTheme(),
    );
  }
}

class MaterialAppTheme extends StatelessWidget {
  const MaterialAppTheme({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeManager tm = Provider.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: tm.themeData,
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            child: const Text("主题换肤"),
            onPressed: (){
              changeTheme(tm);
            },
          ),
        ),
      ),
    );
  }

  void changeTheme(ThemeManager themeManager) {
    themeManager.setTheme(themeManager.themeData == lightTheme ? darkTheme : lightTheme);
  }
}






