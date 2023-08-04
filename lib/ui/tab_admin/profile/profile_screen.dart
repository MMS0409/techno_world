import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';
import '../../../providers/profiles_provider.dart';
import '../../../utils/ui_utils/shimmer_photo.dart';
import '../../route/route_names.dart';

class ProfileScreenAdmin extends StatelessWidget {
  const ProfileScreenAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = context.watch<ProfileProvider>().currentUser;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile admin'),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              user!.photoURL==null? Icon(
                Icons.account_circle,
                size: 96.h,
              ):
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: SizedBox(
                  height: 160.h,
                  width: 150.w,
                  child: GestureDetector(
                    onTap: (){
                      if(user.photoURL!=null){
                        Navigator.pushNamed(context, RouteNames.showPhoto,arguments: user.photoURL);
                      }
                    },
                    child:Hero(
                      tag: 'image',
                      child: CachedNetworkImage(
                          imageUrl: user.photoURL ?? '',
                          placeholder: (context, url) => const ShimmerPhoto(),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error,
                              color: Colors.red),
                          width: 140.w,
                          fit: BoxFit.cover),
                    ),
                  ),),),
              SizedBox(height: 20.h,),
              Center(
                child: Text(user.displayName ?? '',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
              ),
              Center(
                child: Text(user.email ?? '',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.editProfile);
                },
                title: const Text(
                  "Edit Profile",
                  style: TextStyle(color: Colors.black),
                ),
                trailing: const Icon(Icons.edit),
              ),
              ListTile(
                onTap: () {
                  context.read<AuthProvider>().logOutUser(context);
                },
                title: const Text(
                  "Log Out",
                  style: TextStyle(color: Colors.red),
                ),
                trailing: const Icon(Icons.exit_to_app_outlined,color: Colors.red,),
              ),
            ],
          ),
        ));
  }
}
