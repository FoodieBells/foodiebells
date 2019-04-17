import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodiebells/model/recipe.dart';
import './view/recipe-card.dart';
import './view/recipe-screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodieBells',
      debugShowCheckedModeBanner: false,
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
  final GlobalKey<ScaffoldState> key = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: searchAppBar(),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Text("Featured Recipe",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),),
            ),
            new RecipeCard(new Size(200.0, 200.0), "Potato Samosa"),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 15.0),
              child: new Text("Categories",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),),
            ),
            new Container(
              color: Colors.white, height: 220.0,
              child: new ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: recipes.length,
                itemBuilder: (context, index) =>
                new Container(
                  padding: EdgeInsetsDirectional.only(start: 5.0, end: 5.0),
                  width: MediaQuery.of(context).size.width/3,
                  child: new FlatButton(
                      onPressed: ()=>_navigateToPost(context,recipes[index]),
                      padding: new EdgeInsets.only(top: 10.0),
                      child: new Column(
                        children: <Widget>[
                          new Image.network(
                              recipes[index].pic,
                              height: 100.0,
                              fit: BoxFit.fitWidth),
                          new Padding(
                              padding: new EdgeInsets.only(bottom: 4.0)),
                          new Text(recipes[index].title, textAlign: TextAlign.center,
                              style: new TextStyle(
                                  color: Colors.black, fontSize: 13.0)),
                          new Padding(
                              padding: new EdgeInsets.only(bottom: 4.0)),
                          new Text(recipes[index].cookTime, textAlign: TextAlign.center,
                              style: new TextStyle(
                                  color: Colors.green, fontSize: 13.0)),
                        ],
                      )
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      drawer: _drawer(),
    );
  }


  Widget searchAppBar() {
    return new AppBar(
      backgroundColor: Colors.pink,
      leading: IconButton(icon: Image.network("https://avatars0.githubusercontent.com/u/46907556?s=200&v=4",color: Colors.white,),onPressed: ()=>key.currentState.openDrawer()),
      title: GestureDetector(
        onTap: () {
          setState(() {
            _showSearch = true;
          });
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 15.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
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

  void _navigateToPost(BuildContext context, Recipe recipe) {
    Navigator.of(context).push(
      PageRouteBuilder<RecipeScreen>(
        pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            ) {
          return RecipeScreen(recipe: recipe);
        },
        transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
            ) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  Widget _drawer(){
    return new Drawer(
      elevation: 2.0,
      child: Container(
        decoration: BoxDecoration(color:Colors.pink),
        child: new ListView(
          children: <Widget>[
            Container(
                decoration:BoxDecoration(color: Colors.pink),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.network("https://raw.githubusercontent.com/FoodieBells/foodiebells.github.io/master/img/logo2.png",color: Colors.white,),
                )
            ),//UserAccount drawer header parent box
            new Divider(
                height: defaultTargetPlatform == TargetPlatform.iOS ? 5.0 : 0.0,
                color: defaultTargetPlatform == TargetPlatform.iOS
                    ? Colors.grey
                    : Colors.white), //
            new ListTile(
              title: new Text('Offer Zone',style: TextStyle(color: Colors.white),),
              leading: new Icon(Icons.local_offer,color: Colors.white),
            ), //List Tile 5
            new ListTile(
              title: new Text('My Cart',style: TextStyle(color: Colors.white),),
              leading: new Icon(Icons.shopping_cart,color: Colors.white),
              onTap: (){},
            ), //List Tile 6
            new ListTile(
              title: new Text('My Wishlist',style: TextStyle(color: Colors.white),),
              leading: new Icon(Icons.favorite,color: Colors.white),
            ),
            new AboutListTile(
              applicationIcon: Image.network("https://avatars0.githubusercontent.com/u/46907556?s=200&v=4",color: Colors.pink,width: MediaQuery.of(context).size.width/3,),
              icon: Icon(Icons.info,color: Colors.white,),
              aboutBoxChildren: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Developed By Pranav Kapoor",
                    style: TextStyle(color: Colors.white),),
                Text(
                  "pranavkapoorr",style: TextStyle(color: Colors.white)
                ),
              ],
              applicationName: "Foodie Bells",
              applicationVersion: "1.0.0",
              applicationLegalese: "Apache License 2.0",
              child: Text("About",style: TextStyle(color: Colors.white)),

            )
          ],
        ),
      ), //parent ListView
    );
  }
}
