import 'package:movie_curation/ui/screens/search/search_view_model.dart';
import 'package:movie_curation/utilities/index.dart';

class ContentThumbnailVerticalSlider extends BaseView<SearchViewModel> {
  const ContentThumbnailVerticalSlider({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      // child: ListView.builder(
      //   shrinkWrap: true,
      //   itemCount: HomeViewModel.selectedContentListG!.length,
      //   itemBuilder: (context, index) {
      //     if (index < HomeViewModel.selectedContentListG!.length) {
      //       final movieItem = HomeViewModel.selectedContentListG![index];
      //       return Container(
      //         padding: EdgeInsets.only(bottom: 22, top: 22, left: 32),
      //         height: 200,
      //         child: Row(
      //           children: [
      //             /* Left Side - Image */
      //             AspectRatio(
      //               aspectRatio: 1,
      //               child: CachedNetworkImage(
      //                 imageUrl:
      //                     "https://image.tmdb.org/t/p/w500${movieItem.posterUrl}",
      //                 imageBuilder: (context, imageProvider) => Container(
      //                   decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(16),
      //                     image: DecorationImage(
      //                       image: imageProvider,
      //                       fit: BoxFit.cover,
      //                     ),
      //                   ),
      //                 ),
      //                 errorWidget: (context, url, error) =>
      //                     const Icon(Icons.error),
      //               ),
      //             ),
      //             /* Right Side - Description(title, description, year) */
      //             Expanded(
      //               child: Padding(
      //                 padding: const EdgeInsets.only(left: 26),
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       children: [
      //                         // Title
      //                         Text("더 배트맨",
      //                             style: FontStyles().searchedContentTitle),
      //                         // Release Year
      //                         Container(
      //                             margin: EdgeInsets.only(right: 30),
      //                             child: Text(
      //                               "2018",
      //                               style: FontStyles().searchedContentRYear,
      //                             ))
      //                       ],
      //                     ),
      //                     // Description
      //                     Text(
      //                       "지난 2년 간 고다심의 어둠 속에서 범법자들을 응징하며 배트맨으로 살아온 브루스 웨인. 알프레드와 제임스 고등 경위의 도움 아래 그는 도시의 부패한 공직자들과 고위 관료들 사이에서 복수의 화신으로 활약한다. 고담의 시장 선거를 앞두고 고담의 엘리티 집단을 목표로 작인한 연쇄 살인을 저리를 조커인가를 조지려고 하는데",
      //                       style: FontStyles().searchedContentDescription,
      //                       maxLines: 3,
      //                       overflow: TextOverflow.ellipsis,
      //                     )
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       );
      //     } else {
      //       return Container(
      //         child: Center(
      //           child: CircularProgressIndicator(),
      //         ),
      //       );
      //     }
      //   },
      // ),
    );
  }
}
