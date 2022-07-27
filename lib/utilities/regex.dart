import 'package:intl/intl.dart';

class Regex {
  /* 구독자 수를 만명 단위로 표시함. */
  static String getSubscriberNumber(int num) =>
      (num ~/ 10000).toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');

  /* "2021-08-23 16:21:41" => "2021년 8월 23일 16시 21분"과 같이 변환함. */
  static String dateToyyyyMdHm(String date) =>
      DateFormat('yyyy년 M월 d일 H시 m분').format(DateTime.parse(date));

  static String dateYM(String date) =>
      DateFormat('yyyy년 M월').format(DateTime.parse(date));

  static String dateToMdHHmm(String date) =>
      DateFormat('M월 d일 HH시 mm분').format(DateTime.parse(date));

  static String dateToMMdd(String date) =>
      DateFormat('MM.dd').format(DateTime.parse(date));

  static String dateToM(String date) =>
      DateFormat('M').format(DateTime.parse(date));

  /* Youtube 채널 URL에서 channelID를 추출 */
  static String getChannelId(String url) => RegExp(
          r'^https?:\/\/(www\.)?youtube\.com\/(channel\/UC[\w-]{21}[AQgw]|(c\/|user\/)?[\w-]+)$')
      .toString();
}
