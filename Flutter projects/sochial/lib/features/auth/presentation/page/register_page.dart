import 'package:flutter/material.dart';

import '../components/my_botton.dart';
import '../components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, this.togglePages});

  final void Function()? togglePages;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPwController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Icon(
                  Icons.lock_open_rounded, //Иконка замок
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Text(
              "Let`s create an account for you!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: MyTextField(
                controller: nameController,
                hintText: 'Name',
                obscureText: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: MyTextField(
                controller: confirmPwController,
                hintText: 'Confirm password',
                obscureText: true,
              ),
            ),
            SizedBox(height: 25),
            MyBotton(
              onTap: () {},
              text: 'Register',
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already a member?',
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: widget.togglePages,
                  child: Text(
                    'Login now',
                    style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
