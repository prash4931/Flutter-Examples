import 'package:flutter/material.dart';

// Base Component
abstract class TextComponent {
  Widget build(BuildContext context);
}

// Concrete Component
class SimpleText extends TextComponent {
  SimpleText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}

// Decorator
abstract class TextDecorator extends TextComponent {
  final TextComponent decoratedText;

  TextDecorator(this.decoratedText);
}

// Concrete Decorator
class BorderText extends TextDecorator {
  BorderText(super.decoratedText);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: decoratedText.build(context),
    );
  }
}

class PaddingText extends TextDecorator {
  PaddingText(super.decoratedText);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: decoratedText.build(context),
    );
  }
}

class DecoratorMyApp extends StatelessWidget {
  const DecoratorMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextComponent text = SimpleText('Hello, World!');
    TextComponent borderedText = BorderText(text);
    TextComponent paddingText = PaddingText(text);

    return MaterialApp(
      home: Scaffold(body: Center(child: borderedText.build(context))),
    );
  }
}

void main() {
  runApp(DecoratorMyApp());
}