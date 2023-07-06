import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SecurityCard extends StatelessWidget {
  const SecurityCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height / 10,
        width: MediaQuery.of(context).size.width / 1.08,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(width: 13.0),
                Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                SizedBox(width: 13.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText('Change Password'),
                    AutoSizeText('Create new Password'),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 19.0),
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
