import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Helpers {
  static Image getImage(String src, {height, width, fit}) {
    if (src.startsWith('http')) {
      return Image(
        image: CachedNetworkImageProvider(src),
        height: height,
        width: width,
        fit: fit,
      );
    } else {
      return Image.asset(src, height: height, width: width, fit: fit);
    }
  }
}
