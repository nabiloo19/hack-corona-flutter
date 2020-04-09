class FirestorePath {
  static String globalInfo() => 'status';

  static String symptoms(String locale) => 'info/$locale/symptoms';

  static String prevents(String locale) => 'info/$locale/prevents';

  static String news(String locale) => 'news/$locale/newsColl';

  static String newsDoc(String locale, String newsId) =>
      'news/$locale/newsColl/$newsId';

  static String covidAnnouncements(String locale) =>
      'announcements/covid19/covidAnnouncements';
}
