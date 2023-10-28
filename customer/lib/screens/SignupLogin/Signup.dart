import 'package:customer/components/already_have_an_account_check.dart';
import 'package:customer/components/widgets.dart';
import 'package:customer/constants.dart';
import 'package:customer/main.dart';
import 'package:customer/screens/Homescreen/Homescreen.dart';
import 'package:customer/screens/SignupLogin/Login.dart';
import 'package:customer/screens/SignupLogin/components/signup_topimg.dart';
import 'package:customer/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/';
import '../../components/background.dart';

//Jasper's code-----------------------------------------
// class CustSignup extends StatefulWidget {
//   const CustSignup({super.key});

//   @override
//   State<CustSignup> createState() => _CustSignupState();
// }

// FirebaseAuth _auth = FirebaseAuth.instance;

// class _CustSignupState extends State<CustSignup> {
//   final formKey = GlobalKey<FormState>();
//   bool isLoading = false;
//   // final FirebaseService _authService = FirebaseService();
//   final TextEditingController _email = TextEditingController();
//   final TextEditingController _password = TextEditingController();

//   @override
//   void dispose() {
//     _email.dispose();
//     _password.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Background(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const SignUpScreenTopImage(),
//           Row(
//             children: [
//               const Spacer(),
//               Expanded(
//                   flex: 8,
//                   child: Form(
//                     key: formKey,
//                     child: Column(children: [
//                       textField(
//                         'Email Address',
//                         Icons.person,
//                         false,
//                         _email,
//                       ),
//                       const SizedBox(
//                         height: defaultPadding,
//                       ),
//                       textField('Password', Icons.lock, false, _password),
//                       const SizedBox(
//                         height: defaultPadding,
//                       ),
//                       SizedBox(
//                         child: Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: 50,
//                           margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(90)),
//                           child: ElevatedButton(
//                             onPressed: () {
//                               if (formKey.currentState!.validate()) {
//                                 print("email and password filled up dady");
//                                 // log("${_email.text} ${_password.text}");
//                                 // _signup(_email.text, _password.text);
//                               }
//                             },
//                             child: isLoading
//                                 ? const Center(
//                                     child: CircularProgressIndicator(
//                                     color: Colors.white,
//                                   ))
//                                 : const Text(
//                                     'SIGN UP',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 13,
//                                       fontFamily: 'Inter',
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                           ),
//                         ),
//                       ),
//                       AlreadyHaveAnAccountCheck(
//                           login: false,
//                           press: () {
//                             Navigator.push(context,
//                                 MaterialPageRoute(builder: (context) {
//                               return const CustLogin();
//                             }));
//                           })
//                     ]),
//                   )),
//               const Spacer(),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

//Loys' code
import 'package:customer/components/already_have_an_account_check.dart';
import 'package:customer/components/background.dart';
import 'package:customer/components/form_container_widget.dart';
import 'package:customer/components/widgets.dart';
import 'package:customer/constants.dart';
import 'package:customer/screens/SignupLogin/components/login_topimg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//Jasper's code
// class CustLogin extends StatefulWidget {
//   const CustLogin({super.key});

//   @override
//   State<CustLogin> createState() => _CustLoginState();
// }

// class _CustLoginState extends State<CustLogin> {
//   final formKey = GlobalKey<FormState>();
//   bool isLoading = false;
//   // final FirebaseService _authService = FirebaseService();
//   final TextEditingController _email = TextEditingController();
//   final TextEditingController _password = TextEditingController();

//   @override
//   void dispose() {
//     _email.dispose();
//     _password.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Background(
//         child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const LoginScreenTopImage(),
//         Row(
//           children: [
//             const Spacer(),
//             Expanded(
//                 flex: 8,
//                 child: Form(
//                   key: formKey,
//                   child: Column(children: [
//                     textField(
//                       'Email Address',
//                       Icons.person,
//                       false,
//                       _email,
//                     ),
//                     const SizedBox(
//                       height: defaultPadding,
//                     ),
//                     textField('Password', Icons.lock, false, _password),
//                     const SizedBox(
//                       height: defaultPadding,
//                     ),
//                     SizedBox(
//                       child: Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: 50,
//                         margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(90)),
//                         child: ElevatedButton(
//                           onPressed: () {
//                             if (formKey.currentState!.validate()) {
//                               print("email and password filled up dady");
//                               // log("${_email.text} ${_password.text}");
//                               // _signup(_email.text, _password.text);
//                             }
//                           },
//                           child: isLoading
//                               ? const Center(
//                                   child: CircularProgressIndicator(
//                                   color: Colors.white,
//                                 ))
//                               : const Text(
//                                   'SIGN UP',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 13,
//                                     fontFamily: 'Inter',
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                         ),
//                       ),
//                     ),
//                     AlreadyHaveAnAccountCheck(
//                         login: false,
//                         press: () {
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) {
//                             return const CustLogin();
//                           }));
//                         })
//                   ]),
//                 )),
//             const Spacer(),
//           ],
//         )
//       ],
//     ));
//   }
// }

//loys' code
class CustSignUp extends StatefulWidget {
  const CustSignUp({super.key});

  @override
  State<CustSignUp> createState() => _CustSignUpState();
}

class _CustSignUpState extends State<CustSignUp> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text("Sign Up",
              //     style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              SignUpScreenTopImage(),
              SizedBox(height: 30),
              FormContainerWidget(
                controller: _usernameController,
                hintText: "Username",
                isPasswordField: false,
              ),
              SizedBox(height: 10),
              FormContainerWidget(
                controller: _emailController,
                hintText: "Email",
                isPasswordField: false,
              ),
              SizedBox(height: 10),
              FormContainerWidget(
                controller: _passwordController,
                hintText: "Password",
                isPasswordField: true,
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => CustHome())));
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    "Sign Up",
                    style: TextStyle(),
                  )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => LoginScreen())));
                    },
                    child: Text(
                      "Log in",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);
  }
}
