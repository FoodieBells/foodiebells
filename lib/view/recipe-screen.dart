import 'package:flutter/material.dart';
import '../model/recipe.dart';

class RecipeScreen extends StatefulWidget{
  final Recipe recipe;

  RecipeScreen({this.recipe});

  @override
  _RecipeScreenState createState() => new _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: new AppBar(
        title: Text(widget.recipe.title),
        backgroundColor: Colors.pink,
      ),
      body: Stack(
        children: <Widget>[
          new Image(
            image: new NetworkImage(
                widget.recipe.pic),
            height: deviceSize.height,
            width: deviceSize.width,
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.darken,
            color: Colors.black38,
          ),
          ListView(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  child: Image.network(widget.recipe.pic),
                  height: deviceSize.height / 4,
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white54),
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[Text(widget.recipe.title)],),

                  ],
                ),
              )


            ],
          ),
        ],
      ),
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
}
