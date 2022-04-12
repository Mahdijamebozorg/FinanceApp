import 'package:flutter/material.dart';

//reset
void resettext() {
  titleE.clear();
  priceE.clear();
}

//switch button
bool switchbut1 = false;
bool switchbut2 = false;
bool darktheme = true;

//CONTROLL INPUTS
void but() => print('buttonpressed');
final titleE = TextEditingController();
final priceE = TextEditingController();

//save choosen date
DateTime choosendate;

//
///snackbar
snakbar(BuildContext context, String massage) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text(
        massage,
        style: TextStyle(
          fontSize: 15,
        ),
        textAlign: TextAlign.center,
      ),
      duration: Duration(milliseconds: 650),
      backgroundColor: Colors.red[300],
    ),
  );
}
