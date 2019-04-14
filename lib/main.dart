import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodieBells',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: appBar,
      body: recipeBody,
      bottomNavigationBar: bottombar,
    );
  }

  final bottombar = Container(
    height: 55.0,
    child: BottomAppBar(
      color: Colors.pink,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.blur_on, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.hotel, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_box, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
    ),
  );
  
  final appBar = AppBar(
    backgroundColor: Colors.pink,
    title: Text("Foodie Bells"),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.list),
        onPressed: () {},
      )
    ],
  );

  final recipeBody = Container(
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: new Column(
            children: <Widget>[
              new Image.network('https://foodiebells.com/img/recipes/potato-samosas/samosa.jpg'),
              new Padding(
                  padding: new EdgeInsets.all(7.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        decoration: new BoxDecoration(
                            color: Colors.pink,
                            gradient: new LinearGradient(
                                colors: [Colors.white30, Colors.pink],
                                begin: Alignment.centerRight,
                                end: new Alignment(0.7, 0.0),
                                tileMode: TileMode.clamp
                            ),
                        ),
                        child: new Padding(
                          padding: new EdgeInsets.all(10.0),
                          child: new Text("Potato Samosa ",style: new TextStyle(color: Colors.white),),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  )
              )
            ],
          ),
        );
      },
    ),
  );
}

