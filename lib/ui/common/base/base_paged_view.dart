import 'package:movie_curation/ui/common/base/base_paged_view_model.dart';
import 'package:movie_curation/utilities/index.dart';

/* 📕 해당 스크린 위젯에서 `Flutter Hook`을 사용하는 이유 -->
  *  Getx를 사용해서 접근해도 무방하겠지만 이렇게 해당 스크린 위젯에서만 필요한 state 관리 로직은
  *  UI와 state로직을 결합시키는 방법을 선호함.
  *
  * 06.19 - PageView 기능을 담고 했는 모듈 클래스를 만드려고 했지만 구현 실패
  * 1. PageController를 분리하면 Widget에서 Controller에 대응을 하지 못함 (- no client issue)
  * 2. [HookWidget]은 추상화 클래스로 상속 받을 수 없음.
  * 3. Hook의 ValueNotifier state변수는 사용되는 Context안에서만 선언이 가능.
  * 4. Getx Controller로 접근 해보려고 했지만 위와 같은 문제가 대부분 동일하게 발생.
  *
  *
  * 07.24 - 라우팅 방법. 컨트롤러 관리.
  * 1. 일반적인 라우팅(화면전환)을 방식을 이용하지 않고 `PagedViewBuild`로 라우팅을 하다보니 컨트롤러를 조금 다르게 관리해줘야 할 필요성이 있음
  * 2. Getx는 controller를 자동으로(Auto Close) 해주기 때문에 controller 삭제에 신경쓸 필요가 없지만. 현 프로젝트에서는 라우팅 방식이 다르게 때문에 직접 삭제해줘야 함.
  * 3. 또한 화면 위젯이 살이 있으면 주입된 컨트롤러가 삭제 시 오류가 발생하기 때문에 빈 위젯으로 대체하는 로직을 채택함.
  *
  *
  * 10.09 - 구조 변경
  * Flutter Hook 제거
  * 1. View에 State 로직을 제거
  * 2. 모듈화 작업 (BasePagedView, BasePagedViewModel)
  *
  * */

@immutable
abstract class BasePagedView<T extends BasePagedViewModel> extends GetView<T> {
  const BasePagedView({Key? key}) : super(key: key);

  T get vm => controller;

  @override
  Widget build(BuildContext context) {
    // return buildPagedView(context);
    return PageView.builder(
      controller: vm.pagedController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: vm.screenList.length,
      onPageChanged: (index) => vm.onPageChanged(index),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return vm.screenList[index];
      },
    );
  }

  // Widget buildPagedView(BuildContext context);
}
