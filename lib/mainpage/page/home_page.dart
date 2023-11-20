import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:memeapp/Modal%20class/imagemodal.dart';
import 'package:memeapp/apiconnection/imageapi.dart';
import 'package:memeapp/draft.dart';
import 'package:memeapp/homepage.dart';
import 'package:memeapp/mainpage/model/food.dart';
import 'package:memeapp/mainpage/page/detail_page.dart';
import 'package:memeapp/uploadmeme.dart';

httpServices13 http = httpServices13();
int indexCategory = 0;
String key = "", email = "";

class HomePage extends StatefulWidget {
  HomePage({String id = "", String email1 = ""}) {
    key = id;
    email = email1;
  }

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  void init() {
    super.initState();
  }

  int indexCategory = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<prodModal>>(
      future: http.getAllPost(key),
      builder: ((context, snapshot) {
        print("calm down");
        // print(key);
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Scaffold(
              body:
                  Center(heightFactor: 1.4, child: CircularProgressIndicator()),
            );
          case ConnectionState.waiting:
            return Scaffold(
              body:
                  Center(heightFactor: 0.4, child: CircularProgressIndicator()),
            );
          case ConnectionState.active:
            return ShowPostList(context, snapshot.data!);

          case ConnectionState.done:

            //return CircularProgressIndicator();
            return ShowPostList(context, snapshot.data!);
        }
        //}

        //else{
        //return CircularProgressIndicator();
        //}

        //  return CircularProgressIndicator();
      }),
    );
  }

  Widget ShowPostList(BuildContext context, List<prodModal> posts) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color.fromARGB(255, 36, 36, 36),
          appBar: AppBar(
            backgroundColor: Colors.black,
          ),
          // drawer: Drawer(
          //     child: ListView(children: <Widget>[
          //   ListTile(
          //     leading: Icon(Icons.create),
          //     title: const Text("make your own meme"),
          //     onTap: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => HomePage()),
          //       );
          //     },
          //   ),
          //   ListTile(
          //       leading: Icon(Icons.upload),
          //       title: Text("upload a meme"),
          //       onTap: () {})
          // ])),
          // floatingActionButton: IconButton(
          //     color: Colors.blue,
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => homepage2(),
          //         ),
          //       );
          //     },
          //     icon: Icon(Icons.add)),
          // backgroundColor: Colors.white,
          //  bottomNavigationBar: BottomNavigationBar(
          //  type: BottomNavigationBarType.fixed,
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          // selectedItemColor: Colors.green,
          // unselectedItemColor: Colors.green[200],
          // items: const [
          // BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          //BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          //  icon: Icon(Icons.shopping_cart), label: 'Cart'),
          // BottomNavigationBarItem(
          //icon: Icon(Icons.notifications), label: 'Notification'),
          //   BottomNavigationBarItem(
          //         icon: Icon(Icons.favorite), label: 'Favorite'),
          // ],
          //),
          body: ListView(
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Chip(
                          label: InkWell(
                            child: Text("Create your own meme"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      homepage2(em: email, iss: ""),
                                ),
                              );
                              //homepage2();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Chip(
                            label: InkWell(
                          child: Text("upload your Meme"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => uploadmeme(),
                              ),
                            );
                          },
                        )),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                      ],
                    )),
              ),
              //    header(),
              const SizedBox(height: 30),
              title(),
              const SizedBox(height: 20),
              search(context),
              const SizedBox(height: 30),
              categories(context),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(20),
                child: gridFood(context, posts),
              )
            ],
          ),
        ));
  }

  // Widget header() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 16),
  //     child: Row(
  //       children: [
  //         Material(
  //           color: Colors.grey[300],
  //           borderRadius: BorderRadius.circular(8),
  //           child: InkWell(
  //             onTap: () {},
  //             borderRadius: BorderRadius.circular(8),
  //             child: Container(
  //               height: 40,
  //               width: 40,
  //               alignment: Alignment.center,
  //               child: const Icon(Icons.menu, color: Colors.black),
  //             ),
  //           ),
  //         ),
  //         const Spacer(),
  //         // const Icon(Icons.location_on, color: Colors.green, size: 18),
  //         //  const Text('Garut, Indonesia'),
  //         const Spacer(),
  //         ClipRRect(
  //           borderRadius: BorderRadius.circular(8),
  //           child: Image.network(
  //             'https://us.123rf.com/450wm/hijackhippo/hijackhippo1810/hijackhippo181000034/109723477-letter-tiles-on-black-slate-background-spelling-memes.jpg?ver=6',
  //             fit: BoxFit.cover,
  //             width: 40,
  //             height: 40,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget title() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   'Hi User',
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontWeight: FontWeight.w500,
          //     fontSize: 18,
          //   ),
          // ),
          Text(
            'Find your Meme',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }

  Widget search(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.fromLTRB(8, 2, 6, 2),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 251, 251, 251),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                key = value;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(Icons.arrow_circle_right_rounded),
                  onPressed: () {
                    setState(() {});
                  },
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.redAccent),
                hintText: 'Search Meme',
                hintStyle: TextStyle(color: Color.fromARGB(255, 75, 75, 75)),
              ),
            ),
          ),
          Material(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  // width: 50,
                  // height: 50,
                  //  alignment: Alignment.center,
                  // child: const Icon(Icons.bar_chart, color: Colors.white),
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget categories(BuildContext context) {
    List list = [
      'Trending',
      'comedy',
      'Movie',
      'Animal',
      'Anime',
      'Ads',
      'Personality',
      'sarcasm'
    ];
    return SizedBox(
      height: 30,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                key = list[index];
              });
              indexCategory = index;
              (() {});
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(
                index == 0 ? 16 : 16,
                0,
                index == list.length - 1 ? 16 : 16,
                0,
              ),
              alignment: Alignment.center,
              child: Text(
                list[index],
                style: TextStyle(
                  fontSize: 22,
                  color: indexCategory == index ? Colors.green : Colors.grey,
                  fontWeight: indexCategory == index ? FontWeight.bold : null,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget gridFood(BuildContext context, List<prodModal> posts) {
    return GridView.builder(
      itemCount: posts.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 18,
        crossAxisSpacing: 18,
        mainAxisExtent: 212,
      ),
      itemBuilder: (context, index) {
        var prodImage =
            "http://handycraf.000webhostapp.com/memeapp/fileupload1/" +
                posts[index].product1.toString();

        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPage(
                  name: posts[index].name,
                  description: posts[index].description,
                  img: prodImage,
                );
              }));
            },
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(1),
              ),
              child: Stack(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6),
                    Center(
                      child: ClipRRect(
                        //borderRadius: BorderRadius.circular(1),
                        child: Image.network(
                          prodImage,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // const SizedBox(height: 30),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16),
                    //   child: Text(
                    //     food.name,
                    //     style: Theme.of(context).textTheme.headline6,
                    //     textAlign: TextAlign.center,
                    //     maxLines: 1,
                    //     overflow: TextOverflow.ellipsis,
                    //   ),
                    // ),
                    //   const SizedBox(height: 40),
                    //   Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 16),
                    //     child: Row(
                    //         // children: [
                    //         //   Text(
                    //         //     food.cookingTime,
                    //         //     style: TextStyle(color: Colors.grey[600]),
                    //         //   ),
                    //         //   const Spacer(),
                    //         //   const Icon(Icons.star, color: Colors.amber, size: 18),
                    //         //   const SizedBox(width: 4),
                    //         //   Text(
                    //         //     food.rate.toString(),
                    //         //     style: TextStyle(color: Colors.grey[600]),
                    //         //   ),
                    //         // ],
                    //         ),
                    //   ),
                    //   Padding(
                    //     padding: const EdgeInsets.all(16),
                    //     // child: Text(
                    //     //   '\$${food.price}',
                    //     //   style: const TextStyle(
                    //     //     color: Colors.black,
                    //     //     fontWeight: FontWeight.bold,
                    //     //     fontSize: 20,
                    //     //       ),
                    //     //     ),
                    //     //   ),
                    //     // ],
                    //   ),
                    //   // const Positioned(
                    //   //   top: 12,
                    //   //   right: 12,
                    //   //   child: Icon(Icons.favorite_border, color: Colors.grey),
                    //   // ),
                    //   // const Align(
                    //   //   //alignment: Alignment.bottomRight,
                    //   //   child: Material(
                    //   //     //color: Colors.green,
                    //   //     borderRadius: BorderRadius.only(
                    //   //       //  topLeft: Radius.circular(16),
                    //   //       bottomRight: Radius.circular(16),
                    //   //     ),
                    //   //     child: InkWell(
                    //   //       child: Padding(
                    //   //         padding: EdgeInsets.all(8),
                    //   //         // child: Icon(Icons.add, color: Colors.white),
                    //   //       ),
                    //   //     ),
                    //   //   ),
                    //   // ),
                  ],
                ),
              ]),
            ));
      },
    );
  }
}
