import 'package:movie_curation/domain/useCase/tmdb/load_movie_list_by_genre_use_case.dart';
import 'package:movie_curation/domain/useCase/tmdb/load_movie_searched_list_use_case.dart';
import 'package:movie_curation/domain/useCase/youtube/youtube_load_youtube_meta_data_ues_case.dart';
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
  }
}
