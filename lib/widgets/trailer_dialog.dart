import 'package:movie_curation/utilities/index.dart';

// // TODO: Iframe 추가 설정 필요(소리, 테마 컬러 등) + 반응형 Margin
// /* 선택된 영화 예고편 Dialog (Youtube Iframe Based) */
Future<dynamic> movieTrailerDialog(BuildContext context, MovieVM movieVM) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Container(
        margin: EdgeInsets.all(200),
        color: Colors.white,
        child: YoutubePlayer(
          controller: movieVM.trailerYoutubeController,
          showVideoProgressIndicator: true,
        ),
      );
    },
  );
}

// TODO: 디자인 수정 필요. (조금 밋밋함)
/* 선택된 영화의 예고편이 없을 때 나타는 Dialog창 (Exception)*/
Future<dynamic> noTrailerDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return const AlertDialog(
        title: Center(
          child: Text("등록된 예고편이 없습니다."),
        ),
      );
    },
  );
}
