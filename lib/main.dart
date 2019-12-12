import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    title: "Alert Dialog",
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  //const HomeScreen({Key key}) : super(key: key);

  Future<String> createAlertDialog(BuildContext context){
    TextEditingController customerController = TextEditingController();
    return showDialog(context: context,builder: (context){
      return AlertDialog(
        title: Text("Your Name"),
        content: TextField(
          controller: customerController,
        ),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text('Submit'),
            onPressed: (){
              Navigator.of(context).pop(customerController.text.toString());
            },
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Dialog"),
      ),
      body: Builder(builder: (context){
        return Container(
          child: Center(
            child: FlatButton(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              color: Colors.deepOrange,
              textColor: Colors.white,
              onPressed: (){
                createAlertDialog(context).then((onValue){
                  SnackBar mySnacbar = SnackBar(content: Text("Hello $onValue"),);
                  Scaffold.of(context).showSnackBar(mySnacbar);
                });
              },
              child: Text(
                'Alert',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          )
        );
      },),
    );
  }
}