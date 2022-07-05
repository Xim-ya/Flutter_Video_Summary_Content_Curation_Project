import 'package:movie_curation/ui/common/base/base_view.dart';
import 'package:movie_curation/ui/screens/home/home_view_model_new.dart';
import 'package:movie_curation/utilities/index.dart';

class GradientPostBackground extends BaseView<HomeViewModelNew> {
  final bool usedOnHomeScreen;
  const GradientPostBackground({
    Key? key,
    required this.usedOnHomeScreen,
  }) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Stack(
      children: [
        Obx(
          () => vm.popularMovieList == null
              ? const SizedBox()
              : _BackgroundPosterImage(
                  // HomeScreen(MainScreen),MovieDetail(컨텐츠 상세페이지)에서 각각 다르게 이미지를 호출하기 위한 기준 값
                  posterUrl: usedOnHomeScreen
                      ? vm.popularMovieList![0].backDropUrl
                      : vm.popularMovieList![0].posterUrl,
                ),
        ),
        _GradientBackground(),
      ],
    );
  }
}

/* 포스터위에 Overlay 되는 Gradient Color Container */
class _GradientBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            kDarkGrey,
            kDarkGrey.withOpacity(0.95),
            kDarkGrey.withOpacity(0.9),
            kDarkGrey.withOpacity(0.7),
            kDarkGrey.withOpacity(0.5),
            kDarkGrey.withOpacity(0.4),
          ],
          tileMode: TileMode.clamp,
        ),
      ),
    );
  }
}

/* 포스터 백그라운드 */
class _BackgroundPosterImage extends StatelessWidget {
  final String? posterUrl;

  const _BackgroundPosterImage({Key? key, required this.posterUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "https://image.tmdb.org/t/p/w500$posterUrl",
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
