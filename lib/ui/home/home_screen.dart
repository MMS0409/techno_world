import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text("User Authenticated",style: TextStyle(color: Colors.white),),
              ),
              TextButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.yellow)
                ),
                  onPressed: () {
                    context.read<AuthProvider>().logOut(context);
                  },
                  child: const Text("Log Out",style: TextStyle(color: Colors.black),))
            ],
          ),
        ));
  }
}
