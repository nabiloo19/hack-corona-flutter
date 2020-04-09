import 'package:cloud_firestore/cloud_firestore.dart';

class News {
  final String id;
  final String title;
  final String body;
  final Timestamp date;
  final int views;
  final int likes;
  final String image;

  News(
      {this.id,
      this.title,
      this.body,
      this.date,
      this.views,
      this.likes,
      this.image});

  factory News.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }
    return News(
      id: documentId,
      title: data['title'],
      body: data['body'],
      date: data['date'],
      views: data['views'],
      likes: data['likes'],
      image: data['image'],
    );
  }

}
