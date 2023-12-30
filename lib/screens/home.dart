import 'package:flutter/material.dart';
import 'package:http_requests/screens/album_screen.dart';
import 'package:http_requests/screens/post_screen.dart';
import 'package:http_requests/widget/custom_tile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Http Request playground",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
        elevation: 2,
        shadowColor: Colors.black,
      ),
      body: ListView(
        children: [
          CustomTile(
            title: "Post",
            screen: const PostScreen(),
          ),
          CustomTile(
            title: "Album",
            screen: const AlbumScreen(),
          ),
        ],
      ),
    );
  }
}
