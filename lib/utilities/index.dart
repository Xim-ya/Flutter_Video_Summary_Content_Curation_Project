/* Flutter Packages */
export 'package:flutter/material.dart';
export 'package:flutter/foundation.dart';
export 'package:flutter/services.dart';

/* Packages */
export 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
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
export 'package:cloud_firestore/cloud_firestore.dart';

/* Data Layer (api, datasource, repository) */

export 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_video_info_item_response.dart';
export 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_cast_info_item_response.dart';
export 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_video_info_response.dart';
export 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_popular_drama_response.dart';
export 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_popular_movie_responsee.dart';
export 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_drama_item_response.dart';
export 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_item_response.dart';
export 'package:movie_curation/data/remote/source/tmdb/tmdb_remote_data_source.dart';
export 'package:movie_curation/data/remote/network/api/tmdb/tmdb_api.dart';
export 'package:movie_curation/data/repository/tmdb/tmdb_repository.dart';
export 'package:movie_curation/data/remote/network/api/youtube/response/youtube_channel_response.dart';
export 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_video_info_response.dart';
export 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_video_info_item_response.dart';
export 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_drama_credit_response.dart';
export 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_credit_response.dart';
export 'package:movie_curation/data/remote/network/api/youtube/response/youtube_searched_list_response.dart';
export 'package:movie_curation/data/remote/network/api/youtube/response/youtube_searched_item_response.dart';
export 'package:movie_curation/data/remote/source/youtube/youtube_remote_data_source.dart';
export 'package:movie_curation/data/repository/youtube/youtube_repository.dart';
export 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_drama_credit_response.dart';
export 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_credit_response.dart';
export 'package:movie_curation/data/remote/network/api/youtube/response/youtube_searched_item_response.dart';
export 'package:movie_curation/data/remote/network/api/youtube/response/youtube_searched_list_response.dart';
export 'package:movie_curation/data/remote/network/api/youtube/response/youtube_searched_list_response.dart';
export 'package:movie_curation/data/remote/network/api/content/response/content_recommended_info_response.dart';
export 'package:movie_curation/data/remote/network/api/content/content_api.dart';
export 'package:movie_curation/data/remote/source/content/content_remote_data_source.dart';
export 'package:movie_curation/data/remote/network/api/content/response/content_recommended_info_response.dart';
export 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_detail_info_response.dart';
export 'package:movie_curation/data/remote/network/api/youtube/youtube_api.dart';
export 'package:movie_curation/data/repository/content/content_repository.dart';
export 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_genre_movie_list_response.dart';

/* Domain Layer (useCase, model) */
export 'package:movie_curation/domain/models/content/content_model.dart';
export 'package:movie_curation/domain/models/tmdb/tmdb_movie_video_info_model.dart';
export 'package:movie_curation/domain/models/content/content_model.dart';
export 'package:movie_curation/domain/useCase/tmdb/tmdb_load_movie_video_info_use_case.dart';
export 'package:movie_curation/domain/useCase/tmdb/tmdb_load_popular_movies_use_case.dart';
export 'package:movie_curation/domain/useCase/tmdb/tmdb_load_drama_casts_use_case.dart';
export 'package:movie_curation/domain/useCase/tmdb/tmdb_load_movie_casts_use_case.dart';
export 'package:movie_curation/domain/models/youtube/youtube_search_list_model.dart';
export 'package:movie_curation/domain/models/content/content_cast_model.dart';
export 'package:movie_curation/domain/models/content/content_cast_model.dart';
export 'package:movie_curation/domain/models/content/content_cast_model.dart';
export 'package:movie_curation/data/repository/tmdb/tmdb_repository.dart';
export 'package:movie_curation/domain/useCase/youtube/youtube_load_search_list_use_case.dart';
export 'package:movie_curation/domain/useCase/tmdb/tmdb_load_poopular_dramas_use_case.dart';
export 'package:movie_curation/domain/useCase/content/load_popular_content_list_use_case.dart';
export 'package:movie_curation/domain/models/content/content_model.dart';
export 'package:movie_curation/domain/models/tmdb/tmdb_movie_detail_info_model.dart';
export 'package:movie_curation/domain/useCase/tmdb/load_movie_list_by_genre_use_case.dart';
export 'package:movie_curation/domain/useCase/youtube/youtube_load_youtube_meta_data_ues_case.dart';
export 'package:movie_curation/domain/useCase/tmdb/load_movie_searched_list_use_case.dart';
export 'package:movie_curation/domain/models/youtube/youtube_channel_model.dart';
export 'package:movie_curation/domain/useCase/tmdb/load_similar_movie_list_use_case.dart';

