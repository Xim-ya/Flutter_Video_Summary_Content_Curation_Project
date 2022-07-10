// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _YoutubeApi implements YoutubeApi {
  _YoutubeApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.googleapis.com/youtube/v3';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<YoutubeSearchListResponse> loadYoutubeSearchList(contentTitle) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        YoutubeSearchListResponse>(Options(
            method: 'GET', headers: _headers, extra: _extra)
        .compose(_dio.options,
            '/search?part=snippet&key=AIzaSyCmmGQuJuL4W7jdBD1yJEft0VZ-8a8ciak&q=$contentTitle&영화리뷰',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = YoutubeSearchListResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
