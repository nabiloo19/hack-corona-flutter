import 'package:cloud_firestore/cloud_firestore.dart';

class Status {
  final String id;
  final String label;
  final String value;

  Status({this.id, this.label, this.value});

  factory Status.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }
    return Status(
      id: documentId,
      label: data['label'],
      value: data['value'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'value': value,
    };
  }

  factory Status.fromDoc(DocumentSnapshot doc) {
    return Status(id: doc.documentID, label: doc['label'], value: doc['value']);
  }

  @override
  String toString() => 'label: $label, value: $value';
}
