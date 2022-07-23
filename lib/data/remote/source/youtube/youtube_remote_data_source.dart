import 'package:movie_curation/utilities/index.dart';

abstract class YoutubeRemoteDataSource {
  /* Youtube - 유튜브 검색 데이터 호출 (컨텐츠 제목을 기준으로)*/
  Future<YoutubeSearchListResponse> loadYoutubeSearchList(String contentTitle);
}
