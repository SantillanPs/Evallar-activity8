import 'package:flutter/material.dart';

class SingersTab extends StatelessWidget {
  const SingersTab({super.key});

  final List<Map<String, String>> singers = const [
    {'name': 'Taylor Swift', 'email': 'taylor.swift@music.com'},
    {'name': 'Ed Sheeran', 'email': 'ed.sheeran@music.com'},
    {'name': 'Ariana Grande', 'email': 'ariana.grande@music.com'},
    {'name': 'Bruno Mars', 'email': 'bruno.mars@music.com'},
    {'name': 'Billie Eilish', 'email': 'billie.eilish@music.com'},
    {'name': 'The Weeknd', 'email': 'the.weeknd@music.com'},
    {'name': 'Adele', 'email': 'adele@music.com'},
    {'name': 'Drake', 'email': 'drake@music.com'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Singers', style: TextStyle(fontWeight: FontWeight.w300)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: singers.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final singer = singers[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            leading: CircleAvatar(
              backgroundColor: Colors.orange.shade100,
              foregroundColor: Colors.orange.shade900,
              child: Text(singer['name']![0]),
            ),
            title: Text(
              singer['name']!,
              style: const TextStyle(fontSize: 15),
            ),
            subtitle: Text(
              singer['email']!,
              style: const TextStyle(fontSize: 13),
            ),
            trailing: const Icon(Icons.chevron_right, size: 20),
          );
        },
      ),
    );
  }
}
