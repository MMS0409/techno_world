import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../providers/profiles_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = context.watch<ProfileProvider>().currentUser;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: Center(
          child: Column(
            children: [
              ListTile(title: Text(user?.displayName ?? ''),),
              TextButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.yellow)
                  ),
                  onPressed: () {
                    context.read<AuthProvider>().logOutUser(context);
                  },
                  child: const Text("Log Out",style: TextStyle(color: Colors.black),)),
            ],
          ),
        ));
  }
}
