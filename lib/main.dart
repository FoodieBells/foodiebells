import 'package:flutter/material.dart';
import './recipe-card.dart';

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
  FocusNode _focus = new FocusNode();
  TextEditingController _searchController;
  bool _showSearch = false;
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: searchAppBar(),
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

  Widget searchAppBar(){
    return new AppBar(
      backgroundColor: Colors.pink,
      leading: IconButton(
        icon: Icon(Icons.settings),
        //color: Colors.black,
        onPressed: () {
         },
      ),
      title: GestureDetector(
        onTap: (){
          setState(() {
            _showSearch = true;
          });
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical:15.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0),
            child: TextFormField(
              controller: _searchController,
              decoration: InputDecoration.collapsed(hintText: "Search"),
              focusNode: _focus,
            ),
          ),
        ),
      ),
    );
  }

  final recipeBody = Container(
    child: ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Text("Featured Recipe",style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w500),),
        ),
        new RecipeCard(new Size(200.0,200.0),"Potato Samosa"),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Text("Categories",style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w500),),
        ),
        Container(
          height: 150.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: <Widget>[
              new RecipeCard(new Size(100.0,100.0)),
              new RecipeCard(new Size(100.0,100.0)),
              new RecipeCard(new Size(100.0,100.0)),
              new RecipeCard(new Size(100.0,100.0)),
              new RecipeCard(new Size(100.0,100.0)),
            ],
          ),
        )
      ],
    ),
  );
}

