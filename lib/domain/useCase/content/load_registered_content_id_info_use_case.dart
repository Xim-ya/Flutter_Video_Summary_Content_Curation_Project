import 'package:movie_curation/domain/models/content/content_registered_id_info_model.dart';
import 'package:movie_curation/utilities/index.dart';

class LoadRegisteredContentIdInfoUseCase
    extends BaseNoParamUseCase<Result<List<ContentRegisteredIdInfoModel>>> {
  LoadRegisteredContentIdInfoUseCase(this._repository);
  final ContentRepository _repository;

  @override
  Future<Result<List<ContentRegisteredIdInfoModel>>> call() =>
      _repository.loadRegisteredIdList();
}
