import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Halaman Profil',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
