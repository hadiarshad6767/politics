import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../theme.dart';

class WhatsappPage extends StatelessWidget {
  const WhatsappPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatappPage"),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      // body: Text("WhatappPage"),
    );
  }
}
