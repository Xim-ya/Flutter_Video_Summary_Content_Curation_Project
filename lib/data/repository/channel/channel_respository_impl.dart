import 'package:movie_curation/data/repository/channel/channel_repository.dart';
import 'package:movie_curation/domain/models/channel/channel_info_model.dart';
import 'package:movie_curation/utilities/result.dart';

class ChannelRepositoryImpl extends ChannelRepository {
  @override
  Future<Result<List<ChannelInfoModel>>> loadChannelInfoList() async {
    final List<ChannelInfoModel> channelInfoList = [
      ChannelInfoModel(
        id: "UCuK80YHBZyyKrr2B1oHrgrw",
        channelUrl:
            "https://yt3.ggpht.com/ytc/AMLnZu9tKXzVPuAGTdZ-jfWmuDYRcZwKZlOm6GWpduKnvg=s240-c-k-c0xffffffff-no-rj-mo",
        name: '어퍼컷Tube1',
        rateScore: 12,
        likesCount: 3,
        subscribers: 691000,
        videoCount: 181,
        description: "어퍼컷처럼 날카로운 미드와 영화 이야기.",
        customDescription: "어퍼컷처럼 날카로운 미드와 영화 이야기.",
        contentIdList: [453395, 453395, 453395, 453395],
        comments: [
          UserCommentModel(name: '심야', comment: "컨멘트 내용이 들어가는 부분 입니다."),
          UserCommentModel(name: '심야', comment: "컨멘트 내용이 들어가는 부분 입니다."),
          UserCommentModel(name: '심야', comment: "컨멘트 내용이 들어가는 부분 입니다."),
          UserCommentModel(name: '심야', comment: "컨멘트 내용이 들어가는 부분 입니다."),
        ],
      ),
      ChannelInfoModel(
        id: "UCuK80YHBZyyKrr2B1oHrgrw",
        channelUrl:
            "https://yt3.ggpht.com/jYOJyrwBpzE5ROYRfpaaW0sH19k_ManuoXC6_fQBz9KoE-nwzagPlVLaCjlXFIH0pOX8PVSk3Q=s240-c-k-c0xffffffff-no-rj-mo",
        name: '오킹',
        rateScore: 12,
        likesCount: 3,
        subscribers: 691000,
        videoCount: 181,
        description: "어퍼컷처럼 날카로운 미드와 영화 이야기.",
        customDescription: "어퍼컷처럼 날카로운 미드와 영화 이야기.",
        contentIdList: [453395, 453395, 453395, 453395],
        comments: [
          UserCommentModel(name: '심야', comment: "컨멘트 내용이 들어가는 부분 입니다."),
          UserCommentModel(name: '심야', comment: "컨멘트 내용이 들어가는 부분 입니다."),
          UserCommentModel(name: '심야', comment: "컨멘트 내용이 들어가는 부분 입니다."),
          UserCommentModel(name: '심야', comment: "컨멘트 내용이 들어가는 부분 입니다."),
        ],
      ),
      ChannelInfoModel(
        id: "UCuK80YHBZyyKrr2B1oHrgrw",
        channelUrl:
            "https://yt3.ggpht.com/rbdoz4WVvAsqv-OWVanKm6dit-1U1u-EDVa-7w07rqho6TRR8EUtboqC_rE4JmEnhQIl6SO49oI=s240-c-k-c0xffffffff-no-rj-mo",
        name: '영읽남',
        rateScore: 12,
        likesCount: 3,
        subscribers: 691000,
        videoCount: 181,
        description: "어퍼컷처럼 날카로운 미드와 영화 이야기.",
        customDescription: "어퍼컷처럼 날카로운 미드와 영화 이야기.",
        contentIdList: [453395, 453395, 453395, 453395],
        comments: [
          UserCommentModel(name: '심야', comment: "컨멘트 내용이 들어가는 부분 입니다."),
          UserCommentModel(name: '심야', comment: "컨멘트 내용이 들어가는 부분 입니다."),
          UserCommentModel(name: '심야', comment: "컨멘트 내용이 들어가는 부분 입니다."),
          UserCommentModel(name: '심야', comment: "컨멘트 내용이 들어가는 부분 입니다."),
        ],
      ),
      ChannelInfoModel(
        id: "UCuK80YHBZyyKrr2B1oHrgrw",
        channelUrl:
            "https://yt3.ggpht.com/ytc/AMLnZu8hdQ4TWLl6M_wFDBQmQpSiK_GEhTgazzqGnL8u=s240-c-k-c0xffffffff-no-rj-mo",
        name: '김시선',
        rateScore: 12,
        likesCount: 3,
        subscribers: 691000,
        videoCount: 181,
        description: "어퍼컷처럼 날카로운 미드와 영화 이야기.",
        customDescription: "어퍼컷처럼 날카로운 미드와 영화 이야기.",
        contentIdList: [453395, 453395, 453395, 453395],
        comments: [
          UserCommentModel(name: '심야', comment: "컨멘트 내용이 들어가는 부분 입니다."),
          UserCommentModel(name: '심야', comment: "컨멘트 내용이 들어가는 부분 입니다."),
          UserCommentModel(name: '심야', comment: "컨멘트 내용이 들어가는 부분 입니다."),
          UserCommentModel(name: '심야', comment: "컨멘트 내용이 들어가는 부분 입니다."),
        ],
      ),
    ];

    return Result.success(channelInfoList);
  }
}

/*
*
*
{
  "kind": "youtube#channelListResponse",
  "etag": "n0sN4dshGDYw0RQ0pYIpi8MJaUU",
  "pageInfo": {
    "totalResults": 1,
    "resultsPerPage": 5
  },
  "items": [
    {
      "kind": "youtube#channel",
      "etag": "4_gOPexVuT4aJ4xdNkvULs_6bTs",
      "id": "UCuK80YHBZyyKrr2B1oHrgrw",
      "statistics": {
        "viewCount": "149775471",
        "subscriberCount": "691000",
        "hiddenSubscriberCount": false,
        "videoCount": "181"
      }
    }
  ]
}
* */
