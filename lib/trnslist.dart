import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'transaction.dart';

class Translist extends StatelessWidget {
  final Function deletetrans;
  Translist(this.deletetrans);

  @override
  Widget build(BuildContext context) {
    return transations.isEmpty
        //show image
        ? Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.46),
            child: Image.asset(
              'assets/images/waiting.png',
              width: double.infinity,
            ),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              //transactions items
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  //price
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text('${transations[index].price}'),
                      ),
                    ),
                  ),
                  //title
                  title: Text(
                    transations[index].title,
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  //date
                  subtitle: Text(
                    DateFormat.yMMMd().format(transations[index].date),
                    style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                    textAlign: TextAlign.right,
                  ),
                  //delete
                  trailing: IconButton(
                    icon: Icon(
                      Icons.info,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      Alert(
                        context: context,
                        title: 'Details:',
                        content: Column(
                          children: [
                            Text(transations[index].title),
                            Text('\$${transations[index].price.toString()}'),
                            Text(
                              DateFormat.yMMMd()
                                  .format(transations[index].date),
                            )
                          ],
                        ),
                        buttons: [
                          DialogButton(
                            color: Colors.white54,
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 40,
                            ),
                            onPressed: () {
                              deletetrans(transations[index].id);

                              Navigator.pop(context);
                            },
                          ),
                        ],
                        type: AlertType.info,
                      ).show();
                    },
                  ),
                ),
              );
            },
            itemCount: transations.length,
          );
  }
}
