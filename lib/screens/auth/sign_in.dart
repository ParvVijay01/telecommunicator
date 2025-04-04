import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:jctelecaller/provider/user_provider.dart';
import 'package:jctelecaller/utils/constants/images.dart';
import 'package:jctelecaller/utils/constants/colors.dart';
import 'package:jctelecaller/utils/constants/sizes.dart';
import 'package:jctelecaller/utility/snackbar_helper.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      SnackBarHelper.showErrorSnackBar("Please enter email and password.");
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      String? error =
          await userProvider.login(LoginData(name: email, password: password));

      if (error == null) {
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else {
        // Check if the error message is "Unauthorized" and replace it with a user-friendly message
        if (error.toLowerCase().contains("unauthorized")) {
          error = "Invalid email or password.";
        }
        SnackBarHelper.showErrorSnackBar(error);
      }
    } catch (e) {
      SnackBarHelper.showErrorSnackBar("Error: ${e.toString()}");
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            alignment: Alignment.topCenter,
            constraints: const BoxConstraints(maxWidth: IKSizes.container),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(150)),
                        child: Image.asset(
                          IKImages.logo,
                          width: double.infinity,
                          height: 170,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 25),
                    constraints:
                        const BoxConstraints(maxWidth: IKSizes.container),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Sign In To Your Account',
                          style: Theme.of(context).textTheme.headlineLarge,
                          textAlign: TextAlign.left,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Welcome Back! You've Been Missed!",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.color,
                                  fontSize: 15),
                          textAlign: TextAlign.left,
                          maxLines: 3,
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            contentPadding: const EdgeInsets.all(15),
                            filled: true,
                            floatingLabelStyle:
                                TextStyle(color: IKColors.primary),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: IKColors.primary,
                            )),
                            border: const OutlineInputBorder(),
                            fillColor: Theme.of(context).canvasColor,
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            floatingLabelStyle:
                                TextStyle(color: IKColors.primary),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: IKColors.primary,
                            )),
                            labelText: 'Password',
                            contentPadding: const EdgeInsets.all(15),
                            filled: true,
                            border: const OutlineInputBorder(),
                            fillColor: Theme.of(context).canvasColor,
                          ),
                        ),
                        const SizedBox(height: 25),
                        ElevatedButton(
                          onPressed: _isLoading ? null : _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: IKColors.primary,
                            side: const BorderSide(color: IKColors.secondary),
                            foregroundColor: Theme.of(context).cardColor,
                          ),
                          child: _isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white)
                              : const Text('Sign in'),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
