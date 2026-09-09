import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        // useMaterial3: false,
        primaryColor: const Color(0xff22e171),
      ),
      // A widget which will be started on application startup
      home: const MyHomePage(title: 'Hadukin'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text(title),
      ),
      body: const UserForm(),
    );
  }
}

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _FormState();
}

class _FormState extends State<UserForm> {
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  void submitForm() {
    if (firstnameController.text.isEmpty ||
        lastnameController.text.isEmpty ||
        !emailController.text.contains("@") ||
        passwordController.text.isEmpty ||
        passwordController.text != confirmpasswordController.text) {
      setState(() {
        info = "Invalid input \nPlease check your details.";
      });
    } else {
      setState(() {
        info = "Registration Successful \n\n"
            "Name: ${firstnameController.text} ${lastnameController.text}\n"
            "Email: ${emailController.text}";
      });
      firstnameController.clear();
      lastnameController.clear();
      emailController.clear();
      passwordController.clear();
      confirmpasswordController.clear();
    }
  }

  String info = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: firstnameController,
              decoration: InputDecoration(labelText: "First Name:"),
            ),
            TextField(
              controller: lastnameController,
              decoration: InputDecoration(labelText: "Last Name:"),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email: "),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            TextField(
              controller: confirmpasswordController,
              decoration: InputDecoration(labelText: "Confirm Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: submitForm,
              child: const Text("Register"),
            ),
            const SizedBox(height: 20),
            Text(
              info,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}
