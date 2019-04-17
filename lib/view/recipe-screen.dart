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
      body: ListView(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  child: Image.network(widget.recipe.pic),
                  height: deviceSize.height / 4,
                ),
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[
                  Text(widget.recipe.title,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w500),)
                ],
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.recipe.timestamp,style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500,color: Colors.grey),),
                  )
                ],
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[
                 Icon(Icons.star,color: Colors.yellow.shade700,),Icon(Icons.star,color: Colors.yellow.shade700,),Icon(Icons.star,color: Colors.yellow.shade700,),Icon(Icons.star,color: Colors.yellow.shade700,),Icon(Icons.star,color: Colors.yellow.shade700,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Divider(color: Colors.black54,),
              ),
              Padding(
                padding: const EdgeInsets.only(left:10.0,right:10.0,top: 4.0,bottom:4.0),
                child: Text(widget.recipe.description,style:TextStyle(fontSize: 15.0),textAlign: TextAlign.justify,),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Divider(color: Colors.black54,),
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.local_dining,color: Colors.pink,),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("${widget.recipe.prepTime} minutes",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500),),
                      ),
                      Text("Preparation",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500,color: Colors.grey),),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.room_service,color: Colors.pink,),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("${widget.recipe.cookTime} minutes",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500),),
                      ),
                      Text("Cooking",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500,color: Colors.grey),),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Divider(color: Colors.black54,),
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Main Ingredients: ",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500,color: Colors.black),),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.recipe.genericIngredients,style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500,color: Colors.grey),),
                  ),
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
            icon: Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.format_list_numbered_rtl, color: Colors.white),
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
