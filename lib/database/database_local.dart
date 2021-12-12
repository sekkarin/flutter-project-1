import 'package:flutter_application_1/models/transction.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TransacionsDB {
  String nameDB;
  TransacionsDB({required this.nameDB});

  Future<Database> openDataBase() async {
    var appdidertory = await getApplicationDocumentsDirectory();
    String dblocations = join(appdidertory.path, nameDB);
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dblocations);
    return db;
  }

  Insertdata(Transactions statement) async {
    var db = await this.openDataBase();
    var store = intMapStoreFactory.store("expense");

    var keyid = store.add(db, {
      "title": statement.title,
      "amount": statement.amount,
      "date": statement.date!.toIso8601String(),
    });
    db.close();
    return keyid;
  }

  Future<List<Transactions>> loadAlldata() async {
    var db = await openDataBase();
    var store = intMapStoreFactory.store("expense");
    var snapshot = await store.find(db,
        finder: Finder(
          sortOrders: [SortOrder(Field.key, false)],
        ));
    // print(snapshot);

    // ignore: deprecated_member_use
    var transactionDB = <Transactions>[];
    // transactionDB
    //     .add(Transactions(title: "Hello", amount: 23.1, date: DateTime.now()));
    // // transactionDB[0] = 2;
    // print(transactionDB);
    // // List<Transactions> transactionlist = [
    //   Transactions(title: "กางเกง", amount: 23.22, date: DateTime.now())
    // ];
    // Transactions  transactionslist  ;
    for (var recode in snapshot) {
      var title = recode["title"].toString();
      var amount = recode["amount"].toString();
      var date = recode["date"].toString();
      transactionDB.add(
        Transactions(
          title: title,
          amount: double.parse(amount),
          date: DateTime.parse(date),
        ),
      );
      // Transactions statement = Transactions(
      //   title: title,
      //   amount: double.parse(amount),
      //   date: DateTime.parse(date),
      // );

      //   // transactionlist.add(statement)

    }

    return transactionDB;
    // return true;
  }
}
