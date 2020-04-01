import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackcorona/constants/firestore_refs.dart';
import 'package:hackcorona/models/status.dart';

class FirestoreService {
  final Firestore _firestore = Firestore.instance;

  
  Future<List<Status>> getGlobalStatus() async {
    QuerySnapshot statusSnapshot =
        await _firestore.collection(statusRef).getDocuments();
    List<Status> statusList =
        statusSnapshot.documents.map((doc) => Status.fromDoc(doc)).toList();

    return statusList;
  }
  
  Stream<QuerySnapshot> getGlobalStatusStream() {
    return _firestore.collection(statusRef).orderBy('index').snapshots();
  }
}
