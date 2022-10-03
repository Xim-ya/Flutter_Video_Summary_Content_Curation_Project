import 'package:movie_curation/data/remote/network/api/channel/channel_api.dart';
import 'package:movie_curation/data/repository/channel/channel_repository.dart';
import 'package:movie_curation/domain/models/channel/channel_model.dart';
import 'package:movie_curation/utilities/result.dart';

class ChannelRepositoryImpl extends ChannelRepository {
  final ChannelApi _api;
  ChannelRepositoryImpl(this._api);

  @override
  Future<Result<List<ChannelModel>>> loadChannelInfoList() async {
    try {
      final response = await _api.loadRegisteredChannelList();
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
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
