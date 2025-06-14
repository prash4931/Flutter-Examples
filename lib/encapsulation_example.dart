import 'package:flutter/material.dart';

class Person {
  String? _firstName;
  String? _lastName;

  String get name => "$_firstName $_lastName";
}

class PersonHomePage extends StatefulWidget {
  const PersonHomePage({super.key});

  @override
  State<PersonHomePage> createState() => _PersonHomePageState();
}

// Private Class with an underscore.
class _PersonHomePageState extends State<PersonHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}