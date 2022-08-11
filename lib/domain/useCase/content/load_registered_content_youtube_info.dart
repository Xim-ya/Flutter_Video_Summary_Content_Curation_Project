// import 'dart:developer';
//
// import 'package:movie_curation/utilities/index.dart';
//
// /* Firebase DB에 등록된 컨텐츠가 있다면, 해당 컨텐츠의 저장된 [유튜브 정보]를 반환하는 Usecase
//   *  1) content id - (movie Id, drama id)를 파라미터 값으로 전달 받음.
//   *  2) 전달 받은 Id가 Firebase DB에 저장되어 있는지 확인.
//   *  2) Firebase DB에 해당 ID가 있다면 FirebaseDB에 저장된 유튜브 정보 리스트 호출
//   * */
//
// class LoadRegisteredContentYoutubeInfo
//     extends BaseUseCase<int, List<YoutubeVideoContentModel>> {
//   LoadRegisteredContentYoutubeInfo(this._contentRepository);
//
//   final ContentRepository _contentRepository;
//
//   @override
//   Future<List<YoutubeVideoContentModel>> call(int request) async {
//     // 1
//     final Map<String, int> registeredIdList = [];
//     final idListResponse = await _contentRepository.loadRegisteredIdList();
//     idListResponse.fold(onSuccess: (data) {
//       data.map((e) => registeredIdList.add(e));
//     }, onFailure: (err) {
//       log(err.toString());
//     });
//     // 2
//     final bool isRegisteredId = registeredIdList.contains(request);
//
//     //3
//   }
// }
