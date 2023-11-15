class User{
  String? user_name;
  String? user_email;
  String? pass;
  String? phone;
  User(this.user_name,this.user_email,this.pass)
  {

  }
  Map<String,dynamic> toJson() =>
  {
    'name':user_name.toString(),
    'emailid':user_email.toString(),
    'password':pass.toString(),
      
  };
  Map<String,dynamic> fromJson(item) =>
  {
    user_name.toString():'name',

    user_email.toString():'emailid',
    pass.toString():'password',
      
  };
}