import 'package:flutter/material.dart';
import 'package:my_app/modelProviders/model_providers.dart';
import 'package:my_app/providers/transection/transection_providers.dart';
import 'package:my_app/screenproviders/formInsert_provider.dart';
import 'package:my_app/screenproviders/formedit_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class MainScreenProviders extends StatefulWidget {
  @override
  _MainScreenProvidersState createState() => _MainScreenProvidersState();
}

class _MainScreenProvidersState extends State<MainScreenProviders> {
  void initState() {
    //ประกาศเมื่อต้องการให้ทำการตั้งแต่เริ่มต้น
    super.initState();
    Provider.of<TransectionProvider>(context, listen: false).initData();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        elevation: 0,
        actions: [
          MaterialButton(
            elevation: 5.0,
            child: Icon(Icons.add),
            onPressed: () {
              MaterialPageRoute materialPageRoute = MaterialPageRoute(
                  builder: (BuildContext context) => FormInsertProviders());
              Navigator.of(context).push(materialPageRoute);
            },
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Row(
            children: [
              consumerTransection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget consumerTransection() {
    return Consumer(
      //ประกาศ Consumer เพื่อรับค่า Provoider
      builder:
          (context, TransectionProvider transectionProvider, Widget child) {
        var count = transectionProvider.transections.length;
        if (count <= 0) {
          return Center(
            child: Text(
              "ไม่พบข้อมูล",
              style: TextStyle(fontSize: 35),
            ),
          );
        } else {
          return Expanded(
            child: ListView.builder(
                itemCount: transectionProvider.transections.length,
                itemBuilder: (context, index) {
                  Transections data = transectionProvider.transections[
                      index]; //เข้าถึงข้อมูล List จาก Model ทีละตัว
                  return Card(
                    margin: EdgeInsets.all(8),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data.title),
                              Text(data.amount.toString()),
                              Text(
                                DateFormat("dd/MM/yyyy").format(data.date),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              ButtonBar(
                                alignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      FlatButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              title: Text('delete_confirm'.tr),
                                              content:
                                                  Text('delete_confirm'.tr),
                                              actions: [
                                                FlatButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'Cancel'),
                                                  child: Text('cancel'.tr),
                                                ),
                                                FlatButton(
                                                  onPressed: () {
                                                    var provider = Provider.of<
                                                            TransectionProvider>(
                                                        context,
                                                        listen: false);
                                                    provider.deleteData(
                                                        data.key_ID);
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('ok'.tr),
                                                ),
                                              ],
                                            ),
                                          ).then((returnVal) {
                                            if (returnVal != "Cancel") {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text('ok_confirm'.tr),
                                                action: SnackBarAction(
                                                    label: 'ok'.tr,
                                                    onPressed: () {}),
                                              ));
                                            }
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.delete,
                                              color: Colors.red.shade800,
                                            ),
                                          ],
                                        ),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          // print(data.key_ID);
                                          MaterialPageRoute materialPageRoute =
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          FormEditProviders());
                                          Navigator.of(context)
                                              .push(materialPageRoute);
                                          // var provider =
                                          //     Provider.of<TransectionProvider>(
                                          //         context,
                                          //         listen: false);
                                          // provider.getData(data.key_ID);
                                        },
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.edit,
                                              color: Colors.amber.shade900,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          );
        }
      },
    );
  }
}
