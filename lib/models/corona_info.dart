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

///*********************** Prevents *****************************************///
var prevents = [
  CoronaInfo(
    id: '0001',
    image: 'assets/images/symptoms/symptoms-cough.jpg',
    title: 'Clean Your Hand',
    caption: 'Wash hand with soap and sanitizers',
    description:
        'Wash your hands often with soap and water for at least 20 seconds especially after you have been in a public place, or after blowing your nose, coughing, or sneezing.',
  ),
  CoronaInfo(
    id: '0002',
    image: 'assets/images/symptoms/symptoms-fever.jpg',
    title: 'Avoid Close Contact and',
    caption: 'Stay home as much as possible',
    description:
        'Put distance between yourself and other people if COVID-19 is spreading in your community.',
  ),
  CoronaInfo(
    id: '0003',
    image: 'assets/images/symptoms/symptoms-shortness-breath.jpg',
    title: 'Wear a facemask',
    caption: 'Wear a facemask if you are sick',
    description:
        'Use the facemask either when you go out or at home if you are feeling ill.',
  ),
  CoronaInfo(
    id: '0004',
    image: 'assets/images/symptoms/symptoms-tissue.jpg',
    title: 'Cover your mouth and nose',
    caption: 'Use a tissue when you cough or sneeze',
    description:
        'Cover your mouth and nose with a tissue when you cough or sneeze or use the inside of your elbow. Throw used tissues in the trash.Immediately wash your hands with soap and water for at least 20 seconds. If soap and water are not readily available, clean your hands with a hand sanitizer that contains at least 60% alcohol.',
  ),
];

///*********************** Symptoms *****************************************///
var symptoms = [
  CoronaInfo(
    id: '0001',
    image: 'assets/images/symptoms/symptoms-cough.jpg',
    title: 'Cough',
    caption: 'Dry cough which is developing through time',
    description: '',
  ),
  CoronaInfo(
    id: '0001',
    image: 'assets/images/symptoms/symptoms-fever.jpg',
    title: 'Fever',
    caption: 'High temperature – you feel hot to touch on your chest or back',
    description: '',
  ),
  CoronaInfo(
    id: '0002',
    image: 'assets/images/symptoms/symptoms-shortness-breath.jpg',
    title: 'Shortness Breath',
    caption: 'Difficulty breathing or shortness of breath',
    description: '',
  ),
  CoronaInfo(
    id: '0003',
    image: 'assets/images/symptoms/symptoms-cough.jpg',
    title: 'Cough',
    caption: 'New, continuous cough – this means you have started coughing repeatedly',
    description: '',
  ),
];
