import 'package:flutter/material.dart';

import '../../common/custom_button.dart';
import '../../common/custom_textfield.dart';
import '../../constants/global_variables.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  static const String routeName = '/auth-screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;

  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  ///
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Welcome', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
              ListTile(
                tileColor: (_auth == Auth.signup) ? GlobalVariables.backgroundColor : GlobalVariables.greyBackgroundCOlor,
                title: const Text('Create Account', style: TextStyle(fontWeight: FontWeight.bold)),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() => _auth = val!);
                  },
                ),
              ),
              if (_auth == Auth.signup) ...[
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(color: GlobalVariables.backgroundColor),
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(controller: _nameController, hintText: 'name'),
                        const SizedBox(height: 10),
                        CustomTextField(controller: _emailController, hintText: 'email'),
                        const SizedBox(height: 10),
                        CustomTextField(controller: _passwordController, hintText: 'password'),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: 'Sign Up',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              ListTile(
                tileColor: (_auth == Auth.signin) ? GlobalVariables.backgroundColor : GlobalVariables.greyBackgroundCOlor,
                title: const Text('Sign In', style: TextStyle(fontWeight: FontWeight.bold)),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() => _auth = val!);
                  },
                ),
              ),
              if (_auth == Auth.signin) ...[
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(color: GlobalVariables.backgroundColor),
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        CustomTextField(controller: _emailController, hintText: 'email'),
                        const SizedBox(height: 10),
                        CustomTextField(controller: _passwordController, hintText: 'password'),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: 'Sign In',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
