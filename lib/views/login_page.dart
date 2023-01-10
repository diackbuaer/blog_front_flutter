import 'package:api_news/controllers/authentication.dart';
import 'package:api_news/views/register.dart';
import 'package:api_news/views/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Authentication',
                  style: GoogleFonts.inter(
                      fontSize: size * 0.06, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 30,
              ),
              InputWidget(
                label: 'Username or Email',
                controller: _usernameController,
                obscureText: false,
              ),
              const SizedBox(
                height: 30,
              ),
              InputWidget(
                label: 'Password',
                controller: _passwordController,
                obscureText: false,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20)),
                  onPressed: () async {
                    await _authenticationController.login(
                        username: _usernameController.text.trim(),
                        password: _passwordController.text.trim());
                  },
                  child: Obx(() {
                    return _authenticationController.isLoading.value 
                    ? const Center(
                      child: CircularProgressIndicator(color: Colors.white,),
                    ):
                    const Text('Clik to login');
                  })),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                  onPressed: () {
                    Get.to(() => RegisterPage());
                  },
                  child: Text(
                    "Register",
                    style: GoogleFonts.inter(
                        fontSize: size * 0.04, color: Colors.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
