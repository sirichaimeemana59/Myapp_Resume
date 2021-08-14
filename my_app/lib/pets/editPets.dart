import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:my_app/cleass_model/PetEdit.dart';
import 'package:my_app/pets/petList.dart';
//import 'package:image_picker/image_picker.dart';
//import 'petList.dart';

class EditPetsForm extends StatefulWidget {
  //EditPetsForm(String name);

  @override
  _EditPetsFormState createState() => _EditPetsFormState();
}

class Todo {
  final String name;
  Todo(this.name);
}

class _EditPetsFormState extends State<EditPetsForm> {
  final formKey = GlobalKey<FormState>();
  String nameString, ageString, noteString, photoString;
  String nameData, ageData, noteData, photoData, idData;
  File file;

  bool isLoading = false;

  void initState() {
    //Get State
    super.initState();
    this.fetchPetsDetail(null);
  }

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context).settings.arguments;
    fetchPetsDetail(todo);
    //print(dataPets?.name);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: Text('Pet Family'),
        actions: [
          submitButton(),
        ],
      ),
      body: showForm(),
    );
  }

  //Widget getbody() {
  //return ListView.builder(
  // itemCount: petsDetail.length,
  //itemBuilder: (context, index) {
  // return getListForm(petsDetail[index]);
  //});
  //}

  // ignore: missing_return
  //Widget getListForm(item) {
  //var name = item['name'];
  //var age = item['age'];
  //var photo = item['photo'];
  //var note = item['note'];
  //var id = item['id_pet'];
  //nameString = name;
  //ageString = age;
  //photoString = photo;
  //noteString = note;
  //}

  //API Get data detail pets and fetch
  fetchPetsDetail(todo) async {
    //print(todo);
    // String _id = id;
    var response = await http
        .get(Uri.http('127.0.0.1:8000', '/user_get_detail_pets/' + '$todo'));
    if (response.statusCode == 200) {
      var itemsPets = json.decode(response.body)['data'];

      //print(itemsPets['id_pet']);
      if (mounted)
        setState(() {
          nameData = itemsPets['name'];
          ageData = itemsPets['age'];
          photoData = itemsPets['photo'];
          noteData = itemsPets['note'];
          idData = itemsPets['id_pet'].toString();
        });
      //var id = null;
    } else {
      if (mounted)
        setState(() {
          nameData = '';
          ageData = '';
          photoData = '';
          noteData = '';
          idData = '';
        });
    }
    //print(userAccountFromJson(response.body));
  }

  //End fetch
//Widget Input form
  Widget nameText() {
    return TextFormField(
      controller: TextEditingController(text: nameData),
      decoration: InputDecoration(
        icon: Icon(Icons.pets, color: Colors.blue.shade800),
        labelText: 'Displays Name',
        //hintText: nameData,
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        helperText: 'Please input your name pets',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Your Name Pets';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        nameString = value.trim();
      },
    );
  }

  Widget ageText() {
    return TextFormField(
      controller: TextEditingController(text: ageData),
      decoration: InputDecoration(
        icon: Icon(Icons.calendar_today, color: Colors.blue.shade800),
        labelText: 'Displays Age',
        //hintText: ageData,
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        helperText: 'Please input your age pets',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Your Age Pets';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        ageString = value.trim();
      },
    );
  }

  Widget photoText() {
    return TextFormField(
      controller: TextEditingController(text: photoData),
      decoration: InputDecoration(
        icon: Icon(Icons.photo_camera, color: Colors.blue.shade800),
        labelText: 'Displays Photo',
        //hintText: photoData,
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        helperText: 'Please input your Photo pets',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Your Photo Pets';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        photoString = value.trim();
      },
    );
  }

  Widget noteText() {
    return TextFormField(
      controller: TextEditingController(text: noteData),
      decoration: InputDecoration(
        icon: Icon(Icons.note, color: Colors.blue.shade800),
        labelText: 'Displays Note',
        //hintText: noteData,
        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        helperText: 'Please input your Note pets',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Your Note Pets';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        noteString = value.trim();
      },
    );
  }

  //Show form
  Widget showForm() {
    return Scaffold(
      body: Form(
          key: formKey,
          child: Center(
            child: ListView(
              padding: EdgeInsets.all(30.0),
              children: [
                nameText(),
                ageText(),
                photoText(),
                noteText(),
              ],
            ),
          )),
    );
  }

//Button Save
  Widget submitButton() {
    return IconButton(
        icon: Icon(Icons.pets),
        onPressed: () async {
          print('Click Me');
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            final String name = nameString;
            final String age = ageString;
            final String photo = photoString;
            final String note = noteString;
            final String id = idData;
            //print('name= $name, age= $age, photo= $photo,note= $note,id=$id');
            updatePets(name, age, photo, note, id);
          }
        });
  }

  //API Update pets
  // ignore: missing_return
  Future<PestEditModel> updatePets(
      //สร้าง Future เพื่อเรียก UserModel และส่งไปสรเาง User
      String name,
      String age,
      String photo,
      note,
      id) async {
    //final String apiCreateUser = "http://127.0.0.1:8000/user_create_user";

    var response = await http
        .post(Uri.http('127.0.0.1:8000', '/user_update_pets'), body: {
      "name": name,
      "age": age,
      "photo": photo,
      "note": note,
      "id": id
    });
    if (response.statusCode == 200) {
      print('success');
      //contentPopup();
      //createAlertDialog(context);
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => PetControler());
      Navigator.of(context).push(materialPageRoute);
    } else {
      print('Error');
    }
  }
}
