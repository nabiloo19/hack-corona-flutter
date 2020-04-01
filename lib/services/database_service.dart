import 'package:hackcorona/constants/firestore_refs.dart';
import 'package:hackcorona/models/status.dart';
import 'package:hackcorona/services/firestore_service.dart';

class DatabaseService {
  final _service = FirestoreService.instance;

  //Global Summary Status Stream
  Stream<List<Status>> globalSummaryStatusStream() => _service.collectionStream(
      path: statusRef,
      builder: (data, documentId) => Status.fromMap(data, documentId));
}
