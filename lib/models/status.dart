import 'package:cloud_firestore/cloud_firestore.dart';

class Status {
  final String id;
  final String label;
  final String value;

  Status({this.id, this.label, this.value});

  factory Status.fromDoc(DocumentSnapshot doc) {
    return Status(
      id: doc.documentID,
      label: doc['label'],
      value: doc['value']
    );
  }
}
