// import 'package:flutter/material.dart';
//
// class PageViewIndicator extends StatefulWidget {
//   final PageController controller;
//   final int itemCount;
//   final ValueChanged<int> onPageSelected;
//
//   const PageViewIndicator({
//     super.key,
//     required this.controller,
//     required this.itemCount,
//     required this.onPageSelected,
//   });
//
//   @override
//   State<PageViewIndicator> createState() => ViewIndicator();
// }
//
// class ViewIndicator extends State<PageViewIndicator> {
//   late int currentIndex;
//
//   @override
//   void initState() {
//     super.initState();
//     widget.controller.addListener(() {
//       if (widget.controller.position.haveDimensions) {
//         setState(() {
//           currentIndex = widget.controller.page!.round();
//         });
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     widget.controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.blue,
//       height: 50.0,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: List.generate(widget.itemCount, (index) {
//           return GestureDetector(
//             onTap: () {
//               widget.onPageSelected(index);
//             },
//             child: Container(
//               width: 10.0,
//               height: 10.0,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: currentIndex == index ? Colors.white : Colors.grey,
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }