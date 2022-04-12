import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'Vars&voids.dart';
import 'package:intl/intl.dart';

class Homefield extends StatefulWidget {
  @override
  _HomefieldState createState() => _HomefieldState();

  //to state added items, we should do this and take value to item from mainpage
  final addtx;
  Homefield(this.addtx);
}

//to save date in it

class _HomefieldState extends State<Homefield> {
//datepicker
  void datepicker(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    );
    setState(() => choosendate = picked);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 8,
          left: 10,
          right: 10,
          //+10 upper than keyboard
          bottom: MediaQuery.of(context).viewInsets.bottom + 35,
        ),
        width: double.infinity,
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          //Title
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  child: TextField(
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                      hintText: 'Enter your Title',
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),

                    textAlign: TextAlign.center,
                    //get value
                    controller: titleE,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          //Price
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                width: MediaQuery.of(context).size.width / 1.4,
                child: TextField(
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                    hintText: 'Enter the Price',
                    hintStyle: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),

                  textAlign: TextAlign.center,
                  //get value
                  controller: priceE,
                  //input keyboard
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            )
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            //choosen date
            Text(choosendate == null
                ? 'no date choosen'
                : DateFormat.yMd().format(choosendate)),
            //choose date
            FlatButton(
                onPressed: () => datepicker(context),
                child: Text(
                  'Choose date',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                )),
            RaisedButton(
                //submit data
                color: Colors.blue,
                onPressed: () {
                  if (titleE.text == '' ||
                      priceE.text == '' ||
                      choosendate == null) {
                    Alert(
                      context: context,
                      title: 'Fill the fields',
                      type: AlertType.error,
                    ).show();
                  } else {
                    widget.addtx();
                    resettext();
                    Alert(
                            context: context,
                            title: 'Added!',
                            type: AlertType.success)
                        .show();
                  }
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                      fontFamily: '(50)', fontSize: 20, color: Colors.white),
                ))
          ])
        ]),
      ),
    );
  }
}
