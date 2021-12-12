import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/transction.dart';
import 'package:flutter_application_1/providers/transaction_prodivder.dart';
import 'package:flutter_application_1/views/HomePage.dart';
import 'package:flutter_application_1/views/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final formkey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("หน้ากรอกข้อมูล"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "ชื่อรายการ",
                    ),
                    autofocus: true,
                    controller: titleController,
                    validator: (formkey) {
                      if (formkey!.isEmpty) {
                        return "Empty String";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    // autofocus: true,
                    decoration: InputDecoration(
                      labelText: "จำนวน",
                    ),
                    controller: amountController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enpty Amount";
                      }
                      if (double.parse(value) <= 0) {
                        return "Enter your Amount";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        var title = titleController.text;
                        var amount = amountController.text;

                        Transactions statement = Transactions(
                          title: title,
                          amount: double.parse(amount),
                          date: DateTime.now(),
                        );

                        var provider = Provider.of<TransactionssProvider>(
                            context,
                            listen: false);

                        provider.addTransactions(statement);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (context) {
                              return HomepageApp();
                            },
                          ),
                        );
                      }
                    },
                    child: Text("เพิ่ม"),
                    color: Colors.blue,
                    height: 40.00,
                    textColor: Colors.white,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
