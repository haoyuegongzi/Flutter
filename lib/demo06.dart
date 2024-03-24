import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp( MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "二货Flutter，似乎会JavaScript的人学起来更轻松的样子",
          textAlign:TextAlign.start,
          maxLines: 1,
          style: TextStyle(
            color: Colors.deepOrange,
            backgroundColor: Color.fromARGB(122, 255, 255, 0),
            fontStyle: FontStyle.normal,
            fontSize: 24,
          ),
          textDirection: TextDirection.ltr,
          overflow: TextOverflow.ellipsis,
          selectionColor: Colors.green,
        ),
        shadowColor: Colors.purple,
      ),
      body: const MyW(),
    ),
  ));
}

class MyW extends StatelessWidget {
  const MyW({super.key});

  @override
  Widget build(BuildContext context) {
   return const Center(
     child: Text(
       "这是Flutter的body",
       textDirection: TextDirection.rtl,
       style: TextStyle(
           color: Colors.amber,
           backgroundColor: Color.fromARGB(0, 255, 0, 0),
           fontStyle: FontStyle.italic,
           fontSize: 24,
           fontWeight: FontWeight.normal,
           decoration: TextDecoration.lineThrough,
           decorationColor: Colors.lime,
           decorationStyle: TextDecorationStyle.dashed,
           decorationThickness: 1.1
       ),
     ),
   );
  }
}

class MyAppBar extends StatelessWidget{
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "二货Flutter，似乎会JavaScript的人学起来更轻松的样子",
        textAlign:TextAlign.start,
        maxLines: 1,
        style: TextStyle(
          color: Colors.deepOrange,
          backgroundColor: Color.fromARGB(122, 255, 255, 0),
          fontStyle: FontStyle.normal,
          fontSize: 24,
        ),
        textDirection: TextDirection.ltr,
        overflow: TextOverflow.ellipsis,
        selectionColor: Colors.green,
      ),
      shadowColor: Colors.purple,
    );
  }

}