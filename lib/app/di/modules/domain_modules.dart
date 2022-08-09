import 'package:movie_curation/utilities/index.dart';

abstract class DomainModules {
  DomainModules._();

  static void dependencies() {
    /* Home */
    Get.lazyPut(() => LoadPopularMoviesUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => TmdbLoadMovieTrailerKeyUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => TmdbLoadMovieCastsUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => TmdbLoadDramaCastsUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => YoutubeLoadSearchListUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => TmdbLoadPopularDramasUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => LoadPopularContentListUseCase(Get.find(), Get.find()),
        fenix: true);

    /* Content Detail */
    Get.lazyPut(() => LoadYoutubeMetaDataListUseCase(Get.find()));

    /* Search */
    Get.lazyPut(() => LoadMovieListByGenreUseCase(Get.find(), Get.find()),
        fenix: true);
    Get.lazyPut(() => LoadMovieSearchedListUseCase(Get.find()));
    Get.lazyPut(() => LoadSimilarMovieListUseCase(Get.find()));
  }
}
