//TODO: Come back here to work on the type annotation.
class profileModel {
  final email;
  final username;
  final password;

  profileModel({
   this.email,
   this.username,
   this.password,
  });

  factory profileModel.fromMap(map) {
    return profileModel(
      email: map['email'],
      username: map['username'],
      password: map['password'],
    );
  }


}
