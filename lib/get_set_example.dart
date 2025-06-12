class User {
  String? _email;

  String get email => _email ?? '';

  set email(String value) {
    if (value.contains('@')) {
      _email = value;
    }
  }
}