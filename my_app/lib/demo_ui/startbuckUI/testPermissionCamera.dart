import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class TestCamera extends StatefulWidget {
  @override
  _TestCameraState createState() => _TestCameraState();
}

class _TestCameraState extends State<TestCamera> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(onLayoutDone);
  }

  void onLayoutDone(Duration timeStamp) async {
    _permissionStatus = await Permission.camera.status;
    setState(() {});
  }

  PermissionStatus _permissionStatus;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SFL Flutter Permission Article'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_permissionStatus',
              style: Theme.of(context).textTheme.headline5,
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 14.0,
                ),
                child: Text(
                  'Request Permission',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
              color: Colors.lightBlue,
              onPressed: () {
                _askCameraPermission();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _askCameraPermission() async {
    if (await Permission.camera.request().isGranted) {
      _permissionStatus = await Permission.camera.status;
      setState(() {});
    }
  }
}
