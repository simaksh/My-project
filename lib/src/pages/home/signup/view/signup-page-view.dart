import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled121/src/infrastructor/commons/route-name.dart';

enum UserType { seller, customer }

class SignupPageView extends StatefulWidget {
  const SignupPageView({super.key});

  @override
  _SignupPageViewState createState() => _SignupPageViewState();
}

class _SignupPageViewState extends State<SignupPageView> {
  UserType? _userType;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('signup page'),
    ),
    body: Container(
      color: Colors.cyan.shade200, // Background color
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(
                decoration: InputDecoration(
                  labelText: 'First Name',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Repeat Password',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20,),
              RadioListTile<UserType>(
                title: const Text('Seller'),
                value: UserType.seller,
                groupValue: _userType,
                onChanged: (UserType? value) {
                  setState(() {
                    _userType = value;
                  });
                },
              ),
              RadioListTile<UserType>(
                title: const Text('Customer'),
                value: UserType.customer,
                groupValue: _userType,
                onChanged: (UserType? value) {
                  setState(() {
                    _userType = value;
                  });
                },
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed:()=>Get.back(result: RouteName.login),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                child:const Text('Signup'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}