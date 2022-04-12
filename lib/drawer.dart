import 'package:flutter/material.dart';
import 'Vars&voids.dart';

var drawer = Drawer(
    child: Container(
  color: darktheme ? Colors.black : Colors.white,
  child: ListView(children: [
    DrawerHeader(child: Text('DrawerList')),
    Switch.adaptive(
        value: switchbut1,
        onChanged: (val) {
          switchbut1 = val;
        }),
    FlatButton(
      onPressed: () => AppLifecycleState.paused,
      child: ListTile(
        title: Text('Exit???'),
      ),
    ),
    ListTile(
      title: Text('title'),
      onTap: () {},
    ),
    ListTile(
      title: Text('title'),
      onTap: () {},
    ),
  ]),
));
