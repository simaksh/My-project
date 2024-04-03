import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled121/src/infrastructor/commons/route-name.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  LoginPageViewState createState() => LoginPageViewState();
}

class LoginPageViewState extends State<LoginPageView> {
  bool rememberMe = false;
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Container(
        color: Colors.cyan.shade200,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  obscureText: true,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      icon: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off,
                        color: showPassword ? Colors.cyan : Colors.grey, // Adjust color based on showPassword
                      ),
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                    ),
                  ),
                  obscureText: !showPassword, // Toggle obscureText based on showPassword
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        rememberMe ? Icons.check_box : Icons.check_box_outline_blank,
                        color: rememberMe ? Colors.cyan: Colors.grey, // Adjust color based on rememberMe
                      ),
                      onPressed: () {
                        setState(() {
                          rememberMe = !rememberMe;
                        });
                      },
                    ),
                    const Text('Remember Me'),
                    const SizedBox(width: 20),
                    if (rememberMe)
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed(RouteName.signup);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Background color of the button
                        ),
                        child: const Text(
                          'Signup',
                          style: TextStyle(color: Colors.white), // Text color of the button
                        ),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(RouteName.saller);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange, // Background color of the button
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white), // Text color of the button
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}