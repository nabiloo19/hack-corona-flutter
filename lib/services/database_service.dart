import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackcorona/constants/firestore_refs.dart';
import 'package:hackcorona/models/QuestionAnswer.dart';
import 'package:hackcorona/models/announcement.dart';
import 'package:hackcorona/models/corona_info.dart';
import 'package:hackcorona/models/news.dart';
import 'package:hackcorona/models/status.dart';
import 'package:hackcorona/services/firestore_path.dart';
import 'package:hackcorona/services/firestore_service.dart';

class DatabaseService {
  final _service = FirestoreService.instance;

  ///Global Case Summary Status Stream
  Stream<List<Status>> globalSummaryStatusStream(String path) =>
      _service.collectionStream(
          path: path,
          builder: (data, documentId) => Status.fromMap(data, documentId));

  ///Get Corona Info Data (Symptoms or Preventions)
  Future<List<CoronaInfo>> getCoronaInfoData(String path) =>
      _service.getCollectionData(
          path: path,
          builder: (data, documentId) => CoronaInfo.fromMap(data, documentId));

  ///Get Corona Info QuerySnap
  Future<QuerySnapshot> getCoronaInfoSnap(String path) =>
      _service.getQuerySnap(path: path);

  ///Get Covid-19 Announcements
  Stream<List<Announcement>> getCovidAnnouncements(
          String path, String locale) =>
      _service.collectionStream(
          path: path,
          builder: (data, documentId) =>
              Announcement.fromMap(data, documentId, locale: locale));

  ///Get News
  Stream<List<News>> getNews(String path) => _service.collectionStream(
        path: path,
        builder: (data, documentId) => News.fromMap(data, documentId),
      );

  ///Get FAQ
  Future<List<QuestionAnswer>> getFAQ(String path) => _service.getCollectionData(
    path: path,
    builder: (data, documentId) => QuestionAnswer.fromMap(data, documentId),
  );
}
