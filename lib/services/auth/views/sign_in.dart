import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screens/quiz_screen.dart';
import 'package:quiz_app/services/auth/controller/auth_controller.dart';
import 'package:quiz_app/services/auth/views/sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/png/background.png'),
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 0.85,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  color: Color(0xFF1F1D2B),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 12),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Sign in',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Color(0xFFFFFFFF), fontSize: 24),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email is required";
                            }
                            return null;
                          },
                          controller: _emailcontroller,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFFFFFFF),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                            ),
                            labelText: 'Email',
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 16, color: const Color(0xff6C5ECF)),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8.0, right: 8, top: 20),
                        child: TextFormField(
                          controller: _passwordcontroller,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password is required";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFFFFFFF),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                            ),
                            labelText: 'Password',
                            labelStyle: GoogleFonts.poppins(
                              fontSize: 16,
                              color: const Color(0xff6C5ECF),
                            ),
                          ),
                        ),
                      ),
                      Consumer(
                        builder: (context, ref, child) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8, top: 25),
                            child: MaterialButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ref
                                      .read(authControllerProvider)
                                      .signInWithEmailAndPassowrd(
                                          email: _emailcontroller.text,
                                          password: _passwordcontroller.text)
                                      .then((value) => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const QuizScreen1())));
                                }
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              color: const Color(0xff6C5ECF),
                              minWidth: double.infinity,
                              height: 45,
                              child: Text(
                                "Sign in",
                                style: GoogleFonts.poppins(
                                    color: const Color(0xffffffff),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password ?',
                              style: GoogleFonts.poppins(
                                  color: const Color(0xFF989898), fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account ?",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xff989898), fontSize: 15),
                            ),
                            InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const SignUp())),
                              child: Text(
                                ' Sign up',
                                style: GoogleFonts.poppins(
                                    color: const Color(0xFF6C5ECF),
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
