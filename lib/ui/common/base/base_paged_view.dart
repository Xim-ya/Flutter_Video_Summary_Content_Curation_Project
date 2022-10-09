import 'package:movie_curation/utilities/index.dart';

@immutable
abstract class BasePagedView extends HookWidget {
  BasePagedView({Key? key}) : super(key: key);

  // VM Controller 생성

//  PagedViewScreen의 Screen Index, 0 : 홈 스크린, 1 : 컨텐츠 상세 스크린
  final screenIndex = useState(0);
}
