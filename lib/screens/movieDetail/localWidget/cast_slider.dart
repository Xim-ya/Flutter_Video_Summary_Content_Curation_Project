import 'package:movie_curation/utilities/index.dart';

// TODO: TABLET & MOBILE 반응형 예외처리 코드게 매우 복잡. 대폭 수정 필요
class CastSlider extends StatelessWidget {
  final MovieVM movieVM;
  final bool? isUsedInMobile;
  const CastSlider({Key? key, required this.movieVM, this.isUsedInMobile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double extraMobileSize = responsiveSize(
        mobileS: 30, tabletS: 0, isMobile: isUsedInMobile ?? false);

    return Container(
      padding: EdgeInsets.only(
        left: responsiveSize(
            mobileS: 16, tabletS: 0, isMobile: isUsedInMobile ?? false),
      ),
      height: kTS100 + (kTS16 * 2) + 9 + extraMobileSize + 8,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movieVM.actorList.length,
          itemBuilder: (context, index) {
            final castItem = movieVM.actorList[index];
            return Container(
              margin: const EdgeInsets.only(right: 22),
              child: Stack(
                children: [
                  /* Cast Image */
                  CastProfileImage(castItem, extraMobileSize),
                  /* Cast Name */
                  CastProfileName(castItem, extraMobileSize)
                ],
              ),
            );
          }),
    );
  }

  Positioned CastProfileName(Actor castItem, double extraMobileSize) {
    final double extraMargin = responsiveSize(
        mobileS: 16, tabletS: 0, isMobile: isUsedInMobile ?? false);
    return Positioned(
      top: kTS100 + 4 + extraMobileSize,
      child: Container(
        width: kTS100 + 4 + extraMobileSize,
        child: Text(
          castItem.name ?? "익명",
          maxLines: 2,
          textAlign: TextAlign.center,
          style: FontStyles(0, isUsedInMobile).actorName,
        ),
      ),
    );
  }

  SizedBox CastProfileImage(Actor castItem, double extraMobileSize) {
    return SizedBox(
      height: kTS100 + extraMobileSize,
      width: kTS100 + extraMobileSize,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(1000),
        child: GestureDetector(
          onTap: () {
            print(castItem.profilePath);
          },
          child: CachedNetworkImage(
            imageUrl: castItem.profilePath == null
                ? blackProfileImageUrl
                : "https://image.tmdb.org/t/p/w500${castItem.profilePath}",
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
