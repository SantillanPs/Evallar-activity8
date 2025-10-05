import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeTab(),
    const SingersTab(),
    const SongsTab(),
    const AccountTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black45,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        elevation: 8,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Singers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music_outlined),
            activeIcon: Icon(Icons.library_music),
            label: 'Songs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(fontWeight: FontWeight.w300)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text('🏠', style: TextStyle(fontSize: 56)),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w200,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingersTab extends StatelessWidget {
  const SingersTab({Key? key}) : super(key: key);

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

class SongsTab extends StatelessWidget {
  const SongsTab({Key? key}) : super(key: key);

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

class AccountTab extends StatefulWidget {
  const AccountTab({Key? key}) : super(key: key);

  @override
  State<AccountTab> createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  final user = FirebaseAuth.instance.currentUser;

  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false,
      );
    }
  }

  Future<void> _editUser(String docId, Map<String, dynamic> userData) async {
    final TextEditingController emailController = TextEditingController(text: userData['email'] ?? '');
    final TextEditingController firstNameController = TextEditingController(text: userData['firstName'] ?? '');
    final TextEditingController lastNameController = TextEditingController(text: userData['lastName'] ?? '');
    final TextEditingController ageController = TextEditingController(text: userData['age'] ?? '');
    
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit User'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: UnderlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    border: UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    border: UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: ageController,
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    border: UnderlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                if (emailController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Email cannot be empty')),
                  );
                  return;
                }
                
                try {
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(docId)
                      .update({
                    'email': emailController.text.trim(),
                    'firstName': firstNameController.text.trim(),
                    'lastName': lastNameController.text.trim(),
                    'age': ageController.text.trim(),
                  });
                  
                  if (context.mounted) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('User updated successfully')),
                    );
                  }
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: $e')),
                    );
                  }
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteUser(String docId, String email, String uid) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete User'),
          content: Text('Are you sure you want to delete $email?\n\nNote: This will only remove the user from Firestore. The Firebase Authentication account will remain.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                try {
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(docId)
                      .delete();
                  
                  if (uid == user?.uid) {
                    await FirebaseAuth.instance.signOut();
                    if (context.mounted) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                        (route) => false,
                      );
                    }
                  } else {
                    if (context.mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('User deleted successfully')),
                      );
                    }
                  }
                } catch (e) {
                  if (context.mounted) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: $e')),
                    );
                  }
                }
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(fontWeight: FontWeight.w300)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black87,
        actions: [
          TextButton.icon(
            onPressed: () => _logout(context),
            icon: const Icon(Icons.logout, size: 18),
            label: const Text('Logout'),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  border: Border.all(color: Colors.orange.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Current User',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      user?.email ?? 'No email',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'ALL USERS',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 16),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .orderBy('createdAt', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(32.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('No users found'),
                    );
                  }

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    separatorBuilder: (context, index) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      var doc = snapshot.data!.docs[index];
                      var userData = doc.data() as Map<String, dynamic>;
                      String email = userData['email'] ?? 'No email';
                      String firstName = userData['firstName'] ?? '';
                      String lastName = userData['lastName'] ?? '';
                      String age = userData['age'] ?? '';
                      String uid = userData['uid'] ?? '';
                      
                      bool isCurrentUser = uid == user?.uid;
                      
                      String displayName = '';
                      if (firstName.isNotEmpty || lastName.isNotEmpty) {
                        displayName = '$firstName $lastName'.trim();
                      }
                      
                      return Container(
                        color: isCurrentUser ? Colors.orange.shade50 : Colors.white,
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          title: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      email,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    if (displayName.isNotEmpty)
                                      Text(
                                        displayName,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    if (age.isNotEmpty)
                                      Text(
                                        'Age: $age',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              if (isCurrentUser)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: const Text(
                                    'YOU',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit, size: 18),
                                onPressed: () => _editUser(doc.id, userData),
                                tooltip: 'Edit',
                                color: Colors.black54,
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, size: 18),
                                onPressed: () => _deleteUser(doc.id, email, uid),
                                tooltip: 'Delete',
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}