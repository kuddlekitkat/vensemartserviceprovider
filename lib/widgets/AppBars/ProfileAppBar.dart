import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      '',
      style: TextStyle(
        color: Color(0xff1456f1),
      ),
    );
  }
}
