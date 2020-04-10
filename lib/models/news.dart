import 'package:cloud_firestore/cloud_firestore.dart';

class News {
  final String id;
  final String title;
  final String body;
  final Timestamp date;
  final int views;
  final int likes;
  final String image;
  final String source;
  News(
      {this.id,
      this.source,
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
      source: data['source'],
      date: data['date'],
      views: data['views'],
      likes: data['likes'],
      image: data['image'],
    );
  }
}

var allNews = [
  News(
      date: Timestamp.now(),
      id: '0001',
      body:
          "If keeping your grandparents safe means you can't visit them...talk to them every day so they don't feel alone.\nKeeping each other safe and connected is everyone's responsibility.\nPhysical distancing is not social isolation.",
      title: "What keeping your grandparents safe means?",
      likes: 10,
      views: 200,
      image: 'assets/images/symptoms/symptoms-shortness-breath.jpg'),
  News(
      date: Timestamp.now(),
      id: '0001',
      body:
          "If keeping your grandparents safe means you can't visit them...talk to them every day so they don't feel alone.\r\n\nKeeping each other safe and connected is everyone's responsibility.\nPhysical distancing is not social isolation.",
      title: "What keeping your grandparents safe means?",
      likes: 10,
      views: 200,
      image: 'assets/images/symptoms/symptoms-cough.jpg')
];