/* Presentation Layer (MVVM) */
export 'package:movie_curation/ui/screens/home/home_view_model.dart';
export 'package:movie_curation/ui/screens/content/contentDetail/content_detail_scaffold.dart';
export 'package:movie_curation/ui/screens/content/contentDetail/home_content_detail_screen.dart';
export 'package:movie_curation/ui/screens/content/contentDetail/home_content_detail_view_model.dart';
export 'package:movie_curation/ui/screens/search/search_view_model.dart';
export 'package:movie_curation/ui/screens/search/search_paged_view.dart';
export 'package:movie_curation/ui/screens/content/contentDetail/search_content_view_model.dart';
export 'package:movie_curation/ui/screens/search/search_screen_scaffold.dart';
export 'package:movie_curation/ui/screens/search/search_screen.dart';
export 'package:movie_curation/ui/screens/content/contentDetail/localWidget/search_content_detail_screen.dart';

//old
export 'package:movie_curation/ui/screens/home/homePagedView/home_paged_view.dart';
export 'package:movie_curation/ui/screens/home/home_screen.dart';
export 'package:movie_curation/utilities/temp_screen.dart';
export 'package:movie_curation/utilities/temp_screen.dart';
export 'package:youtube_player_flutter/youtube_player_flutter.dart';
export 'package:movie_curation/ui/screens/content/contentPlayer/content_youtube_player_screen.dart';

/* Widgets */
export 'package:movie_curation/ui/widgets/responsive_layout.dart';
export 'package:movie_curation/ui/widgets/gradient_button.dart';
export 'package:movie_curation/ui/widgets/category_group_button.dart';
export 'package:movie_curation/ui/widgets/gradient_post_background.dart';
export 'package:movie_curation/ui/widgets/content_info_container.dart';
export 'package:movie_curation/ui/widgets/content_poster_slider.dart';
export 'package:movie_curation/ui/widgets/trailer_dialog.dart';
export 'package:movie_curation/ui/screens/content/contentDetail/localWidget/cast_slider.dart';
export 'package:movie_curation/ui/screens/content/contentDetail/localWidget/content_else_info.dart';
export 'package:movie_curation/ui/widgets/back_arrow_button.dart';
export 'package:movie_curation/ui/screens/content/contentDetail/localWidget/youtube_review_contents_wheel_slider.dart'; // MovieDetailScreen(T) > WheelSlider
export 'package:movie_curation/ui/screens/search/localWidget/random_poster_background.dart';
export 'package:movie_curation/ui/screens/search/localWidget/content_thumbnail_vertical_slider.dart';
export 'package:movie_curation/ui/screens/search/localWidget/genre_group_button_list_view.dart';
export 'package:movie_curation/ui/screens/search/localWidget/searched_content_details_list_view.dart';
export 'package:movie_curation/ui/screens/search/localWidget/searched_result_list_view.dart';
export 'package:movie_curation/ui/screens/search/localWidget/content_list_tile_item.dart';

/* Utilities */
export 'package:movie_curation/utilities/palette.dart';
export 'package:movie_curation/utilities/orientation.dart';
export 'package:movie_curation/utilities/scroll_controller.dart';
export 'package:movie_curation/utilities/data/dummy_data.dart';
export 'package:movie_curation/utilities/responsive_size.dart';
export 'package:movie_curation/utilities/mixin/api_error_handler_mixin.dart';
export 'package:movie_curation/utilities/result.dart';
export 'package:movie_curation/utilities/resources/colors.dart';
export 'package:movie_curation/utilities/regex.dart';
export 'package:movie_curation/app/config/size_config.dart';

/* Base */
export 'package:movie_curation/domain/base/base_no_param_use_case.dart';
export 'package:movie_curation/ui/common/base/base_screen.dart';
export 'package:movie_curation/ui/common/base/base_view_model.dart';
export 'package:movie_curation/ui/common/base/base_view.dart';
export 'package:movie_curation/domain/base/base_use_case.dart';
export 'package:movie_curation/domain/base/base_use_case.dart';
export 'package:movie_curation/domain/base/base_two_param_use_case.dart';

/* Routes */
export 'package:movie_curation/routes/fluro_router.dart';
