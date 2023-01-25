class User {
  final String name;
  final String password;

  User({required this.name, required this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['password']= password;
    return data;
  }
}
