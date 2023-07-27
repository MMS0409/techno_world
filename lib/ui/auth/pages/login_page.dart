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
                  controller: context.read<AuthProvider>().emailController),
              SizedBox(height: 24.h),
              GlobalTextField(
                hintText: "Password",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.start,
                controller: context.read<AuthProvider>().passwordController,
              ),
              SizedBox(height: 24.h),
              GlobalButton(
                  title: "Log In",
                  onTap: () {
                    context.read<AuthProvider>().logIn(context);
                  }),
              SizedBox(height: 30.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LoginWith(title: 'Google', image: AppImages.google),
                  LoginWith(title: 'Facebook', image: AppImages.facebook),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
