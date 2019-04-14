import 'package:flutter/material.dart';

class RecipeCard extends StatefulWidget{

  @override
  _RecipeCardState createState() => new _RecipeCardState();

}
class _RecipeCardState extends State<RecipeCard>{

  @override
  Widget build(BuildContext context) =>
      new Card(
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

}