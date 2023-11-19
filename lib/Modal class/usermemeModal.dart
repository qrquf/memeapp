class usermeme {
  
  String? name;
  String? product1;

  usermeme(
      {
      this.name,
      this.product1,
      });

  usermeme.fromJson(Map<String, dynamic> json) {

    name = json['email'];
    product1 = json['address'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
  
    data['email'] = this.name;
    data['address'] = this.product1;
   
    return data;
  }
}
