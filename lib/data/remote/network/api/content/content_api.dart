import 'package:movie_curation/utilities/index.dart';

class ContentApi {
  final db = FirebaseFirestore.instance;

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
}

// [
//   {
//     youtubeVideIdList: [TaUgXoYjY4U, PlAIolfdhW0, AQ7reWRisqU],
//     contentId: 453395, title: 닥터 스트레인지,
//     type: 0,
//     youtubeChannelIdLit: [D120asdas3, D120asdas3, D120asdas3, D120asdas3]
//   },
//   {
//   youtubeVideIdList: [TaUgXoYjY4U, PlAIolfdhW0, AQ7reWRisqU],
//   contentId: 361743, title: 탑건 2 메버릭, type: 0, youtubeChannelIdLit: [D120asdas3, D120asdas3, D120asdas3, D120asdas3]
//   }
// ]
