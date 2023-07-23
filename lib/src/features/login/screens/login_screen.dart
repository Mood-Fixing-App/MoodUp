import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:moodup/src/constants/sizes.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/src/constants/image_strings.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Viewport height
    final double height = MediaQuery.of(context).size.height;

    // ---------------------------------- //
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            //! Lower Container
            Container(
              height: height * .7,
              decoration: const BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Sizes.kDefaultRadius),
                  topRight: Radius.circular(Sizes.kDefaultRadius),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(Sizes.kDefaultPadding),
                child: Column(
                  children: [
                    //! Login User Name
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User Name',
                        ),
                      ),
                    ),
                    //! Login Password
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    //! Forgot Password
                    TextButton(
                      onPressed: () {
                        //forgot password screen
                      },
                      child: const Text(
                        'Forgot Password',
                      ),
                    ),
                    //! Login Button
                    Container(
                      height: 50,
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        child: const Text('Login'),
                        onPressed: () {
                          if (kDebugMode) {
                            print(nameController.text);
                            print(passwordController.text);
                          }
                        },
                      ),
                    ),
                    //! Sign Up
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Does not have account?'),
                        TextButton(
                          child: const Text(
                            'Sign in',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            //signup screen
                          },
                        )
                      ],
                    ),
                    Container(
                      width: 459.86,
                      height: 5,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
