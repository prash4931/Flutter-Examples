import 'package:flutter/material.dart';

// Abstract class for all menu items (leaf and composite)
abstract interface class MenuItem implements Widget {
  // All submenu should open onTap
  void expand(bool expanded);
}

// Leaf Node
class SimpleMenuItem extends StatelessWidget implements MenuItem {
  final Function() action;
  final String title;

  const SimpleMenuItem({super.key, required this.action, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(title), onTap: action);
  }

  @override
  void expand(bool expanded) {
    // TODO: implement expand
  }
}

// Composite node that contain other menu items
class SubMenu extends StatefulWidget implements MenuItem {
  final String title;
  final bool expandAll;
  final List<MenuItem> children;

  SubMenu({
    super.key,
    required this.title,
    this.expandAll = false,
    required this.children,
  });

  @override
  State<SubMenu> createState() => _SubMenuState();

  bool childrenExpanded = false;

  @override
  void expand(bool expanded) {
    childrenExpanded = expanded;
    for (final child in children) {
      child.expand(expanded);
    }
  }
}

class _SubMenuState extends State<SubMenu> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.title),
      initiallyExpanded: widget.childrenExpanded,
      onExpansionChanged: widget.expandAll ? widget.expand : null,
      children: widget.children,
    );
  }
}

// Usage
class MenuApp extends StatelessWidget {
  const MenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SimpleMenuItem(action: () => debugPrint('Edit'), title: 'Edit'),
          SubMenu(
            title: 'File',
            children: [
              SimpleMenuItem(action: () => debugPrint("New File"), title: 'New'),
              SubMenu(
                title: 'Recent Files',
                children: [
                  SimpleMenuItem(
                    action: () => debugPrint("Open File1.txt"),
                    title: "File1.txt",
                  ),
                  SubMenu(
                    title: 'SubMenu in submenu',
                    children: [
                      SimpleMenuItem(
                        action: () => debugPrint("New File"),
                        title: "New",
                      ),
                      SubMenu(
                        title: 'Archive',
                        children: [
                          SimpleMenuItem(
                            action: () => debugPrint('file.zip'),
                            title: "file.zip",
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: MenuApp()));
}
