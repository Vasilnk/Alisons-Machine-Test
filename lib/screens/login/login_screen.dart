import 'package:alisons_machine_test/utils/app_colors.dart';
import 'package:alisons_machine_test/utils/app_text_styles.dart';
import 'package:alisons_machine_test/widgets/custom_button.dart';
import 'package:alisons_machine_test/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final imageHeight = screenHeight * 0.46;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Image with Skip button overlay
            Stack(
              children: [
                //
                //  Top Image
                //
                Image.network(
                  'https://api.builder.io/api/v1/image/assets/TEMP/a5dddd455a2083cdd22dfcf342301e830f486b64?width=780',
                  width: screenWidth,
                  height: imageHeight,
                  fit: BoxFit.cover,
                  loadingBuilder: (c, child, loading) {
                    if (loading == null) return child;
                    return SizedBox(
                      width: screenWidth,
                      height: imageHeight,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
                    );
                  },
                ),
                //
                //  Skip Text
                //
                Positioned(
                  top: MediaQuery.of(context).padding.top + 12,
                  right: 20,
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, '/home'),
                    child: Row(
                      children: const [
                        Text('Skip', style: AppTextStyles.skipButton),
                        SizedBox(width: 4),
                        Icon(
                          Icons.chevron_right,
                          color: AppColors.white,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //
            // Email & Password Section
            //
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 24),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Login', style: AppTextStyles.heading),
                    const SizedBox(height: 20),

                    const Text('Email Address', style: AppTextStyles.label),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: emailController,
                      hintText: 'johndoe@gmail.com',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    Text('Password', style: AppTextStyles.label),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: passwordController,
                      hintText: '********',
                      obscureText: obscurePassword,
                      suffixIcon: GestureDetector(
                        onTap: () =>
                            setState(() => obscurePassword = !obscurePassword),
                        child: Opacity(
                          opacity: 0.5,
                          child: Icon(
                            obscurePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.textPrimary,
                            size: 22,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Forgot password?',
                          style: AppTextStyles.link,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    CustomButton(text: 'Login', onPressed: login),
                    const SizedBox(height: 20),

                    Center(
                      child: RichText(
                        text: const TextSpan(
                          style: AppTextStyles.input,
                          children: [
                            TextSpan(text: "Don't Have an account? "),
                            TextSpan(
                              text: 'Sign Up',
                              style: AppTextStyles.linkBold,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //
  //
  // Login Function
  //
  //
  void login() {
    if (formKey.currentState!.validate()) {
      if (emailController.text == "mobile@alisonsgroup.com" &&
          passwordController.text == "12345678") {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Invalid email or password"),
            backgroundColor: AppColors.primary,
          ),
        );
      }
    }
  }
}
