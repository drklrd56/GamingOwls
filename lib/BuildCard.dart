// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';

// class BuildCard extends StatelessWidget {
//   Widget _buildComponentDescription(
//       String iconPath, String name, String description) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 8,
//         ),
//         Row(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Image.asset(
//                 iconPath,
//                 color: Colors.white,
//                 height: 33,
//                 width: 33,
//               ),
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   AutoSizeText(
//                     name,
//                     maxLines: 1,
//                     maxFontSize: 14,
//                     minFontSize: 14,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   AutoSizeText(
//                     description,
//                     maxLines: 1,
//                     maxFontSize: 14,
//                     minFontSize: 14,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 8,
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(11.0),
//           color: const Color(0xbd242424),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.only(left: 8, top: 8.0, bottom: 8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 8),
//                 child: AutoSizeText(
//                   'FROM PUBG, GRAND THEFT AUTO 5 and 3 more',
//                   maxLines: 1,
//                   style: TextStyle(
//                     fontFamily: 'Roboto',
//                     fontSize: 12,
//                     color: const Color(0xccffffff),
//                     letterSpacing: -0.24,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0, left: 8.0),
//                 child: Text(
//                   'Pro Gamer Build',
//                   style: TextStyle(
//                     fontFamily: 'Roboto',
//                     fontSize: 16,
//                     color: const Color(0xffffffff),
//                     letterSpacing: -0.48,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ),
//               _buildComponentDescription('assets/icons8-electronics-100.png',
//                   "Intel Core i7-10100HK", "5.1 GHz - 8 core  - 16 threads"),
//               Center(
//                 child: Container(
//                   height: 1.00,
//                   color: Color(0xff707070).withOpacity(0.35),
//                 ),
//               ),
//               _buildComponentDescription(
//                   'assets/icons8-video-card-100.png',
//                   "Gigabyte RTX 2080 Super MAX Q Ultra Windforce bla bla bla bla ",
//                   "1024 CUDA core - 1.7 Ghz - 16GB"),
//               Center(
//                 child: Container(
//                   height: 1.00,
//                   color: Color(0xff707070).withOpacity(0.35),
//                 ),
//               ),
//               _buildComponentDescription('assets/icons8-memory-slot-100.png',
//                   "SKhynix RGB Gaming RAM", "32 GB - 3777 Mhz- Dual Channel"),
//               Center(
//                 child: Container(
//                   height: 1.00,
//                   color: Color(0xff707070).withOpacity(0.35),
//                 ),
//               ),
//               _buildComponentDescription('assets/icons8-hdd-100.png',
//                   "Samsung EVO ", "2 TB - 3500 MB read - 2500 write- PCIe 4.0"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
