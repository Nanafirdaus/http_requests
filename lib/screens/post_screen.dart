import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/http_service.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late Future<Post?> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = HttpService.fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post service"),
      ),
      body: FutureBuilder(
        future: futurePost,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasData) {
              Post? post = snapshot.data;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('User ID: ${post!.userId!}'),
                  Text('Post ID ${post.id}'),
                  Text("Post title${post.title!}"),
                  Text("Post body${post.body!}"),
                ],
              );
            } else {
              return const Center(
                child: Text("No data"),
              );
            }
          }
        },
      ),
    );
  }
}
