import 'package:movie_curation/data/remote/network/api/content/response/content_registered_id_info_item_response.dart';
import 'package:movie_curation/utilities/index.dart';

class ContentApi {
  final db = FirebaseFirestore.instance;

  // 추천 컨텐츠 리스트 호출
  Future<List<ContentRecommendedInfoResponse>>
      loadRecommendedContentInfo() async {
    final docRef = db.collection("contents").doc("Recommend");
    return docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        final core = data['data'] as List<dynamic>;
        return core
            .map((e) => ContentRecommendedInfoResponse.fromResponse(e))
            .toList();
      },
    );
  }

  // 등록된 컨텐츠 아이디 리스트 호출
  Future<List<ContentRegisteredIdInfoItemResponse>>
      loadRegisteredIdList() async {
    final docRef = db.collection('contents').doc('RegisteredIdList');
    return docRef.get().then((DocumentSnapshot snapshot) {
      final data = snapshot.data() as Map<String, dynamic>;
      final core = data['data'] as List<ContentRegisteredIdInfoItemResponse>;
      return core;
    });
  }
}
