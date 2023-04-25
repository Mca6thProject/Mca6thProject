// import 'package:any_link_preview/any_link_preview.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:routemaster/routemaster.dart';

// import '../../responsive/responsive.dart';
// import '../controller/post_controller.dart';
// import '../post_model.dart';

// class PostCard extends ConsumerWidget {
//   final Post post;
//   const PostCard({
//     super.key,
//     required this.post,
//   });

//   void deletePost(WidgetRef ref, BuildContext context) async {
//     ref.read(postControllerProvider.notifier).deletePost(post, context);
//   }

//   // void upvotePost(WidgetRef ref) async {
//   //   ref.read(postControllerProvider.notifier).upvote(post);
//   // }

//   // void downvotePost(WidgetRef ref) async {
//   //   ref.read(postControllerProvider.notifier).downvote(post);
//   // }

 

 
 

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final user = ref.watch(userProvider)!;
//    // final isGuest = !user.isAuthenticated;

//    // final currentTheme = ref.watch(themeNotifierProvider);

//     return Responsive(
//       child: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               //color: currentTheme.drawerTheme.backgroundColor,
//             ),
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (kIsWeb)
//                   Column(
//                     children: [
//                       IconButton(
//                         onPressed: (){},
//                         icon: Icon(
//                         Icons.thumb_up,
//                           size: 30,
//                           // color: post.upvotes.contains(user.uid)
//                           //     ? Pallete.redColor
//                           //     : null,
//                         ),
//                       ),
//                       const Text(
//                         '00',
//                         style: TextStyle(fontSize: 17),
//                       ),
//                     IconButton(
//                         onPressed: (){},
//                         icon: Icon(
//                         Icons.thumb_up,
//                           size: 30,
//                           // color: post.upvotes.contains(user.uid)
//                           //     ? Pallete.redColor
//                           //     : null,
//                         ),
//                       ),
//                       const Text(
//                         '00',
//                         style: TextStyle(fontSize: 17),
//                       ),
//                     ],
//                   ),
//                 Expanded(
//                   child: Column(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           vertical: 4,
//                           horizontal: 16,
//                         ).copyWith(right: 0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   children: [
//                                     GestureDetector(
//                                       onTap: (){},
//                                       child: CircleAvatar(
//                                         // backgroundImage: NetworkImage(
//                                         //   post.communityProfilePic,
//                                         // ),
//                                         radius: 16,
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 8),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             'r/${post.title}',
//                                             style: const TextStyle(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                           GestureDetector(
//                                             onTap: () {},
                                               
//                                             child: Text(
//                                               'u/${post.createdAt,
//                                               style:
//                                                   const TextStyle(fontSize: 12),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                             //     if (post.uid == user.uid)
//                             //       IconButton(
//                             //         onPressed: () => deletePost(ref, context),
//                             //         icon: Icon(
//                             //           Icons.delete,
//                             //           color: Pallete.redColor,
//                             //         ),
//                             //       ),
//                             //   ],
//                             // ),
//                             if (post.awards.isNotEmpty) ...[
//                               const SizedBox(height: 5),
//                               SizedBox(
//                                 height: 25,
//                                 child: ListView.builder(
//                                   scrollDirection: Axis.horizontal,
//                                   itemCount: post.awards.length,
//                                   itemBuilder:
//                                       (BuildContext context, int index) {
//                                     final award = post.awards[index];
//                                     return Image.asset(
//                                       Constants.awards[award]!,
//                                       height: 23,
//                                     );
//                                   },
//                                 ),
//                               ),
//                             ],
//                             Padding(
//                               padding: const EdgeInsets.only(top: 10.0),
//                               child: Text(
//                                 post.title,
//                                 style: const TextStyle(
//                                   fontSize: 19,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                             if (isTypeImage)
//                               SizedBox(
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.35,
//                                 width: double.infinity,
//                                 child: Image.network(
//                                   post.link!,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             if (isTypeLink)
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 18),
//                                 child: AnyLinkPreview(
//                                   displayDirection:
//                                       UIDirection.uiDirectionHorizontal,
//                                   link: post.link!,
//                                 ),
//                               ),
//                             if (isTypeText)
//                               Container(
//                                 alignment: Alignment.bottomLeft,
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 15.0),
//                                 child: Text(
//                                   post.description!,
//                                   style: const TextStyle(
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                         ),
//                       ),
                  
//                 ),
//             ),
//           ),
//           const SizedBox(height: 10),
//         ],
    
    
  

