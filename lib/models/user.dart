class User {
  int _id;
  String _name;
  String _email;
  String _password;
  double _latitude;
  double _longitude;
  String _photo;

  String get password => password;

  Map<String, dynamic> toMap() {
    return {'name': _name, 'email': _email, 'password': _password, 'latitude': _latitude, 'longitude': _longitude, 'photo': _photo}
  }
}