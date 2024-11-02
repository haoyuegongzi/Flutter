

import 'package:flutter/material.dart';

main() {
  runApp(const ConstraubedLessWidget());
}

class ConstraubedLessWidget extends StatelessWidget {
  const ConstraubedLessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 200,
        minHeight: 100,
      ),
      child: Container(
        width: 60,
        height: 20,
        color:Colors.purple,
        // child: const Text(
        //     "真是麻烦，要不是不能轻易动用神念和法力，怕招来高阶的人族修士，又怎会这般束手束脚，还要靠这几名蠢物来办事。不过此地也不能久待了，必须尽快办完事情离开的。",
        //     textDirection: TextDirection.ltr,
        //     maxLines: 5,
        //     style: TextStyle(
        //       color: Colors.blueGrey,
        //       backgroundColor: Colors.green
        //     ),
        // ),
      )
    );
  }

}









