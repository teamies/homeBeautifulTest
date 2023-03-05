import 'package:flutter/material.dart';
import 'package:home_beautiful2/components/mytext.dart';
import 'package:home_beautiful2/components/notification.dart';
import 'package:home_beautiful2/models/myCart.dart';
import 'package:home_beautiful2/models/product.dart';
import 'package:home_beautiful2/screens/my_cart.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import '../components/titleBar.dart';
import '../models/favorites.dart';

class product_favorites extends StatefulWidget {
  const product_favorites({Key? key}) : super(key: key);

  @override
  State<product_favorites> createState() => _product_favoritesState();
}

class _product_favoritesState extends State<product_favorites> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
            child: Column(
              children: [
               titleBar('Favorites'),
                Expanded(
                    child: ListView.builder(
                      itemCount: listFavorites.length,
                      itemBuilder: (context, index){
                        final item = listFavorites[index];
                       return productFavorites(item, index);

                      },
                    )),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                      onPressed: (){
                      setState(() {
                        for(int i=0;i<listFavorites.length;i++){
                          final item = listFavorites[i];
                          List<myCart> list = [myCart(item.image, item.title, item.price, item.quantity)];
                          listMyCart.addAll(list);
                        }
                      });
                      notification.onAdd(context);
                      //Navigator.push(context, SwipeablePageRoute(builder: (context) => my_cart()));
                      },
                      child: const Text('Add all to my cart')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget productFavorites(final item, int index){
    return Padding(
      padding:  EdgeInsets.only(bottom: 19),
      child: Column(
        children: [
          Container(
            height:100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset(item.image,width: 100, height: 100, fit: BoxFit.cover,))),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left:15, top: 4),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText.baseText(text:item.title),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: MyText.baseText(text: '\$ ${item.price}\0', fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: (){
                          setState(() {
                            listFavorites.removeAt(index);
                            notification.onDelete(context);
                          });
                        },
                        child:
                        Icon(Icons.cancel_outlined)),

                    GestureDetector(
                      onTap: (){
                        setState(() {
                          List<myCart>  list= [myCart(item.image, item.title, item.price, 1)];
                          listMyCart.addAll(list);
                          notification.onAdd(context);
                        });
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color(0xffE0E0E0),
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: Center(
                          child: Icon(Icons.shopping_bag),
                        ),
                      ),
                    ),


                  ],
                )
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 19),
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey
                      )
                  )
              ),
            ),
          )
        ],
      ),
    );

  }

}

