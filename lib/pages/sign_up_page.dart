import 'package:flutter/material.dart';
import 'package:mobile_assessment/constants/colors.dart';
import 'package:mobile_assessment/widgets/sign_up_text_fom_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _hospitalNameController = TextEditingController();
  final TextEditingController _hospitalAddressController =
      TextEditingController();
  final TextEditingController _hospitalContactController =
      TextEditingController();
  final TextEditingController _gasQuantityController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisble = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'SignUp',
          style: TextStyle(
            color: kHeaderTextColor,
            fontSize: 28.0,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(padding: EdgeInsets.only(top: 30.0)),
          const Text(
            'Hospital Name',
            style: TextStyle(
              color: kTextFieldColor,
              fontSize: 28.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 5.0)),
          SignUpTextFormField(
            controller: _hospitalNameController,
            textInputType: TextInputType.text,
            obscureText: false,
            validator: (String? text) {
              if (text == null || text.isEmpty) {
                return 'Field is required';
              } else {
                return null;
              }
            },
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10.0)),
          const Text(
            'Hospital Address',
            style: TextStyle(
              color: kTextFieldColor,
              fontSize: 28.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 5.0)),
          SignUpTextFormField(
            controller: _hospitalAddressController,
            textInputType: TextInputType.text,
            obscureText: false,
            validator: (String? text) {
              if (text == null || text.isEmpty) {
                return 'Field is required';
              } else {
                return null;
              }
            },
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10.0)),
          const Text(
            'Hospital Contact',
            style: TextStyle(
              color: kTextFieldColor,
              fontSize: 28.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 5.0)),
          SignUpTextFormField(
            controller: _hospitalContactController,
            textInputType: TextInputType.number,
            obscureText: false,
            validator: (String? text) {
              if (text == null || text.isEmpty) {
                return 'Field is required';
              } else {
                return null;
              }
            },
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10.0)),
          const Text(
            'Gas Quantity',
            style: TextStyle(
              color: kTextFieldColor,
              fontSize: 28.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 5.0)),
          SignUpTextFormField(
            controller: _gasQuantityController,
            textInputType: TextInputType.number,
            obscureText: false,
            validator: (String? text) {
              if (text == null || text.isEmpty) {
                return 'Field is required';
              } else {
                return null;
              }
            },
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10.0)),
          const Text(
            'Password',
            style: TextStyle(
              color: kTextFieldColor,
              fontSize: 28.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 5.0)),
          SignUpTextFormField(
            controller: _passwordController,
            textInputType: TextInputType.visiblePassword,
            obscureText: false,
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
            validator: (String? text) {
              if (text == null || text.isEmpty) {
                return 'Field is required';
              } else if (text.length < 8) {
                return 'Password must be at least 8 characters';
              } else {
                return null;
              }
            },
          ),
        ],
      ),
    );
  }
}
