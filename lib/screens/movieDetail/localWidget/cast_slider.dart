import 'package:movie_curation/utilities/index.dart';

class CastSlider extends StatelessWidget {
  final MovieVM movieVM;
  const CastSlider({Key? key, required this.movieVM}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kTS100 + (kTS16 * 2) + 9,
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
                  CastProfileImage(castItem),
                  /* Cast Name */
                  CastProfileName(castItem)
                ],
              ),
            );
          }),
    );
  }

  Positioned CastProfileName(Actor castItem) {
    return Positioned(
      top: kTS100 + 4,
      child: Container(
        width: kTS100 + 4,
        child: Text(
          castItem.name ?? "익명",
          maxLines: 2,
          textAlign: TextAlign.center,
          style: FontStyles(kTS16).actorName,
        ),
      ),
    );
  }

  SizedBox CastProfileImage(Actor castItem) {
    return SizedBox(
      height: kTS100,
      width: kTS100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(1000),
        child: CachedNetworkImage(
          imageUrl: "https://image.tmdb.org/t/p/w500${castItem.profilePath}",
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
    );
  }
}
