import 'package:flutter/material.dart';
import 'package:product_app/details.dart';
import 'package:product_app/models/track_model.dart';
import 'package:product_app/services/track_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xdiz Rock The World',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0)),
        useMaterial3: true,
      ),
      home: const TracksView(),
    );
  }
}

class TracksView extends StatelessWidget {
  const TracksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Top Tracks Xdinary Heroes',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color.fromARGB(255, 129, 123, 161),
      ),
      backgroundColor: Color.fromARGB(255, 82, 77, 105),
      body: FutureBuilder(
        future: getTracks().catchError((value) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(value.toString()),
              backgroundColor: const Color.fromARGB(255, 192, 13, 0),
            ),
          );
          return <Tracks>[];
        }),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            final tracks = snapshot.data!;
            return ListView.builder(
              itemCount: tracks.length,
              itemBuilder: (context, index) => ListTile(
                minVerticalPadding: 16,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                leading: Image.network(
                  tracks[index].album.coverSmall,
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
                title: Text(tracks[index].title, 
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(tracks[index].artist.name,
                  style: TextStyle(
                    color: Colors.white),
                ),
                trailing: Icon(Icons.more_vert, color: Colors.white,),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsView(track: tracks[index]), 
                      ),
                  );
                },
              ),
            );
          }
          return const SizedBox();
        }),
    );
  }
}
