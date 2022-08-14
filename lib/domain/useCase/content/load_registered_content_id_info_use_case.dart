import 'dart:developer';
import 'package:movie_curation/utilities/index.dart';

/*
1) firebase db에 저장된 등록된 컨텐츠 리스트 데이터 호출 -> id 값만 호출
2) 전달 받은 Id가 Firebase DB에 저장되어 있는지 확인.
*/

class LoadRegisteredContentIdInfoUseCase
    extends BaseUseCase<int, Result<ContentRegisteredIdInfoModel?>> {
  LoadRegisteredContentIdInfoUseCase(this._repository);
  final ContentRepository _repository;

  @override
  Future<Result<ContentRegisteredIdInfoModel?>> call(int request) async {
    // 1
    final List<ContentRegisteredIdInfoModel> registeredIdList = [];
    final idListResResult = await _repository.loadRegisteredIdList();
    idListResResult.fold(onSuccess: (data) {
      registeredIdList.addAll(data);
    }, onFailure: (err) {
      log(err.toString());
    });

    // 2
    final ContentRegisteredIdInfoModel? matchedInfo =
        registeredIdList.firstWhereOrNull((e) => e.contentId == request);

    return Result.success(matchedInfo);
  }
}
