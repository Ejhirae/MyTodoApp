import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text('Sign Up',
                    style: TextStyle(fontFamily: 'Arial', fontSize: 40)),
              ),
              const Text('Please fill the spaces to continue',
                  style: TextStyle(fontFamily: 'Arial', fontSize: 12)),
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.all(2.0),
                child: Text('Email'),
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 2,
                          style: BorderStyle.solid)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 2,
                          style: BorderStyle.solid)),
                  fillColor: Colors.pink,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 2,
                          style: BorderStyle.solid)),

                  // label: const Text('Sign Up',
                  //     style: TextStyle(fontFamily: 'Arial', fontSize: 13)),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Padding(
                padding: EdgeInsets.all(2.0),
                child: Text('Username'),
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 2,
                          style: BorderStyle.solid)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 2,
                          style: BorderStyle.solid)),
                  fillColor: Colors.pink,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 2,
                          style: BorderStyle.solid)),

                  // label: const Text('Sign Up',
                  //     style: TextStyle(fontFamily: 'Arial', fontSize: 13)),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Padding(
                padding: EdgeInsets.all(2.0),
                child: Text('Password'),
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 2,
                          style: BorderStyle.solid)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 2,
                          style: BorderStyle.solid)),
                  fillColor: Colors.pink,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 2,
                          style: BorderStyle.solid)),

                  // label: const Text('Sign Up',
                  //     style: TextStyle(fontFamily: 'Arial', fontSize: 13)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      onPressed: null,
                      child: const Text('Sign Up',
                          style: TextStyle(fontFamily: 'Arial'))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Center(
                  child: Wrap(
                    children: [
                      Text('Have an account? '),
                      GestureDetector(
                        onTap: () => null,
                        child: Text(
                          'Sign in',
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
