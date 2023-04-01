import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage(this.imageUrl, {Key? key, this.fit = BoxFit.cover})
      : super(key: key);

  final String imageUrl;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(imageUrl, fit: fit));
  }
}
