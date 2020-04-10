import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackcorona/constants/AnnounceType.dart';

class Announcement {
  final String id;
  final String message;
  final String reference;
  final bool isTop;
  final Timestamp date;
  final int type; //0: Warning, 1: Info
  final String source;

  Announcement({this.id, this.message, this.source, this.isTop, this.date, this.type, this.reference});
  
  factory Announcement.fromMap(Map<String, dynamic> data, String documentId, {String locale = 'en'}) {
    if(data == null) return null;
    return Announcement(
      id: documentId,
      message: locale == 'en'? data['message']:data['message_$locale'],
      reference: data['reference'],
      source: data['source'],
      isTop: data['isTop'],
      date: data['date'],
      type: data['type']
    );
  }
  
  Map<String,dynamic> toMap() {
    return {
      'message': message,
      'source': source,
      'reference': reference,
      'isTop': isTop,
      'date': date,
      'type': type
    };
  }
}

//var announcements = [
//  new Announcement(
//    id: '001',
//    isTop: true,
//    message: 'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Donec ullamcorper fringilla eros. Fusce in sapien eu purus dapibus commodo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras faucibus condimentum odio. Sed ac ligula',
//    date: Timestamp.now(),
//    reference: '',
//    source: 'Minstry of Health',
//    type: AnnounceType.WARNING
//  ),
//  new Announcement(
//      id: '001',
//      isTop: false,
//      message: 'Wow! this is working!',
//      date: Timestamp.now(),
//      reference: '',
//      source: 'Minstry of Health and  sociosqu ad litora torquent per conubia nostra',
//      type: AnnounceType.INFO
//  ),
//];