class prodModal {
  
  String? name;
  String? product1;
  String? category;
  String? description;
  prodModal(
      {
      this.name,
      this.product1,
      this.description,
      this.category});

  prodModal.fromJson(Map<String, dynamic> json) {

    name = json['name'];
    product1 = json['product1'];
   description=json['description'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
  
    data['name'] = this.name;
    data['product1'] = this.product1;
    data['category'] = this.category;
    data['description']=this.description;
    return data;
  }
}
