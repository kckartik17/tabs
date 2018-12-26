import 'package:flutter/material.dart';
import './firstpage.dart' as firstpage;
import './secondpage.dart' as secondpage;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController tabcontroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabcontroller = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: new Text(
            'Tabs',
            style: new TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        backgroundColor: Colors.black87,
      ),
      bottomNavigationBar: new Material(
        color: Colors.black,
        child: new TabBar(
          controller: tabcontroller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.access_alarm)),
            new Tab(icon: new Icon(Icons.airport_shuttle))
          ],
        ),),
      body: new TabBarView(
        controller: tabcontroller,
        children: <Widget>[
          new firstpage.FirstPage(),
          new secondpage.SecondPage()
        ],
      )
    );
  }
}
