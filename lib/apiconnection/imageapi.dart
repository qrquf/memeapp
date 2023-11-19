import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

//import '.dart';
import 'package:memeapp/Modal class/imagemodal.dart';
import 'package:memeapp/Modal%20class/usermemeModal.dart';

var dd;
var category = "Wall Painting";

class httpServices13 {
  var y = 0;
  final String baseUrl = "https://handy.ludokingatm.com/";
  final String baseUrl1 =
      "https://handy.ludokingatm.com/productshowapi1.php?category=";

  sid() {
    return y;
  }

  Future<List<prodModal>> getAllPost(String key) async {
    print("haan");
   // print(key);
    Response res = await get(Uri.parse(
        "http://handycraf.000webhostapp.com/memeapp/fetchimageapi.php?key=$key"));
    if (res.statusCode == 200) {
      //Map<String,dynamic> data1 = jsonDecode(res.body);

      List<dynamic> data = jsonDecode(res.body);
      List<prodModal> allPost =
          data.map((dynamic item) => prodModal.fromJson(item)).toList();
          print("gggg");
     //     print(allPost[6].product1.toString());
     y = allPost.length;
     print(y);
      return allPost;
    } else {
      throw "Something Went Wrong";
    }
  }

  Future<List<prodModal>> getAllPost3(var e) async {
    Response res = await get(
        Uri.parse("http://handy.ludokingatm.com/prodshowapi.php/?s_id=" + e));
    if (res.statusCode == 200) {
      //Map<String,dynamic> data1 = jsonDecode(res.body);

      List<dynamic> data = jsonDecode(res.body);
      List<prodModal> allPost =
          data.map((dynamic item) => prodModal.fromJson(item)).toList();
      print(allPost[0].category);
      y = allPost.length;
      return allPost;
    } else {
      throw "Something Went Wrong";
    }
  }

  Future<List<usermeme>> getAllPost1(var ss) async {
    Response res = await get(Uri.parse( "https://handycraf.000webhostapp.com/memeapp/fetchuser.php?key="+ss));
    if (res.statusCode == 200) {
      print(ss);
      List<dynamic> data = jsonDecode(res.body);
      List<usermeme> allPost =
          data.map((dynamic item) => usermeme.fromJson(item)).toList();
    
      y = allPost.length;
      print(allPost[0].name);
      return allPost;
    } else {
      throw "Something Went Wrong";
    }
  }

  Future deleterecord(String pid) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse("http://handy.ludokingatm.com/productdeleteapi.php"));
    request.fields.addAll({
      'id': pid,
    });
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final q = await response.stream.bytesToString();

      print(q);
      return 0;
    } else {
      print(response.reasonPhrase);
      final g = response.reasonPhrase;
      return 1;
    }
  }

  Future saverec(var email, var product1) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse("https://handycraf.000webhostapp.com/memeapp/usermeme.php"));

    var pic = await http.MultipartFile.fromPath("photos1", product1);
    
    request.files.add(pic);
  
    request.fields['email'] = email.toString();
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final q = await response.stream.bytesToString();

      print(q);
      return 0;
    } else {
      print(response.reasonPhrase);
      final g = response.reasonPhrase;
      return 1;
    }
  }

  Future saverec1(var name, String product1, var description, var category) async {
    print("kkk");
    print(sid);
    var request = http.MultipartRequest('POST',
        Uri.parse("http://handycraf.000webhostapp.com/memeapp/imageapi.php"));
    var pic = await http.MultipartFile.fromPath("photos1", product1);
    request.files.add(pic);

    
    request.fields['name'] = name;
    request.fields['description'] = description;
    request.fields['category'] = category;
    
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final q = await response.stream.bytesToString();

      print(q);
      return 0;
    } else {
      print(response.reasonPhrase);
      final g = response.reasonPhrase;
      return 1;
    }
  }
}
