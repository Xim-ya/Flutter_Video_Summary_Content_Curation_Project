import 'package:movie_curation/utilities/index.dart';

class RoundCachedImgContainer extends StatelessWidget {
  const RoundCachedImgContainer({Key? key, required this.imgUrl, this.size})
      : super(key: key);

  final String imgUrl;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 120,
      width: size ?? 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: CachedNetworkImage(
          imageUrl: imgUrl,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
