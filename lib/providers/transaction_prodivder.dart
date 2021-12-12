import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/database/database_local.dart';
import 'package:flutter_application_1/models/transction.dart';

class TransactionssProvider with ChangeNotifier {
  List<Transactions> transactions = [];

  List<Transactions> getTransactions() {
    return transactions;
  }

  void addTransactions(Transactions statement) async {
    var db = TransacionsDB(nameDB: "transaction.db");

    await db.Insertdata(statement);

    transactions = await db.loadAlldata();
    // transactions.insert(0, statement);
    notifyListeners();
  }

  void initDate() async {

    var db = TransacionsDB(nameDB: "transaction.db");

    transactions = await db.loadAlldata();

    notifyListeners();
  }
}
