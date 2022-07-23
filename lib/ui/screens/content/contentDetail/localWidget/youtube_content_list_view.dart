// import 'package:movie_curation/utilities/index.dart';
//
// class YoutubeContentsListView extends StatelessWidget {
//   const YoutubeContentsListView({Key? key, required this.youtubeVM})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<YoutubeVM>(
//       init: youtubeVM,
//       builder: (context) {
//         final queryList = youtubeVM.youtubeSearchedQueryList;
//         return queryList.isEmpty
//             ? Center(
//                 child:
//                     Text("컨텐츠가 없습니다", style: FontStyles().noneOfContentsData))
//             : ListView.builder(
//                 padding: const EdgeInsets.only(left: 16, right: 16, top: 36),
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: youtubeVM.youtubeSearchedQueryList.length,
//                 itemBuilder: (context, index) {
//                   final youtubeContent = queryList[index];
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       thumbnailImage(youtubeContent),
//                       Container(
//                         margin: EdgeInsets.only(top: 8, bottom: 36),
//                         child: Text(
//                           youtubeContent.snippet.title,
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               );
//       },
//     );
//   }
//
//   /* Thumbnail Image */
//   Widget thumbnailImage() {
//     return Stack(
//       children: [
//         AspectRatio(
//           aspectRatio: 16 / 9,
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(11),
//             child: CachedNetworkImage(
//               imageUrl: query.snippet.thumbnails.medium.url,
//               imageBuilder: (context, imageProvider) => Container(
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: imageProvider,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               placeholder: (context, url) =>
//                   const Center(child: CircularProgressIndicator()),
//               errorWidget: (context, url, error) =>
//                   const Center(child: Icon(Icons.error)),
//             ),
//           ),
//         ),
//         /* Linear Bacground */
//       ],
//     );
//   }
// }
