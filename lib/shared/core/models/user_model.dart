class UserModel {
  String name = '';
  String email = '';
  String token = '';
  String pic = '';

  setUser(name, email, token, pic) {
    this.name = name;
    this.email = email;
    this.token = token;
    this.pic = pic;
  }
}
