import 'package:flutter/material.dart';
import '../validators/name_validator.dart';
import '../validators/email_validator.dart';
import '../validators/password_validator.dart';
import '../validators/phone_validator.dart';  // Import PhoneValidator
import 'login_screen.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  String? _nameError;
  String? _emailError;
  String? _passwordError;
  String? _phoneError;  // Error for Phone

  void _validateAndSignUp() {
    // Set Error Messages when not valid
    setState(() {
      _nameError = NameValidator.validate(_nameController.text);
      _emailError = EmailValidator.validate(_emailController.text);
      _passwordError = PasswordValidator.validate(_passwordController.text);
      _phoneError = PhoneValidator.validate(_phoneController.text); // Validate Phone
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
        title: Text(
          "Sign Up",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(  // Wrap the content with a SingleChildScrollView
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 48.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Name Field
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(color: Colors.blueAccent),
                  errorText: _nameError,
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
                  return _nameError;
                },
              ),
              SizedBox(height: 20),

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
              SizedBox(height: 20),

              // Phone Field (New)
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: "Phone",
                  labelStyle: TextStyle(color: Colors.blueAccent),
                  errorText: _phoneError,
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
                keyboardType: TextInputType.phone,
                validator: (value) {
                  return _phoneError;
                },
              ),
              SizedBox(height: 30),

              // Sign Up Button
              ElevatedButton(
                onPressed: _validateAndSignUp,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  backgroundColor: Colors.blueAccent,
                ),
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),

              // Login Link
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                child: Text(
                  "Already have an account? Login",
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
