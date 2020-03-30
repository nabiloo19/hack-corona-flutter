import 'package:logger/logger.dart';

class Log {
  static log(String tag, {String message}) {
    Logger logger = Logger(
      printer: PrettyPrinter(
          printEmojis: false,
          printTime: false,
          colors: false,
          methodCount: 0,
          errorMethodCount: 15),
    );
    
    logger.wtf("[$tag] $message");
  }
}
