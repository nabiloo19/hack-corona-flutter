import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackcorona/constants/firestore_refs.dart';
import 'package:hackcorona/models/corona_info.dart';
import 'package:hackcorona/models/status.dart';
import 'package:hackcorona/services/firestore_service.dart';

class DatabaseService {
  final _service = FirestoreService.instance;

  ///Global Summary Status Stream
  Stream<List<Status>> globalSummaryStatusStream() => _service.collectionStream(
      path: statusRef,
      builder: (data, documentId) => Status.fromMap(data, documentId));

  ///Get Corona Info Data
  Future<List<CoronaInfo>> getCoronaInfoData(String ref) => _service.getCollectionData(
      path: ref,
      builder: (data, documentId) => CoronaInfo.fromMap(data, documentId));

  ///Get Corona Info QuerySnap
  Future<QuerySnapshot> getCoronaInfoSnap(String ref) => _service.getQuerySnap(path: ref);
}
