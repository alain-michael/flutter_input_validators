import 'package:flutter/material.dart';
import '../validators/email_validator.dart';
import '../validators/password_validator.dart';
import 'sign_up_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _emailError;
  String? _passwordError;

  void _validateAndLogin() {
    // Set Error Messages when not valid
    setState(() {
      _emailError = EmailValidator.validate(_emailController.text);
      _passwordError = PasswordValidator.validate(_passwordController.text);
    });

    if (_formKey.currentState!.validate()) {
      // If valid, navigate to Home Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Login", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 48.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Email Field
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.blueAccent),
                  errorText: _emailError,
                  errorStyle: TextStyle(color: Colors.redAccent),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                ),
                validator: (value) {
                  return _emailError;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              
              // Password Field
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.blueAccent),
                  errorText: _passwordError,
                  errorStyle: TextStyle(color: Colors.redAccent),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                ),
                obscureText: true,
                validator: (value) {
                  return _passwordError;
                },
              ),
              SizedBox(height: 30),
              
              // Login Button
              ElevatedButton(
                onPressed: _validateAndLogin,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  backgroundColor: Colors.blueAccent,
                ),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              
              // Sign Up Link
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
                child: Text(
                  "Don't have an account? Sign up",
                  style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
