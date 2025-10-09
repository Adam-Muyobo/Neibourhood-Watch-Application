import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'signup_success_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String username = "", firstName = "", lastName = "", email = "", phone = "", password = "";

  void _signup() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final response = await ApiService.signup({
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phone,
        "password": password,
      });

      if (response != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignupSuccessPage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E5EC),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(32),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFE0E5EC),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(-5, -5),
                  blurRadius: 10,
                ),
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  offset: const Offset(5, 5),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person_add_alt_1,
                      size: 80, color: Colors.deepPurple),
                  const SizedBox(height: 20),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildTextField(
                    "Username",
                        (v) => username = v!,
                    validator: (v) {
                      if (v!.isEmpty) return "Please enter username";
                      if (!RegExp(r'^[a-zA-Z0-9]{3,15}$').hasMatch(v)) {
                        return "3-15 alphanumeric characters only";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    "First Name",
                        (v) => firstName = v!,
                    validator: (v) {
                      if (v!.isEmpty) return "Please enter first name";
                      if (!RegExp(r'^[a-zA-Z]{2,30}$').hasMatch(v)) {
                        return "2-30 letters only";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    "Last Name",
                        (v) => lastName = v!,
                    validator: (v) {
                      if (v!.isEmpty) return "Please enter last name";
                      if (!RegExp(r'^[a-zA-Z]{2,30}$').hasMatch(v)) {
                        return "2-30 letters only";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    "Email",
                        (v) => email = v!,
                    validator: (v) {
                      if (v!.isEmpty) return "Please enter email";
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(v)) {
                        return "Invalid email address";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    "Phone",
                        (v) => phone = v!,
                    validator: (v) {
                      if (v!.isEmpty) return "Please enter phone number";
                      if (!RegExp(r'^\d{7,15}$').hasMatch(v)) {
                        return "7-15 digits only";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    "Password",
                        (v) => password = v!,
                    obscureText: true,
                    validator: (v) {
                      if (v!.isEmpty) return "Please enter password";
                      if (!RegExp(
                          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$')
                          .hasMatch(v)) {
                        return "Min 8 chars, include upper, lower, digit & special";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                      ),
                      onPressed: _signup,
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, Function(String?) onSaved,
      {bool obscureText = false, String? Function(String?)? validator}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: const Color(0xFFE0E5EC),
        border: InputBorder.none,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      obscureText: obscureText,
      onSaved: onSaved,
      validator: validator,
    );
  }
}
