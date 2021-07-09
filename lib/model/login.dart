class User {
  //int id;
  String email;
  String password;

  User(
      {
        //this.id,
      this.email,
      this.password});

  factory User.fromDatabaseJson(Map<String, dynamic> data) => User(
      //id: data['id'],
      email: data['email'],
      password: data['password'],
  );

  Map<String, dynamic> toDatabaseJson() => {
        //"id": this.id,
        "email": this.email,
        "password": this.password
      };
}