import 'dart:developer';
import 'package:movie_curation/data/repository/content/content_repository.dart';
import 'package:movie_curation/data/repository/youtube/youtube_repository.dart';
import 'package:movie_curation/domain/base/base_use_case.dart';
import 'package:movie_curation/domain/models/content/content_registered_id_info_model.dart';
import 'package:movie_curation/domain/models/youtube/youtube_search_list_model.dart';
import 'package:movie_curation/utilities/regex.dart';
import 'package:movie_curation/utilities/result.dart';
import 'package:youtube_metadata/youtube_metadata.dart'; // 다른 라이브러리와 충돌됨 (Single Import X)

/* Firebase DB에 등록된 컨텐츠가 있다면, 해당 컨텐츠의 저장된 [유튜브 정보]를 반환하는 Usecase
   *** 1) 2) 로직은  [LoadRegisteredContentIdInfoUseCase]에 포함되어 잇음  ***
    1) firebase db에 저장된 등록된 컨텐츠 리스트 데이터 호출 -> id 값만 호출
    2) 전달 받은 Id가 Firebase DB에 저장되어 있는지 확인.
    3) Firebase DB에 해당 ID가 있다면 FirebaseDB에 저장된 유튜브 정보 리스트 호출
       3-1) docuemntId 값으로 해당 firebase document를 찾음.
       3-2) 해당 dcoument List를 찾고 찾으려고하는 컨텐츠을 위에서 도출 ID값으로 확인
  * */

class LoadRegisteredContentYoutubeInfo extends BaseUseCase<
    ContentRegisteredIdInfoModel, Result<List<YoutubeVideoContentModel>>> {
  LoadRegisteredContentYoutubeInfo(
      this._contentRepository, this._youtubeRepository);

  final ContentRepository _contentRepository;
  final YoutubeRepository _youtubeRepository;

  @override
  Future<Result<List<YoutubeVideoContentModel>>> call(
      ContentRegisteredIdInfoModel request) async {
    List<YoutubeVideoContentModel> youtubeVideoInfoList = [];

    List<String> youtubeVideoIdList = [];
    // 3-1
    if (request != null) {
      // MATCHES
      final int documentId = request.documentId;
      if (documentId == 0) {
        // LOAD 0 <--(Need key Mapping) RECOMMENDED LIST
        final response =
            await _contentRepository.loadRegisteredContentYoutubeIdList(
                documentPath: 'Recommend', contentId: request.contentId);
        response.fold(onSuccess: (data) {
          youtubeVideoIdList = data;
        }, onFailure: (err) {
          log(err.toString());
        });

        ///// COPY PASTE LOGIC FROM YOUTUBE LOAD YOUTUBE METAT DATA USE CASE
        for (String videoId in youtubeVideoIdList) {
          final String link = 'https://www.youtube.com/watch?v=$videoId';
          MetaDataModel metaData = await YoutubeMetaData.getData(link);
          final String? channelId = Regex.getChannelId(metaData.authorUrl!);
          String? channelThumbnail;
          // 추출한 `channelId`로 썸네일 호출
          if (channelId != null) {
            final response =
                await _youtubeRepository.loadYoutubeChannel(channelId);
            response.fold(
              onSuccess: (data) {
                channelThumbnail = data.thumbnailUrl;
              },
              onFailure: (err) {
                channelThumbnail = null;
                log(err.toString());
              },
            );
          } else {
            log("[USECASE]Can't Find Channel Thumbnail");
            channelThumbnail = null;
          }
          youtubeVideoInfoList.add(
            YoutubeVideoContentModel(
              videoTitle: metaData.title,
              videoId: videoId,
              thumbnailUrl: metaData.thumbnailUrl,
              profileUrl: channelThumbnail,
            ),
          );
        }
      }
    } else {
      // DOESN't MATCH
    }

    return Result.success(youtubeVideoInfoList);
  }
}

// List<ContentModel> contentList = [];

// final contentResponse =
//     await _contentRepository.loadRecommendedContentInfo();
// contentResponse.fold(onSuccess: (data) {
//   contentList = data;
// }, onFailure: (err) {
//   log(err.toString());
// });

// final ContentModel selectedContentInfo =
//     contentList.firstWhere((ele) => ele.id == documentId);
