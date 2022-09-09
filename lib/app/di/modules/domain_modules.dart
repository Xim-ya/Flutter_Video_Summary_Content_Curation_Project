import 'package:movie_curation/domain/service/config_service.dart';
import 'package:movie_curation/domain/useCase/channel/load_channel_info_list_use_case.dart';
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
    Get.lazyPut(() => LoadRegisteredContentIdInfoUseCase(Get.find()));
    Get.lazyPut(() => LoadRegisteredContentYoutubeInfo(Get.find(), Get.find()));

    /* Channel */
    Get.lazyPut(() => LoadChannelInfoListUseCase(Get.find()));
    Get.put(ConfigService.new());
  }
}
