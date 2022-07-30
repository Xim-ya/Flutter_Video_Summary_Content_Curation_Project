import 'package:movie_curation/ui/common/base/base_view.dart';
import 'package:movie_curation/ui/screens/home/home_view_model.dart';
import 'package:movie_curation/ui/widgets/content_info_container_scaffold.dart';
import 'package:movie_curation/utilities/index.dart';
import 'package:movie_curation/utilities/regex.dart';

class ContentInfoContainer extends StatelessWidget {
  const ContentInfoContainer({
    Key? key,
    required this.isUsedOnHomeScreen,
    required this.routeAction,
    required this.showTrailerDialog,
    required this.title,
    required this.releaseDate,
    required this.adult,
    required this.overView,
  }) : super(key: key);

  final bool isUsedOnHomeScreen; // 라우트되는 부모 스크린 판별 변수
  final VoidCallback routeAction; // PageView Builder 화면 전환 메소드
  final VoidCallback showTrailerDialog;
  final String? title;
  final bool? adult;
  final String? releaseDate;
  final String? overView;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ContentInfoContainerScaffold(
      title: buildTitle(),
      gRatedAndReleaseYear: buildGRatedAndReleaseYear(),
      overView: buildOverView(width),
      actionGroupBtn: buildActionGroupBtn(width),
    );
  }

  Widget buildTitle() => Text(
        title ?? "",
        maxLines: 1,
        style: FontStyles(0, false).movieTitle,
      );

  Widget buildGRatedAndReleaseYear() => Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColor.lightGrey,
            ),
            child: Text(
              adult ?? false ? "청소년 관람 불가" : "일반",
              style: FontStyles(0, isUsedInMobile).gRated,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            releaseDate != null ? Regex.dateYM(releaseDate!) : "개봉일 확인 불가",
            style: FontStyles(0, isUsedInMobile).releaseY,
          ),
        ],
      );

  Widget buildActionGroupBtn(double width) => SizedBox(
        width: width * 3 / 5,
        child: Row(
          mainAxisAlignment: isUsedOnHomeScreen
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.start,
          children: [
            isUsedOnHomeScreen
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.yellow,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    onPressed: routeAction,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset("assets/icons/play_ic.svg",
                            height: 20, color: Colors.black),
                        const SizedBox(width: 6),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            "컨텐츠",
                            style: FontStyles(0, isUsedInMobile).watchButton,
                          ),
                        )
                      ],
                    ),
                  )
                : const SizedBox(),
            Wrap(
              children: [
                GradientButton(
                  content: "예고편",
                  onBtnTapHandler: showTrailerDialog,
                ),
                const SizedBox(width: 12),
                GradientButton(
                  content: "추가",
                  onBtnTapHandler: () {},
                ),
              ],
            )
          ],
        ),
      );

  Widget buildOverView(double width) => SizedBox(
        width: width * 3 / 5,
        child: Text(
          overView ?? "내용 없음",
          maxLines: 3,
          style: FontStyles(0, isUsedInMobile).description,
        ),
      );

  final isUsedInMobile = false;

  // 디바이스 종류(Mobile, Tablet)에 따라 각각 다른 사이즈를 반환하는 메소드
  double responsiveSize(
      {required double mobileS,
      required double tabletS,
      required bool isMobile}) {
    return isMobile ? mobileS : tabletS;
  }
}
