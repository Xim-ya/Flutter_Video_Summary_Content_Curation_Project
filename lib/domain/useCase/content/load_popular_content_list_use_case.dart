import 'package:movie_curation/utilities/index.dart';

/* 2022.07.16 Created by Ximya
   인기 영화 드라마 컨텐츠 리스트 호출을 담당하는 UseCase
   현재 controller에서 선택된 `카테고리 인덱스`를 기준으로 컨텐츠를 호출
*/

class LoadPopularContentListUseCase
    extends BaseUseCase<int, Result<List<ContentModel>>> {
  LoadPopularContentListUseCase(this._repository);
  final TmdbRepository _repository;

  @override
  Future<Result<List<ContentModel>>> call(request) {
    switch (request) {
      case 0:
        return _repository.loadPopularMovie();
      case 1:
        return _repository.loadPopularDrama();
      case 2:
        print("Firebase Registered Custom");
        break;
    }
    return _repository.loadPopularMovie();
  }
}
