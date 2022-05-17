import 'package:flutter/material.dart';
import 'package:myfirstapp/page/Trip_Spending.dart';
import 'package:myfirstapp/page/Trip_Plan.dart';
import 'package:myfirstapp/page/Trip_Detail.dart';
import 'package:myfirstapp/page/Trip_Checklist.dart';
import 'package:myfirstapp/models/Detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: Mainpage(),
      //initialRoute:'/main',
      routes: {
        '/main': (BuildContext context) => Mainpage(),
        '/Main_detail': (BuildContext context) => Main_detail(),
        '/Main_select': (BuildContext context) => Main_select(),
        '/Trip_Spending': (BuildContext context) => Trip_Spending(),
        '/Trip_Spending_2': (BuildContext context) => Trip_Spending_2(),
        '/Trip_Diary': (BuildContext context) => Mainpage(),
        '/Trip_Plan': (BuildContext context) => Trip_Plan(),
        '/Trip_Plan_2': (BuildContext context) => Trip_Plan_2(),
        '/Trip_Checklist': (BuildContext context) => Trip_Checklist(),
      },
    );
  }
}

class Mainpage extends StatefulWidget {
  final List<Detail> _details = [];
  @override
  State<Mainpage> createState() => _Mainpage();
}

class _Mainpage extends State<Mainpage> {
  void _updateRecord(addDetail) {
    Future.delayed(Duration(milliseconds: 500), () {
      if (addDetail != null) {
        setState(() {
          widget._details.add(addDetail);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My trip'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: widget._details.length,
        itemBuilder: (context, indice) {
          final detail = widget._details[indice];
          return ItemDetail(detail);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Main_detail();
          })).then(
            (addDetail) => _updateRecord(addDetail),
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemDetail extends StatelessWidget {
  final Detail _detail;
  ItemDetail(this._detail);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(_detail.country.toString() + ":" + _detail.date.toString()),
            //Text(_detail.date.toString()),
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/Main_select');
              },
              //onPressed: () => Main_select(),
              icon: Icon(
                Icons.add,
                size: 24.0,
              ),
              label: Text('Click here to add detail'),
            ),
          ],
        ),
      ),
    );
  }
}

class Main_select extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: Container(
        //margin: const EdgeInsets.all(10.0),
        width: 400,
        height: 500,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image.asset(
            'images/uk.jpeg',
            width: 400,
            height: 300,
            alignment: Alignment.topCenter,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/Trip_Spending');
            },
            child: Text(
              'Trip Spending',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/Trip_Plan');
            },
            child: Text(
              'Trip Notes',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/Trip_Checklist');
            },
            child: Text(
              'Trip Checklist',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
