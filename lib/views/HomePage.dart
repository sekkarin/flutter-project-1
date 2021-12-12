import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/transction.dart';

import 'package:flutter_application_1/providers/transaction_prodivder.dart';
import 'package:flutter_application_1/views/form1.dart';
import 'package:flutter_application_1/views/home_screen.dart';
import 'package:flutter_application_1/views/page2.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomepageApp extends StatefulWidget {
  const HomepageApp({Key? key}) : super(key: key);

  @override
  _HomepageAppState createState() => _HomepageAppState();
}

class _HomepageAppState extends State<HomepageApp> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: TabBarView(
          children: [HomeScreen(), MyForm()],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.list),
              text: "รายการ",
            ),
            Tab(
              icon: Icon(Icons.add),
              text: "เพิ่มขอมูล",
            ),
          ],
        ),
      ),
    );
  }
}

// Scaffold(
//         appBar: AppBar(
//           title: Text("Hello World"),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 SystemNavigator.pop();
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => MyForm()),
//                 // );
//               },
//               icon: Icon(Icons.exit_to_app),
//             )
//           ],
//         ),
//         body: Consumer(
//           builder: (context, TransactionssProvider provider, child) {
//             var count = provider.transactions.length;
//             if (count <= 0) {
//               return Center(
//                 child: Text(
//                   "ไม่มีข้อมูล",
//                   style: TextStyle(fontSize: 40),
//                 ),
//               );
//             } else {
//               return ListView.builder(
//                 itemCount: count,
//                 itemBuilder: (context, int index) {
//                   Transactions data = provider.transactions[index];
//                   return Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
//                     child: Card(
//                       elevation: 2,
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           radius: 30,
//                           child: Text(data.amount.toString()),
//                         ),
//                         title: Text(data.title!),
//                         subtitle:
//                             Text(DateFormat("dd/mm/yyyy").format(data.date!)),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//         ));
  