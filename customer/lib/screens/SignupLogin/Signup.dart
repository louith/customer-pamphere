import 'package:customer/components/already_have_an_account_check.dart';
import 'package:customer/components/widgets.dart';
import 'package:customer/constants.dart';
import 'package:customer/screens/SignupLogin/Login.dart';
import 'package:customer/screens/SignupLogin/components/signup_topimg.dart';
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
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Text('hatdog')],
      ),
    );
  }
}
