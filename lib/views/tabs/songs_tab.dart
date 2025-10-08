import 'package:flutter/material.dart';

class SongsTab extends StatelessWidget {
  const SongsTab({super.key});

  final List<Map<String, String>> songs = const [
    {'name': 'Shape of You', 'singer': 'Ed Sheeran'},
    {'name': 'Blinding Lights', 'singer': 'The Weeknd'},
    {'name': 'Anti-Hero', 'singer': 'Taylor Swift'},
    {'name': 'Flowers', 'singer': 'Miley Cyrus'},
    {'name': 'As It Was', 'singer': 'Harry Styles'},
    {'name': 'Levitating', 'singer': 'Dua Lipa'},
    {'name': 'Bad Guy', 'singer': 'Billie Eilish'},
    {'name': 'Uptown Funk', 'singer': 'Bruno Mars'},
    {'name': 'Someone Like You', 'singer': 'Adele'},
    {'name': 'thank u, next', 'singer': 'Ariana Grande'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Songs', style: TextStyle(fontWeight: FontWeight.w300)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: songs.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final song = songs[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.music_note, color: Colors.orange),
            ),
            title: Text(
              song['name']!,
              style: const TextStyle(fontSize: 15),
            ),
            subtitle: Text(
              song['singer']!,
              style: const TextStyle(fontSize: 13),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.play_circle_outline, size: 28),
              color: Colors.orange,
              onPressed: () {},
            ),
          );
        },
      ),
    );
  }
}
