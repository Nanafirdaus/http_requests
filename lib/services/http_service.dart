import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:http_requests/models/album.dart';
import 'package:http_requests/models/todo.dart';

import '../models/post.dart';

class HttpService {
  static String url = "https://jsonplaceholder.typicode.com/posts/1";
  static String url2 = "https://jsonplaceholder.typicode.com/albums/1";
  static String url3 = "https://jsonplaceholder.typicode.com/todos";

  static Future<Post?> fetchPost() async {
    Uri uri = Uri.parse(url);
    try {
      Response response = await get(uri);
      Map<String, dynamic> body = jsonDecode(response.body);
      return Post.fromJson(body);
    } catch (e) {
      log("An exception occured: $e");
    }
    return null;
  }

  static Future<Album?> fetchAlbum() async {
    Uri uri = Uri.parse(url2);
    try {
      Response response = await get(uri);
      Map<String, dynamic> body = jsonDecode(response.body);
      return Album.fromJson(body);
    } catch (e) {
      log("An exception occured: $e");
    }
    return null;
  }

  static Future<List<Todo>?> fetchTodos() async {
    Uri uri = Uri.parse(url3);
    try {
      Response response = await get(uri);
      List<dynamic> result = jsonDecode(response.body);
      List<Todo> todos = result.map((e) => Todo.fromJson(e)).toList();
      return todos;
    } catch (e) {
      log("An exception occured: $e");
    }
    return null;
  }
}
