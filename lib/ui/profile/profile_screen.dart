import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: Center(
          child: TextButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.yellow)
              ),
              onPressed: () {
                context.read<AuthProvider>().logOut(context);
              },
              child: const Text("Log Out",style: TextStyle(color: Colors.black),)),
        ));
  }
}
