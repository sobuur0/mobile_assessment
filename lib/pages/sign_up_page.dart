import 'package:flutter/material.dart';
import 'package:mobile_assessment/constants/colors.dart';
import 'package:mobile_assessment/pages/welcome_page.dart';
import 'package:mobile_assessment/widgets/sign_up_text_fom_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _hospitalNameController = TextEditingController();
  final TextEditingController _hospitalAddressController =
      TextEditingController();
  final TextEditingController _hospitalContactController =
      TextEditingController();
  final TextEditingController _gasQuantityController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisble = true;
  bool _isSignUpVisibile = true;

  @override
  void dispose() {
    super.dispose();
    _hospitalNameController.dispose();
    _hospitalAddressController.dispose();
    _hospitalContactController.dispose();
    _gasQuantityController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'SignUp',
          style: TextStyle(
            color: kHeaderTextColor,
            fontSize: 28.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(padding: EdgeInsets.only(top: 30.0)),
                const Text(
                  'Hospital Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 3.0)),
                SignUpTextFormField(
                  controller: _hospitalNameController,
                  textInputType: TextInputType.text,
                  obscureText: false,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter hospital name';
                    } else {
                      return null;
                    }
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 12.0)),
                const Text(
                  'Hospital Address',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 3.0)),
                SignUpTextFormField(
                  controller: _hospitalAddressController,
                  textInputType: TextInputType.text,
                  obscureText: false,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter hospital address';
                    } else {
                      return null;
                    }
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 12.0)),
                const Text(
                  'Hospital Contact',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 3.0)),
                SignUpTextFormField(
                  controller: _hospitalContactController,
                  textInputType: TextInputType.number,
                  obscureText: false,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter hospital contact number';
                    } else if (text.characters.length > 11) {
                      return 'Contact number cannot be more than 11';
                    } else {
                      return null;
                    }
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 12.0)),
                const Text(
                  'Gas Quantity(ltr)',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 3.0)),
                SignUpTextFormField(
                  controller: _gasQuantityController,
                  textInputType: TextInputType.number,
                  obscureText: false,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter needed gas quantity';
                    } else {
                      return null;
                    }
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 12.0)),
                const Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 3.0)),
                SignUpTextFormField(
                  controller: _passwordController,
                  textInputType: TextInputType.visiblePassword,
                  obscureText: _isPasswordVisble ? false : true,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordVisble = !_isPasswordVisble;
                      });
                    },
                    icon: _isPasswordVisble
                        ? const Icon(Icons.visibility, color: Colors.black)
                        : const Icon(
                            Icons.visibility_off,
                            color: Colors.black,
                          ),
                  ),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Pleaseenter your password';
                    } else if (text.length < 8) {
                      return 'Password must be at least 8 characters';
                    } else {
                      return null;
                    }
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 60.0)),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: _isSignUpVisibile == true
                      ? _signUpButton()
                      : _progressIndicator(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _progressIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CircularProgressIndicator(),
        Padding(padding: EdgeInsets.only(right: 16.0)),
        Text(
          'Creating your Account... Please wait',
          style: TextStyle(
            color: Colors.black,
          ),
        )
      ],
    );
  }

  Widget _signUpButton() {
    return ElevatedButton(
      onPressed: () {
        FocusScope.of(context).unfocus();
        if (_formKey.currentState!.validate()) {
          setState(() {
            _isSignUpVisibile = false;
          });
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const WelcomePage(),
              ),
              (route) => false,
            );
          });
        }
      },
      style: ElevatedButton.styleFrom(
        primary: kHeaderTextColor,
        fixedSize: const Size.fromHeight(48.0),
      ),
      child: const Text(
        'SignUp',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
