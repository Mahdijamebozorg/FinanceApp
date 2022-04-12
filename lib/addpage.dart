import 'package:Moneyapp/main.dart';
import 'package:flutter/material.dart';
import 'Vars&voids.dart';
import 'package:intl/intl.dart';

//this page inheritates submit from vars&voids

class Add extends StatefulWidget {
  final Function submit;
  Add(this.submit);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Text('Moneyapp').toString(),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Quick Add'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (consex) => Homepage(),
              ));
            },
          ),
        ),
        //body
        body: Builder(
          builder: (context) => Center(
            child: Container(
              width: double.infinity,
              height: 450,
              color: Colors.black38,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Text(
                          'Title:',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.4,
                        child: TextField(
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            hintText: 'Enter your Title',
                            hintStyle: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),

                          textAlign: TextAlign.center,
                          //get value
                          controller: titleE,
                          style: TextStyle(color: Colors.white70, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  //Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Text('Price',
                            style:
                                TextStyle(color: Colors.white, fontSize: 30)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.4,
                        child: TextField(
                          cursorColor: Colors.white,
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
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          style: TextStyle(color: Colors.white70, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(150),
                    color: Colors.blue,
                    child: InkWell(
                      onTap: () {
                        if (titleE.text.isEmpty ||
                            priceE.text.isEmpty ||
                            choosendate == null) {
                          snakbar(context, 'Fill the fields!');
                        }
                        if (titleE.text.isNotEmpty &&
                            priceE.text.isNotEmpty &&
                            choosendate != null) {
                          widget.submit();
                          snakbar(context, 'Added to list');
                          resettext();
                        }
                      },
                      child: Container(
                        width: 180,
                        height: 40,
                        child: Center(
                          child: Text(
                            'Add to list',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //choosen date
                      Text(
                        choosendate == null
                            ? 'no date choosen'
                            : DateFormat.yMd().format(choosendate),
                        style: TextStyle(color: Colors.white),
                      ),
                      //choose date
                      FlatButton(
                        onPressed: () => datepicker(context),
                        child: Text(
                          'Choose date',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.grey[900],
      ),
    );
  }
}
