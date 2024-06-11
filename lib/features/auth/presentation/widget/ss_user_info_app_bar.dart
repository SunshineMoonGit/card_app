// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';

// class SsUserInfoAppBar extends StatelessWidget {
//   final String? cardImage;
//   final String? profileImage;

//   const SsUserInfoAppBar({
//     super.key,
//     this.cardImage = 'https://source.unsplash.com/random/500×500',
//     this.profileImage = 'https://thispersondoesnotexist.com/',
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SsAppBar(
//       leadingIcon: const SsIcon(
//         icon: Icon(Icons.arrow_back),
//       ),
//       leadingOnTap: () => context.pop(),
//       // expandedHeight: 250,
//       // flexibleSpace: FlexibleSpaceBar(
//       //   collapseMode: CollapseMode.pin,
//       //   background: SsProfileTopImage(cardImage: cardImage!, profileImage: profileImage!),
//       // ),
//     );
//   }
// }

// class SsProfileTopImage extends StatelessWidget {
//   final String cardImage;
//   final String profileImage;

//   const SsProfileTopImage({
//     super.key,
//     required this.cardImage,
//     required this.profileImage,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Align(
//           alignment: Alignment.topCenter,
//           child: SizedBox(
//             height: 200,
//             width: SsUi.deviceWidth,
//             child: Image.network(
//               cardImage,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         const Positioned(
//           bottom: 0,
//           left: 30,
//           right: 30,
//           child: SsProfilePageCircleAvatar(),
//         ),
//       ],
//     );
//   }
// }

// class SsProfilePageCircleAvatar extends ConsumerWidget {
//   const SsProfilePageCircleAvatar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Stack(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(5),
//           decoration: const ShapeDecoration(
//             shape: CircleBorder(),
//           ),
//           child: const Stack(
//             children: [
//               CircleAvatar(
//                 backgroundImage: AssetImage('assets/icons/profile_selected.png'),
//                 radius: 45,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
