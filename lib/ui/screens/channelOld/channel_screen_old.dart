// import 'package:movie_curation/domain/models/channel/channel_model.dart';
// import 'package:movie_curation/ui/screens/channelOld/channel_screen_scaffold_old.dart';
// import 'package:movie_curation/ui/screens/channelOld/channel_view_model_old.dart';
// import 'package:movie_curation/ui/widgets/new_gradient_button.dart';
// import 'package:movie_curation/utilities/index.dart';
// import 'package:movie_curation/utilities/resources/fonts.dart';
// import 'package:movie_curation/utilities/resources/space.dart';
//
// class ChannelScreenOld extends BaseScreen<ChannelViewModelOld> {
//   const ChannelScreenOld({Key? key}) : super(key: key);
//
//   @override
//   Widget buildScreen(BuildContext context) {
//     return ChannelScreenScaffoldOld(
//       channelContentListView: _buildChannelContentListView(),
//       channelInfoCarouselSlider: _buildChannelInfoCarouselSlider(),
//       channelThumbnailSlider: _buildChannelThumbnailSlider(),
//     );
//   }
//
//   /* 채널 썸네일 리스트*/
//   Widget _buildChannelThumbnailSlider() => Obx(() => vm.channelInfoList != null
//       ? SizedBox(
//           height: 120,
//           child: ListView.separated(
//             shrinkWrap: true,
//             scrollDirection: Axis.horizontal,
//             itemCount: vm.channelInfoList!.length,
//             separatorBuilder: (BuildContext context, int index) =>
//                 AppSpace.size20,
//             itemBuilder: (context, index) {
//               final String _thumbnailUrlItem =
//                   vm.channelInfoList![index].channelUrl;
//               return Obx(
//                 () => GestureDetector(
//                   onTap: () => vm.onChannelLisItemTapped(index),
//                   child: Opacity(
//                     opacity: vm.selectedChannelIndex == index ? 1 : 0.15,
//                     child: SizedBox(
//                       height: 120,
//                       width: 120,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(100),
//                         child: CachedNetworkImage(
//                           imageUrl: _thumbnailUrlItem,
//                           imageBuilder: (context, imageProvider) => Container(
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 image: imageProvider,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           placeholder: (context, url) => const Center(
//                             child: CircularProgressIndicator(),
//                           ),
//                           errorWidget: (context, url, error) =>
//                               const Icon(Icons.error),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         )
//       : const SizedBox());
//
//   /* 채널 정보 리스트 */
//   Widget _buildChannelInfoCarouselSlider() => Obx(() => vm.channelInfoList !=
//           null
//       ? CarouselSlider.builder(
//           carouselController: vm.swiperController,
//           options: CarouselOptions(
//             autoPlay: false,
//             enlargeCenterPage: true,
//             initialPage: 0,
//           ),
//           itemCount: vm.channelInfoList?.length ?? 0,
//           itemBuilder: (context, itemIndex, pageViewIndex) {
//             final ChannelModel _item = vm.channelInfoList![itemIndex];
//             final List<UserCommentModel> _commentList =
//                 vm.channelInfoList![itemIndex].comments;
//             return Container(
//               constraints: const BoxConstraints(
//                 maxHeight: 448,
//                 maxWidth: 512,
//               ),
//               height: 100,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: AppColor.subDarkGrey,
//               ),
//               padding: const EdgeInsets.all(16),
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 16),
//                       child: Column(
//                         children: <Widget>[
//                           /* 채널 프로필 이미지 */
//                           SizedBox(
//                             height: 70,
//                             width: 70,
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(100),
//                               child: CachedNetworkImage(
//                                 imageUrl: _item.channelUrl,
//                                 imageBuilder: (context, imageProvider) =>
//                                     Container(
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: imageProvider,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                                 placeholder: (context, url) => const Center(
//                                   child: CircularProgressIndicator(),
//                                 ),
//                                 errorWidget: (context, url, error) =>
//                                     const Icon(Icons.error),
//                               ),
//                             ),
//                           ),
//                           AppSpace.size10,
//                           /* 채널명 */
//                           Text(
//                             _item.name,
//                             style: AppTextStyle.headline2
//                                 .copyWith(color: Colors.white),
//                           ),
//                           AppSpace.size4,
//                           /* 채널 Star Rate */
//                           SizedBox(
//                             height: 32,
//                             child: ListView.separated(
//                               separatorBuilder:
//                                   (BuildContext context, int index) =>
//                                       AppSpace.size4,
//                               shrinkWrap: true,
//                               physics: const NeverScrollableScrollPhysics(),
//                               scrollDirection: Axis.horizontal,
//                               itemCount: 5,
//                               itemBuilder: (context, index) =>
//                                   SvgPicture.asset("assets/icons/star_ic.svg"),
//                             ),
//                           ),
//                           Text(
//                             '${Regex.getSubscriberNumber(_item.subscribers)}만 - ${_item.videoCount}개의 비디오',
//                             style: AppTextStyle.body3
//                                 .copyWith(color: Colors.white),
//                           ),
//                           /* 구독자 수 & 비디오 개수 */
//                           const Padding(
//                             padding: EdgeInsets.symmetric(vertical: 10),
//                             child: Divider(
//                               color: AppColor.dividerColor,
//                               thickness: 1,
//                             ),
//                           ),
//                           /* 채널 Description */
//                           Text(
//                             _item.description,
//                             style: AppTextStyle.body1
//                                 .copyWith(color: Colors.white),
//                             maxLines: 5,
//                           ),
//                           AppSpace.size24,
//                           /* 개발자 채널 설명 */
//                           Text(
//                             _item.customDescription,
//                             style: AppTextStyle.body2
//                                 .copyWith(color: Colors.white),
//                             maxLines: 5,
//                           ),
//                           const Spacer(),
//                           Row(
//                             children: <Widget>[
//                               IconButton(
//                                 onPressed: () {},
//                                 icon: SvgPicture.asset(
//                                   'assets/icons/like_fill_ic.svg',
//                                   height: 32,
//                                   width: 32,
//                                   color: AppColor.yellow,
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Column(
//                       children: <Widget>[
//                         /* 섹션 제목 (comment) */
//                         SizedBox(
//                           width: double.infinity,
//                           child: Text(
//                             "Comment",
//                             textAlign: TextAlign.end,
//                             style: AppTextStyle.headline1
//                                 .copyWith(color: Colors.white),
//                           ),
//                         ),
//                         /* 유저 대표 코멘트 리스트 */
//                         Expanded(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: <Widget>[
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     '${_commentList[0].name}' '님',
//                                     style: AppTextStyle.headline3
//                                         .copyWith(color: Colors.white),
//                                   ),
//                                   AppSpace.size8,
//                                   Text(
//                                     _commentList[0].comment,
//                                     style: AppTextStyle.body3
//                                         .copyWith(color: Colors.white),
//                                     maxLines: 6,
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: <Widget>[
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     '${_commentList[1].name}' '님',
//                                     style: AppTextStyle.headline3
//                                         .copyWith(color: Colors.white),
//                                   ),
//                                   AppSpace.size8,
//                                   Text(
//                                     _commentList[1].comment,
//                                     style: AppTextStyle.body3
//                                         .copyWith(color: Colors.white),
//                                     maxLines: 6,
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: <Widget>[
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     '${_commentList[2].name}' '님',
//                                     style: AppTextStyle.headline3
//                                         .copyWith(color: Colors.white),
//                                   ),
//                                   AppSpace.size8,
//                                   Text(
//                                     _commentList[2].comment,
//                                     style: AppTextStyle.body3
//                                         .copyWith(color: Colors.white),
//                                     maxLines: 6,
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         )
//       : const SizedBox());
//
//   /* 채널 컨텐츠 비디오 정보 리스트 - 오른쪽 섹션 */
//   Widget _buildChannelContentListView() => ListView.builder(
//         shrinkWrap: true,
//         itemCount: 1,
//         itemBuilder: (context, index) {
//           return Column(
//             children: <Widget>[
//               /* 양상 썸네일 */
//               AspectRatio(
//                 aspectRatio: 2 / 3,
//                 child: SizedBox(
//                   height: 100,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(19),
//                     child: CachedNetworkImage(
//                       imageUrl:
//                           "https://image.tmdb.org/t/p/w500/bZLrpWM065h5bu1msUcPmLFsHBe.jpg",
//                       imageBuilder: (context, imageProvider) => Container(
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: imageProvider,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       placeholder: (context, url) =>
//                           const Center(child: CircularProgressIndicator()),
//                       errorWidget: (context, url, error) =>
//                           const Icon(Icons.error),
//                     ),
//                   ),
//                 ),
//               ),
//               /* 영상 제목 */
//               Text(
//                 'Star Wars: Episode I - The Phantom Menace',
//                 style: AppTextStyle.headline2.copyWith(color: Colors.white),
//               ),
//               AppSpace.size14,
//               SizedBox(
//                 width: double.infinity,
//                 child: Wrap(
//                   spacing: 10,
//                   alignment: WrapAlignment.start,
//                   direction: Axis.horizontal,
//                   children: const <Widget>[
//                     NewGradientButton(
//                       content: '절대적인 몰입감',
//                     ),
//                     NewGradientButton(
//                       content: '적극 추천',
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           );
//         },
//       );
// }
