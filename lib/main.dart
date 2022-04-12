import 'package:flutter/cupertino.dart';
import 'addpage.dart';
import 'package:flutter/material.dart';
import 'bottom.dart';
import 'trnslist.dart';
import 'homefield.dart';
import 'transaction.dart';
import 'chart.dart';
import 'Vars&voids.dart';
import 'dart:io';
import 'theme.dart';
import 'drawer.dart';

void main(List<String> args) {
  runApp(Homepage());
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

/////////////////////////////////////////////add obsering on widget
class _HomepageState extends State<Homepage> with WidgetsBindingObserver {
  //observing widgets behaviers
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  @override
  dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

///////////////////////////////////
  @override
  Widget build(BuildContext context) {
    // make defrent pageview for IOS
    final page = Platform.isIOS
        //IOS
        ? CupertinoApp(
            title: 'My expenses',
            debugShowCheckedModeBanner: false,
            home: Mainpage(),
          )
        //Android from materialapp
        : apearance;
    //
    return page;
  }
}

class Mainpage extends StatefulWidget {
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
//landscape home
  Widget _landscapeView(MediaQueryData mediaQuery, AppBar appBar) {
    return switchbut1
        //show chart
        ? Container(
            child: transations.isEmpty
                //show image
                ? Padding(
                    padding: EdgeInsets.only(top: mediaQuery.size.height * 0.2),
                    child: Image.asset(
                      'assets/images/waiting.png',
                      width: double.infinity,
                      height: mediaQuery.size.height * 0.3,
                    ),
                  )
                //show transactions
                : Container(
                    height: (mediaQuery.size.height -
                            //top of the phone
                            mediaQuery.padding.top -
                            //appbar size
                            appBar.preferredSize.height -
                            //switch container
                            40 -
                            //bottomsheet
                            45) *
                        1,
                    child: Translist(_deletetrans),
                  ),
          )
        //show chart
        : Container(
            height: (mediaQuery.size.height -
                    mediaQuery.padding.top -
                    appBar.preferredSize.height -
                    40 -
                    45) *
                1,
            child: Chart(_recentTransactions),
          );
  }

//portrait home
  List<Widget> _portraitView(MediaQueryData mediaQuery, AppBar appBar) {
    return [
      Container(
        height: (mediaQuery.size.height -
                mediaQuery.padding.top -
                appBar.preferredSize.height -
                40 -
                45) *
            0.35,
        child: Chart(_recentTransactions),
      ),
      Container(
        height: (mediaQuery.size.height -
                mediaQuery.padding.top -
                appBar.preferredSize.height -
                40 -
                45) *
            1,
        child: Translist(_deletetrans),
      ),
    ];
  }

//chart
  List<Transaction> get _recentTransactions {
    return transations.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  //submit transaction
  void submit() {
    final newtx = Transaction(
        date: choosendate,
        id: DateTime.now().toString(),
        price: double.parse(priceE.text),
        title: titleE.text);
    setState(() {
      transations.add(newtx);
    });
  }

  //delete transaction
  void _deletetrans(String id) {
    setState(() {
      transations.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

//bottomsheet
  void _bottomsheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return Homefield(submit);
        });
  }

  @override
  Widget build(BuildContext context) {
    //save davice sizes
    final mediaQuery = MediaQuery.of(context);
    //save routation in a boolean
    final islandscape = mediaQuery.orientation == Orientation.landscape;
//save appbar to variable to manage get its size
    final appBar = AppBar(
      actions: [
        //add from bottomsheet
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _bottomsheet(context),
        ),
        //popupmenu
        PopupMenuButton(itemBuilder: (BuildContext context) {
          return <PopupMenuEntry>[
            PopupMenuItem(child: Text('Option1')),
            PopupMenuItem(child: Text('Option2')),
          ];
        })
      ],
      title: Text('My expents', style: TextStyle()),
      centerTitle: true,
      backgroundColor: darktheme ? Colors.blue[900] : Colors.lightBlue,
    );
//body
//safearea covers the notch and other things
    final body = SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 45,
            color: darktheme ? Colors.indigo : Colors.blue[300],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                islandscape
                    //show switch to List
                    ? Row(children: [
                        Text('Show List'),
                        Switch.adaptive(
                          value: switchbut1,
                          onChanged: (val) {
                            setState(
                              () {
                                switchbut1 = val;
                              },
                            );
                          },
                          ////Hide switch to List
                        ),
                      ])
                    : Container(),
                Text('Dark Theme'),
                //dark theme
                Switch.adaptive(
                  value: darktheme,
                  onChanged: (val) {
                    setState(
                      () {
                        darktheme = val;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          if (islandscape)
            _landscapeView(mediaQuery, appBar)
          else
            // ... to be able to add a list to a list
            ..._portraitView(mediaQuery, appBar)
        ]),
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(child: body)
        : Scaffold(
            //drawer & options
            drawer: drawer,
            drawerEdgeDragWidth: 200,

            appBar: appBar,
            body: body,
            backgroundColor: darktheme ? Colors.grey[900] : Colors.white,
            //bottom
            bottomNavigationBar: Platform.isIOS ? null : Bottombar(),
            //float actin button
            floatingActionButton: Platform.isIOS
                ? null
                : FloatingActionButton(
                    elevation: 5,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (contex) => Add(submit),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.add_rounded,
                      size: 45,
                    ),
                    backgroundColor:
                        darktheme ? Colors.blue[800] : Colors.blue[600],
                    foregroundColor: darktheme ? Colors.black : Colors.white,
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
  }
}
