import 'package:flutter/material.dart';
import 'package:memeapp/Modal%20class/imagemodal.dart';
import 'package:memeapp/Modal%20class/usermemeModal.dart';
import 'package:memeapp/apiconnection/imageapi.dart';
import 'package:memeapp/homepage.dart';
import 'package:memeapp/mainpage/page/detail_page.dart';
import 'package:memeapp/uploadmeme.dart';
httpServices13  http=httpServices13();
String key="";
class draft extends StatefulWidget
{
  draft({String email=""})
  {
    key=email;
  }
@override
draft1 createState()
{
  return draft1();
}
}
class draft1 extends State<draft>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<List<usermeme>>  
      (
      
        future: http.getAllPost1(key),
        builder: ((context, snapshot) {
       print("calm down");
      // print(key);  
        switch(snapshot.connectionState)
        {  
          case ConnectionState.none:
         
            return Scaffold(
              
              body: Center(
                heightFactor: 1.4,
                child:CircularProgressIndicator(
                )
              ),
            );
          case ConnectionState.waiting:
          return Scaffold(
            body: Center(
                heightFactor: 0.4,
                child:CircularProgressIndicator()
              ),
          );
          case ConnectionState.active:
           return
          //  CircularProgressIndicator();
           Show(context,snapshot.data!);
          
         case ConnectionState.done:
         
        // return CircularProgressIndicator();
           return Show(context,snapshot.data!);
          
        } 
          
        }),

      );

    
  }
  Show(BuildContext context,List<usermeme> posts)
  {
    return Scaffold(
      
      body:
      ListView( 
        children:[
          Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Here are your drafts',
            style: TextStyle(
              
              color: Colors.green,
              fontWeight: FontWeight.w500,
              fontSize: 28,
            ),
          )])),
      GridView.builder(
      itemCount: posts.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        mainAxisExtent: 260,
      ),
      itemBuilder: (context, index) {
         var prodImage="http://handycraf.000webhostapp.com/memeapp/fileupload1/"+posts[index].product1.toString();
        
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return homepage2(iss:prodImage,em: email,);
            }));
          },
          child: Container(
            height: 261,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(1),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Center(
                      child: ClipRRect(
                        //borderRadius: BorderRadius.circular(1),
                        child: Image.network(
                          prodImage,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
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
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        // children: [
                        //   Text(
                        //     food.cookingTime,
                        //     style: TextStyle(color: Colors.grey[600]),
                        //   ),
                        //   const Spacer(),
                        //   const Icon(Icons.star, color: Colors.amber, size: 18),
                        //   const SizedBox(width: 4),
                        //   Text(
                        //     food.rate.toString(),
                        //     style: TextStyle(color: Colors.grey[600]),
                        //   ),
                        // ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      // child: Text(
                      //   '\$${food.price}',
                      //   style: const TextStyle(
                      //     color: Colors.black,
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 20,
                  //       ),
                  //     ),
                  //   ),
                  // ],
                ),
                const Positioned(
                  top: 12,
                  right: 12,
                  child: Icon(Icons.favorite_border, color: Colors.grey),
                ),
                const Align(
                  //alignment: Alignment.bottomRight,
                  child: Material(
                    //color: Colors.green,
                    borderRadius: BorderRadius.only(
                    //  topLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    child: InkWell(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                       // child: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ));
      },
    )
    ]));
  }
  //Show(BuildContext context,)
}