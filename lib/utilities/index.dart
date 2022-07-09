/* Flutter Packages */
export 'package:flutter/material.dart';
export 'package:flutter/foundation.dart';
export 'package:flutter/services.dart';

/* Packages */
export 'package:fluro/fluro.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:flutter_hooks/flutter_hooks.dart';
export 'package:sizer/sizer.dart';
export 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
export 'package:get/get.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
export 'package:carousel_slider/carousel_slider.dart';
export 'package:json_annotation/json_annotation.dart';

/* DataLayer (api, datasource, repository) */
export 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_video_info_item_response.dart';
export 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_video_info_response.dart';
export 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_popular_drama_response.dart';
export 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_popular_movie_responsee.dart';
export 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_drama_item_response.dart';
export 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_item_response.dart';
export 'package:movie_curation/data/remote/source/tmdb/tmdb_remote_data_source.dart';
export 'package:movie_curation/data/remote/network/api/tmdb/tmdb_api.dart';
export 'package:movie_curation/data/repository/tmdb/tmdb_repository.dart';
export 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_video_info_response.dart';
export 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_video_info_item_response.dart';

/* DomainLayer (useCase, model) */
export 'package:movie_curation/domain/models/content/content_model.dart';
export 'package:movie_curation/domain/models/tmdb/tmdbMovieVideoInfoModel.dart';
export 'package:movie_curation/domain/models/content/content_model.dart';
export 'package:movie_curation/domain/useCase/tmdb/tmdb_load_movie_video_info_use_case.dart';
export 'package:movie_curation/domain/useCase/tmdb/tmdb_load_popular_movies_use_case.dart';

/* Presentation Layer (MVVM) */
export 'package:movie_curation/ui/screens/home/home_view_model.dart';

//old
export 'package:movie_curation/ui/screens/home/homePagedView/home_paged_view.dart';
export 'package:movie_curation/ui/screens/home/home_screen_old.dart';
export 'package:movie_curation/utilities/temp_screen.dart';
export 'package:movie_curation/utilities/temp_screen.dart';
export 'package:movie_curation/ui/screens/content/contentDetail/content_detail_screen.dart';
export 'package:youtube_player_flutter/youtube_player_flutter.dart';
export 'package:movie_curation/ui/screens/content/contentPlayer/content_player_screen.dart';
export 'package:movie_curation/ui/screens/search/search_screen.dart';

/* Models */
export 'package:movie_curation/models/movie_model.dart';
export 'package:movie_curation/models/movie_genre_model.dart';
export 'package:movie_curation/models/actor_model.dart';
export 'package:movie_curation/models/trailer_model.dart';
export 'package:movie_curation/models/youtube_model.dart';
export 'package:movie_curation/models/youtube_core_model.dart';
export 'package:movie_curation/models/video_detail_model.dart';
export 'package:movie_curation/models/drama_model.dart';
export 'package:movie_curation/models/search_core_model.dart';

/* View Models */
export 'package:movie_curation/viewModels/movie_view_model.dart';
export 'package:movie_curation/services/youtube_api_response.dart';
export 'package:movie_curation/viewModels/youtube_view_model.dart';
export 'package:movie_curation/viewModels/search_content_view_model.dart';

/* Widgets */
export 'package:movie_curation/ui/widgets/responsive_layout.dart';
export 'package:movie_curation/ui/widgets/gradient_button.dart';
export 'package:movie_curation/ui/widgets/category_group_button.dart';
export 'package:movie_curation/ui/widgets/gradient_post_background.dart';
export 'package:movie_curation/ui/widgets/content_info_container.dart';
export 'package:movie_curation/ui/widgets/content_poster_slider.dart';
export 'package:movie_curation/ui/widgets/trailer_dialog.dart';
export 'package:movie_curation/ui/screens/content/contentDetail/localWidget/cast_slider.dart';
export 'package:movie_curation/ui/screens/content/contentDetail/localWidget/movie_else_info.dart';
export 'package:movie_curation/ui/widgets/back_arrow_button.dart';
export 'package:movie_curation/ui/screens/content/contentDetail/localWidget/main_content_info_mobile.dart'; // MovieDetailScreen(M) > MainContentInfoMobile
export 'package:movie_curation/ui/screens/content/contentDetail/localWidget/youtube_review_contents_wheel_slider.dart'; // MovieDetailScreen(T) > WheelSlider
export 'package:movie_curation/ui/screens/search/localWidget/random_poster_background.dart';
export 'package:movie_curation/ui/screens/search/localWidget/content_thumbnail_vertical_slider.dart';
export 'package:movie_curation/ui/screens/content/contentDetail/localWidget/youtube_content_list_view.dart';

/* Services */
export 'package:movie_curation/services/movie_api_response.dart';

/* Utilities */
export 'package:movie_curation/utilities/palette.dart';
export 'package:movie_curation/utilities/orientation.dart';
export 'package:movie_curation/utilities/scroll_controller.dart';
export 'package:movie_curation/utilities/data/dummy_data.dart';
export 'package:movie_curation/utilities/responsive_size.dart';
export 'package:movie_curation/utilities/mixin/api_error_handler_mixin.dart';
export 'package:movie_curation/utilities/result.dart';

/* Base */
export 'package:movie_curation/domain/base/base_no_param_use_case.dart';
export 'package:movie_curation/ui/common/base/base_screen.dart';
export 'package:movie_curation/ui/common/base/base_view_model.dart';

/* Routes */
export 'package:movie_curation/routes/fluro_router.dart';
