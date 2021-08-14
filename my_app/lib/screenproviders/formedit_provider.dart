import 'package:flutter/material.dart';
import 'package:my_app/modelProviders/model_providers.dart';
import 'package:my_app/providers/transection/transection_providers.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class FormEditProviders extends StatefulWidget {
  @override
  _FormEditProvidersState createState() => _FormEditProvidersState();
}

class _FormEditProvidersState extends State<FormEditProviders> {
  void initState() {
    // super.initState();
    // Provider.of<TransectionProvider>(context, listen: false)
    //     .getData("SHd5kFJ2lL");
  }

  final formKey = GlobalKey<FormState>(); //Validate form
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('edit_pay'.tr),
        actions: [
          // registerButton(),
        ],
      ),
      body: Form(
        key: formKey, //ทำ widget form ครอบเพื่อให้validate
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            //padding: EdgeInsets.all(30.0),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText(),
              amountText(),
              saveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget titleText() {
    return TextFormField(
      controller: titleController,
      autofocus: true,
      style: TextStyle(
        color: Colors.blue.shade900,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
      decoration: InputDecoration(
        icon: Icon(Icons.face, color: Colors.blue.shade800),
        labelText: 'ชื่อสินค้า',
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        helperText: 'กรุณาระบุชื่อสินค้า',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'กรุณาระบุชื่อสินค้า';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        //nameString = value.trim();
      },
    );
  }

  Widget amountText() {
    return TextFormField(
      controller: amountController,
      keyboardType: TextInputType.number,
      style: TextStyle(
        color: Colors.blue.shade900,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
      decoration: InputDecoration(
        icon: Icon(Icons.face, color: Colors.blue.shade800),
        labelText: 'จำนวน',
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        helperText: 'กรุณาระบุจำนวน',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'กรุณาระบุจำนวน';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        //nameString = value.trim();
      },
    );
  }

  Widget saveButton() {
    // ignore: deprecated_member_use
    return FlatButton(
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          var title = titleController.text;
          var amount = amountController.text;

          //Pack Data Send To Provider
          Transections statement = Transections(
            title: title,
            amount: double.parse(amount),
            date: DateTime.now(),
          );
          //Provider Call
          var provider =
              Provider.of<TransectionProvider>(context, listen: false);
          provider.addTransection(statement);
          Navigator.pop(context);
        }
      },
      color: Colors.blue,
      child: Text(
        'บันทึก',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
