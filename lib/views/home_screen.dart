import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/transction.dart';
import 'package:flutter_application_1/providers/transaction_prodivder.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    super.initState();
    Provider.of<TransactionssProvider>(context, listen: false).initDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello World"),
          actions: [
            IconButton(
              onPressed: () {
                SystemNavigator.pop();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => MyForm()),
                // );
              },
              icon: Icon(Icons.exit_to_app),
            )
          ],
        ),
        body: Consumer(
          builder: (context, TransactionssProvider provider, child) {
            var count = provider.transactions.length;
            if (count <= 0) {
              return Center(
                child: Text(
                  "ไม่มีข้อมูล",
                  style: TextStyle(fontSize: 40),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: count,
                itemBuilder: (context, int index) {
                  Transactions data = provider.transactions[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                    child: Card(
                      elevation: 2,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Text(data.amount.toString()),
                        ),
                        title: Text(data.title!),
                        subtitle:
                            Text(DateFormat("dd/mm/yyyy").format(data.date!)),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}
