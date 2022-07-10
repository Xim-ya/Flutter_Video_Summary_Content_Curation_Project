import 'package:movie_curation/domain/models/content/content_cast_model.dart';
import 'package:movie_curation/utilities/index.dart';

// TODO: TABLET & MOBILE 반응형 예외처리 코드게 매우 복잡. 대폭 수정 필요
class CastSlider extends StatelessWidget {
  final MovieVM movieVM;
  final List<ContentCastModel> castList;
  const CastSlider({Key? key, required this.movieVM, required this.castList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(
      //   left: responsiveSize(
      //       mobileS: 16, tabletS: 0, isMobile: isUsedInMobile ?? false),
      // ),
      height: kTS100 + (kTS16 * 2) + 9 + 8,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: castList.length,
        itemBuilder: (context, index) {
          // final castItem = movieVM.actorList[index];
          return Container(
            margin: const EdgeInsets.only(right: 22),
            child: Stack(
              children: [
                /* Cast Image */
                CastProfileImage(castList[index].profileUrl),
                /* Cast Name */
                CastProfileName(castList[index].name)
              ],
            ),
          );
        },
      ),
    );
  }

  Positioned CastProfileName(String? name) {
    return Positioned(
      top: kTS100 + 4,
      child: Container(
        width: kTS100 + 4,
        child: Text(
          name ?? "익명",
          maxLines: 2,
          textAlign: TextAlign.center,
          style: FontStyles(0, false).actorName,
        ),
      ),
    );
  }

  SizedBox CastProfileImage(String? profileUrl) {
    return SizedBox(
      height: kTS100,
      width: kTS100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(1000),
        child: GestureDetector(
          onTap: () {},
          child: CachedNetworkImage(
            imageUrl: profileUrl == null
                ? blackProfileImageUrl
                : "https://image.tmdb.org/t/p/w500${profileUrl}",
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
