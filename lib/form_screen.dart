import 'package:flutter/material.dart';

import 'formservice.dart';

class FormScreen extends StatefulWidget {
  // const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final numController = TextEditingController();
  final nameController = TextEditingController();
  bool passToggle = true;
  var token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Page"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 221, 74, 123),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
              key: _formfield,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/profile.png",
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);
                      if (value.isEmpty) {
                        return "Enter Email";
                      } else if (!emailValid) {
                        return "Enter Valid Email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: numController,
                    decoration: const InputDecoration(
                      labelText: "Number",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Number";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: passController,
                    obscureText: passToggle,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(passToggle
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Password";
                      } else if (passController.text.length < 6) {
                        return "Must be atleast 6 characters";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 60),
                  InkWell(
                    onTap: () {
                      if (_formfield.currentState!.validate()) {
                        int numValue = int.parse(numController.text);
                        FormService()
                            .submit(nameController.text, emailController.text,
                                numValue, passController.text)
                            .then((val) {
                          if (val.data['success']) {
                            token = val.data['token'];
                          }
                        });

                        emailController.clear();
                        passController.clear();
                        nameController.clear();
                        numController.clear();
                        Navigator.pushNamed(context, '/success');
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 221, 74, 123),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                          child: Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
