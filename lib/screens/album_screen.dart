import 'package:flutter/material.dart';
import 'package:http_requests/models/album.dart';
import 'package:http_requests/services/http_service.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  late Future<Album?> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = HttpService.fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        shadowColor: Colors.black,
        title: const Text(
          "Album Service",
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.grey[200],
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasData) {
              Album? album = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "User Id: ${album!.userId!}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Id: ${album.id!}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Title: ${album.title}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
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
