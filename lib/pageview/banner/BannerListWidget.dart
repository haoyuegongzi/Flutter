import 'package:flutter/cupertino.dart';

class BannerListWidget extends StatelessWidget {
  String srcLink = "";

  BannerListWidget(
      {required this.srcLink, super.key}
  );

  @override
  Widget build(BuildContext context) {
    print("BannerListWidget--->build(BuildContext context)");
    return SizedBox(
      child: Image.network(srcLink, fit: BoxFit.cover,),
    );
  }
}
