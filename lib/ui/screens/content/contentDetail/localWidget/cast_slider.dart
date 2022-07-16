import 'package:movie_curation/utilities/index.dart';

class CastSlider extends StatelessWidget {
  const CastSlider({Key? key, required this.castList}) : super(key: key);
  final List<ContentCastModel>? castList;

  @override
  Widget build(BuildContext context) {
    return castList != null
        ? SizedBox(
            height: kTS100 + (kTS16 * 2) + 9 + 8,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: castList!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 22),
                  child: Stack(
                    children: [
                      /* Cast Image */
                      _CastProfileImg(profileUrl: castList![index].profileUrl),
                      /* Cast Name */
                      _CastProfileName(name: castList![index].name),
                    ],
                  ),
                );
              },
            ),
          )
        : const SizedBox();
  }
}

class _CastProfileName extends StatelessWidget {
  const _CastProfileName({Key? key, required this.name}) : super(key: key);
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: kTS100 + 4,
      child: SizedBox(
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
}

class _CastProfileImg extends StatelessWidget {
  const _CastProfileImg({Key? key, required this.profileUrl}) : super(key: key);
  final String? profileUrl;

  @override
  Widget build(BuildContext context) {
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
                : "https://image.tmdb.org/t/p/w500$profileUrl",
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
