import 'package:movie_curation/data/remote/network/firebase_db.dart';
import 'package:movie_curation/domain/models/channel/channel_model.dart';
import 'package:movie_curation/utilities/index.dart';

class ChannelApi {
  final db = FirebaseDatabase.db;

  Future<List<ChannelModel>> loadRegisteredChannelList() async {
    final _collectionRef = db.collection("channels");

    QuerySnapshot querySnapshot = await _collectionRef.get();

    final response = querySnapshot.docs
        .map((e) => ChannelModel.fromResponse(e.data() as Map<String, dynamic>))
        .toList();

    return response;
  }
}
