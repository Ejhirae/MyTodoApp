import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                    style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 40,
                        color: Colors.white)),
              ),
              const Text('Please fill the spaces to continue',
                  style: TextStyle(
                      fontFamily: 'Arial', fontSize: 12, color: Colors.white)),
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  'Email',
                  style: TextStyle(color: Colors.white),
                ),
              ),

              //For Email

              TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                    fontFamily: 'Arial', fontSize: 15, color: Colors.white),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 2,
                          style: BorderStyle.solid)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Colors.redAccent,
                          width: 2,
                          style: BorderStyle.solid)),
                  fillColor: Colors.redAccent,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 2,
                          style: BorderStyle.solid)),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Padding(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  'Username',
                  style: TextStyle(fontFamily: 'Arial', color: Colors.white),
                ),
              ),

              //For Username

              TextFormField(
                keyboardType: TextInputType.name,
                style: const TextStyle(
                    fontFamily: 'Arial', fontSize: 15, color: Colors.white),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 2,
                          style: BorderStyle.solid)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Colors.redAccent,
                          width: 2,
                          style: BorderStyle.solid)),
                  fillColor: Colors.redAccent,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 2,
                          style: BorderStyle.solid)),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Padding(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  'Password',
                  style: TextStyle(fontFamily: 'Arial', color: Colors.white),
                ),
              ),

              //For Password

              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(
                    fontFamily: 'Arial', fontSize: 15, color: Colors.white),
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      icon: Icon(_isPasswordVisible == true
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 2,
                          style: BorderStyle.solid)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Colors.redAccent,
                          width: 2,
                          style: BorderStyle.solid)),
                  fillColor: Colors.redAccent,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 2,
                          style: BorderStyle.solid)),
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
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      onPressed: () => print('helo'),
                      child: const Text('Sign Up',
                          style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 15,
                              color: Colors.white))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Wrap(
                    children: [
                      const Text(
                        'Don\'tHave an account? ',
                        style:
                            TextStyle(fontFamily: 'Arial', color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () => print('helo'),
                        child: const Text(
                          'SIGN IN',
                          style: TextStyle(color: Colors.redAccent),
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
