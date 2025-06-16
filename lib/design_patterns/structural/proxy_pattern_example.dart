import 'package:flutter/material.dart';

abstract class AccessibleWidget extends StatelessWidget {
  Widget build(BuildContext context);
}

// Real Widget
class RestrictedContentWidget extends AccessibleWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Restricted Content', key: Key('restrictedContentKey'));
  }
}

// Proxy
class AccessControlProxyWidget extends AccessibleWidget {
  final AccessibleWidget protectedWidget;
  final bool hasAccess;
  AccessControlProxyWidget({
    required this.protectedWidget,
    required this.hasAccess,
  });

  @override
  Widget build(BuildContext context) {
    return hasAccess ? protectedWidget.build(context) : Text('Access Denied');
  }
}

bool checkUserAccess() {
  return true;
}

// Usage
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: AccessControlProxyWidget(protectedWidget: RestrictedContentWidget(), hasAccess: checkUserAccess()),
    ),
  ));
}