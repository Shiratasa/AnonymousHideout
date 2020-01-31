class UserModel {
  // Field
  String id, name, email, pass;

  // onstructor
  UserModel(this.id, this.name, this.email, this.pass);

  UserModel.parseJSON(Map<String, dynamic> parseJSON) {
    id = parseJSON['id'];
    name = parseJSON['name'];
    email = parseJSON['email'];
    pass = parseJSON['pass'];
  }
}
