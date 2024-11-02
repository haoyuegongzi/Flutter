
import 'package:flutter/material.dart';

main() {
  runApp(const EditlessWidget());
}

class EditlessWidget extends StatelessWidget {
  const EditlessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: "Flutter 可编辑输入框",
      home: EditTextFulWidget(),
    );
  }
}

class EditTextFulWidget extends StatefulWidget {
  const EditTextFulWidget({super.key});

  @override
  State<StatefulWidget> createState() => EditTextFullState();
}

class EditTextFullState extends State<EditTextFulWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController psdController = TextEditingController();
  final GlobalKey formKey = GlobalKey<FormState>();
  String etName = "";
  String etPassword = "";

  @override
  void initState() {
    super.initState();
    nameController.addListener(() {
      debugPrint("nameController的监听的信息：${nameController.text}");
    });
    psdController.addListener(() {
      debugPrint("psdController的监听信息：${psdController.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topCenter,
      // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
      width: double.infinity,
      height: double.infinity,

      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "有选择状态的导航bar",
              style: TextStyle(color: Colors.black, fontSize: 28),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          children: [
            TextField(
              autofocus: true,
              controller: nameController,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: "用户名",
                  hintText: "请输入用户名或者邮箱或者手机号",
                  prefixIcon: Icon(Icons.person)
              ),
              onChanged: (s) {
                debugPrint("TextField，onChanged 用户名输入信息变化：$s");
              },
              onEditingComplete: () {
                debugPrint("TextField，onEditingComplete 用户名输入 完成");
              },
              onSubmitted: (s) {
                etName = s;
                debugPrint("TextField，onSubmitted 用户名输入 提交：${s}");
              },
              onTapOutside: (e) {
                debugPrint("TextField，onTapOutside 用户名输入 点击输入框外面的监听：${e.toString()}");
              },
            ),
            TextField(
              autofocus: true,
              controller: psdController,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: "登录密码",
                  hintText: "请输入登录密码",
                  prefixIcon: Icon(Icons.lock)
              ),
              onChanged: (s) {
                debugPrint("TextField，onChanged 密码输入信息变化：$s");
              },
              onEditingComplete: () {
                debugPrint("TextField，onEditingComplete 密码输入 完成");
              },
              onSubmitted: (s) {
                etPassword = s;
                debugPrint("TextField，onSubmitted 密码输入 提交：${s}");
              },
              onTapOutside: (e) {
                debugPrint("TextField，onTapOutside 密码输入 点击输入框外面的监听：${e.toString()}");
              },
            )
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
  //     child: Form(
  //       key: _formKey,
  //       autovalidateMode: AutovalidateMode.always,
  //       child: Column(
  //         children: <Widget>[
  //           TextFormField(
  //             autofocus: true,
  //             controller: _nameController,
  //             decoration: const InputDecoration(
  //                 labelText: '用户名',
  //                 hintText: '用户名或密码',
  //                 icon: Icon(Icons.person)
  //             ),
  //             validator: (value) {// 校验用户名
  //               return value!.trim().isNotEmpty ? null : '用户名不能为空';
  //             },
  //           ),
  //           TextFormField(
  //             controller: _psdController,
  //             obscureText: true,
  //             decoration: const InputDecoration(
  //                 labelText: '密码',
  //                 hintText: '登录密码',
  //                 icon: Icon(Icons.lock)
  //             ),
  //             validator: (psd) {
  //               return psd!.trim().length > 5 ? null : '密码不能少于6位';
  //             },
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(top: 30),
  //             child: Row(
  //               children: <Widget>[
  //                 Expanded(
  //                   child: RaisedButton(
  //                     padding: const EdgeInsets.all(15),
  //                     child: const Text('登录'),
  //                     color: Theme.of(context).primaryColor,
  //                     textColor: Colors.white,
  //                     onPressed: () {
  //                       // 反正这里我是没看懂, 后面再慢慢学习吧
  //                       if((_formKey.currentState as FormState).validate()){
  //                         //验证通过提交数据
  //                       }
  //                     },
  //                   ),
  //                 )
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
























