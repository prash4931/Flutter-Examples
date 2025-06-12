class SingleTon {
  // Private named constructor
  SingleTon._internal();

  static final SingleTon instance = SingleTon._internal();

  factory SingleTon() => instance; // Factory Constructor
}
