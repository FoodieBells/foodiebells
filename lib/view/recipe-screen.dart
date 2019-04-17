import 'package:flutter/material.dart';
import '../model/recipe.dart';

class RecipeScreen extends StatefulWidget{
  final Recipe recipe;

  RecipeScreen({this.recipe});

  @override
  _RecipeScreenState createState() => new _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: 0);
  }

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
      body: Column(
            mainAxisSize: MainAxisSize.max,
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
                    padding: const EdgeInsets.all(5.0),
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
              Expanded(
                flex: 1,
                child: new PageView(
                  children: <Widget>[
                    aboutSection(),
                    ingredientsSection(),
                    directionsSection()
                  ],
                  controller: _pageController,
                  onPageChanged: onPageChanged,
                ),
              ),


            ],
      ),
      bottomNavigationBar: bottomBar(),
    );
  }
  Widget bottomBar()=>Container(
    height: 40.0,
    child: BottomAppBar(
      color: Colors.pink,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline, color: _page==0?Colors.yellow:Colors.white),
            onPressed: ()=>_navigationTapped(0),
          ),
          IconButton(
            icon: Icon(Icons.format_list_numbered_rtl, color: _page==1?Colors.yellow:Colors.white),
            onPressed: ()=>_navigationTapped(1),
          ),
          IconButton(
            icon: Icon(Icons.local_convenience_store, color: _page==2?Colors.yellow:Colors.white),
              onPressed: ()=>_navigationTapped(2)
          ),
        ],
      ),
    ),
  );

  void onPageChanged(int page){
    setState((){
      this._page = page;
    });
  }

  Widget aboutSection()=>ListView(
    children: <Widget>[
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
                child: Text("${widget.recipe.prepTime} minutes",style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w500),),
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
  );

  Widget ingredientsSection()=> Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: Divider(color: Colors.black54,),
      ),
      Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Ingredients",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500,color: Colors.black),),
          ),
        ],
      ),
      Expanded(
        flex: 1,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.recipe.ingredients.length,
          itemBuilder: (context,index) => Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.check_circle,color: Colors.pink,),
                SizedBox(width: 10.0,),
                Container(
                    constraints:new BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width - 84),
                    child: Text(widget.recipe.ingredients[index],textAlign: TextAlign.justify,)
                )
              ],
            ),
          )
        ),
      ),

    ],
  );

  Widget directionsSection()=> Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: Divider(color: Colors.black54,),
      ),
      Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Directions",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500,color: Colors.black),),
          ),
        ],
      ),
      Expanded(
        flex: 1,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.recipe.directions.length,
            itemBuilder: (context,index) => Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("${index}",style:TextStyle(color: Colors.pink),),
                  SizedBox(width: 10.0,),
                  Container(
                      constraints:new BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width - 84),
                      child: Text(widget.recipe.directions[index],textAlign: TextAlign.justify,)
                  )
                ],
              ),
            )
        ),
      ),

    ],
  );

  void _navigationTapped(int page){
    _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease
    );
  }

}
