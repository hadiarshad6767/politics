import 'package:flutter/material.dart';

import '../theme.dart';

class BuildIcon extends StatelessWidget {
  const BuildIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.whatsapp,
          color: kWhiteColor,
          size: 30,
        ),
        onPressed: () {});
  }
}
