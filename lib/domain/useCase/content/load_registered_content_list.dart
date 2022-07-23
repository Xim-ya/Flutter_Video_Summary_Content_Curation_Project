import 'package:movie_curation/utilities/data/firebase_temp_data.dart';
import 'package:movie_curation/utilities/index.dart';

/* 2022.07.16 Created By Ximya
   해당 Usecase는 관리자에 의해 직접 `등록된 컨텐츠` 리스트를 호출함.
   서버에 등록된 id값을 기준으로 [TMDB] API 데이터를 호출해 필요한 속성으로 모델링 과정을 거침.

*/

class LoadRegisteredContentListUseCase extends BaseNoParamUseCase {
  final List<RegisteredContent> registeredContentsInfo =
      FirebaseTemp.registerContentList;

  @override
  Future call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
