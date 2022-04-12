import 'package:flutter/material.dart';
import 'Vars&voids.dart';

class Bottombar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        width: double.infinity,
        height: 40,
      ),
      shape: CircularNotchedRectangle(),
      color: darktheme ? Colors.blue[900] : Colors.lightBlue,
      notchMargin: 2,
      clipBehavior: Clip.hardEdge,
    );
  }
}
