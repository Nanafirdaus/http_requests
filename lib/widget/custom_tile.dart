import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTile extends StatelessWidget {
  String? title;
  Widget? screen;
  CustomTile({this.title, this.screen, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return screen!;
              },
            ),
          );
        },
        trailing: const Icon(Icons.arrow_forward_outlined),
        title: Text(title!),
      ),
    );
  }
}
