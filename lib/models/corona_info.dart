class CoronaInfo {
  final String id;
  final String title;
  final String caption;
  final String description;
  final String image;

  CoronaInfo({this.id, this.title, this.caption, this.description, this.image});

  factory CoronaInfo.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }
    return CoronaInfo(
      id: documentId,
      title: data['title'],
      caption: data['caption'],
      description: data['description'],
      image: data['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'caption': caption,
      'description': description,
      'image': image,
    };
  }
}

var prevents = [
  CoronaInfo(
    id: '0001',
    image: 'assets/images/symptoms/symptoms-cough.jpg',
    title: 'Clean Your Hand',
    caption: 'Wash hand with soap and sanitizers',
    description: 'Wash your hands often with soap and water for at least 20 seconds especially after you have been in a public place, or after blowing your nose, coughing, or sneezing.',
  ),
  
  CoronaInfo(
    id: '0002',
    image: 'assets/images/symptoms/symptoms-fever.jpg',
    title: 'Avoid Close Contact and',
    caption: 'Stay home as much as possible',
    description: 'Wash your hands often with soap and water for at least 20 seconds especially after you have been in a public place, or after blowing your nose, coughing, or sneezing.',

  ),
  
  CoronaInfo(
    id: '0001',
    image: 'assets/images/symptoms/symptoms-shortness-breath.jpg',
    title: 'Wear a facemask',
    caption: 'Wear a facemask if you are sick',
    description: 'Wash your hands often with soap and water for at least 20 seconds especially after you have been in a public place, or after blowing your nose, coughing, or sneezing.',

  ),
];

var symptoms = [
  CoronaInfo(
    id: '0001',
    image: 'assets/images/symptoms/symptoms-cough.jpg',
    title: 'Cough',
    caption: 'Dry cough which is developing through time',
    description: '',
  ),
  
  CoronaInfo(
    id: '0002',
    image: 'assets/images/symptoms/symptoms-fever.jpg',
    title: 'Fever',
    caption: 'Dry cough which is developing through time',
    description: '',
  ),
  
  CoronaInfo(
    id: '0001',
    image: 'assets/images/symptoms/symptoms-shortness-breath.jpg',
    title: 'Shortness Breath',
    caption: 'Dry cough which is developing through time',
    description: '',
  ),
  CoronaInfo(
    id: '0001',
    image: 'assets/images/symptoms/symptoms-cough.jpg',
    title: 'Cough',
    caption: 'Dry cough which is developing through time',
    description: '',
  ),
];
