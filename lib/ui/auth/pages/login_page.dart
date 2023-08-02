import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:techno_world/ui/auth/widgets/loginWith.dart';
import 'package:techno_world/utils/images/app_images.dart';
import '../../../providers/auth_provider.dart';
import '../widgets/global_button.dart';
import '../widgets/global_text_fields.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.onChanged});

  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 6),
              GlobalTextField(
                  hintText: "Email",
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.start,
                  controller: context.read<AuthProvider>().emailController, maxlines: 1,),
              SizedBox(height: 24.h),
              GlobalTextField(
                hintText: "Password",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                textAlign: TextAlign.start,
                obscureText: true,
                controller: context.read<AuthProvider>().passwordController, maxlines: 1,
              ),
              SizedBox(height: 24.h),
              GlobalButton(
                  title: "Log In",
                  onTap: () {
                    context.read<AuthProvider>().logInUser(context);
                  }),
              SizedBox(height: 30.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LoginWith(title: 'Google', image: AppImages.google, voidCallback: () {
                    context.read<AuthProvider>().signInWithGoogle(context);
                  },),
                  LoginWith(title: 'Facebook', image: AppImages.facebook, voidCallback: () {},),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
