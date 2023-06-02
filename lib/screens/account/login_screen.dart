import 'package:flutter/material.dart';
import 'package:getxdemo/const/app_images.dart';
import 'package:getxdemo/const/colors.dart';
import 'package:getxdemo/widgets/all_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPressed = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool hidePassword = true;
  @override
  void initState() {
    super.initState();
  }

  Future<void> login() async {
    setState(() {
      isPressed = true;
    });

    if (isPressed) {
      // ignore: use_build_context_synchronously
      showSnackbar(context, "Logged in");

      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String hrmsUserData = "jsonEncode()";
      sharedPreferences.setString('hrmsUserData', hrmsUserData);
    } else {
      setState(() {
        isPressed = false;
      });
      // ignore: use_build_context_synchronously
      showSnackbar(context, "Login Faield!!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Stack(alignment: Alignment.center, children: [
            Column(
              children: [
                Container(
                  height: fullHeight(context) * 0.60,
                  width: fullWidth(context),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                    color: Color(0xff312d2e),
                  ),
                ),
                Container(
                  height: fullHeight(context) * 0.40,
                  width: fullWidth(context),
                  color: bottomColor,
                ),
              ],
            ),
            Positioned(
                top: fullHeight(context) * 0.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                      width: fullWidth(context) * 0.55,
                      child: Image.asset(AppImages.appIconLight),
                    ),
                    vSpace(fullHeight(context) * 0.12),
                    Material(
                      elevation: 12,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        height: fullHeight(context) * 0.42,
                        width: fullWidth(context) * 0.9,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, bottom: 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Column(
                                    children: <Widget>[
                                      vSpace(25),
                                      textBold(
                                        color: black,
                                        size: 25,
                                        maxLine: 1,
                                        text: "Sign In",
                                      ),
                                      vSpace(30),
                                      TextFormField(
                                        controller: _email,
                                        validator: (input) => input!.isEmpty
                                            ? "Please Enter Email"
                                            : null,
                                        // onSaved: (input) => email = input!,
                                        decoration: InputDecoration(
                                            hintText: 'Email',
                                            //  isDense: true,
                                            contentPadding:
                                                const EdgeInsets.all(8),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6))),
                                      ),
                                      vSpace(25),
                                      TextFormField(
                                        controller: _password,
                                        onChanged: (value) {},
                                        obscureText: hidePassword,
                                        validator: (input) => input!.isEmpty
                                            ? "Please Enter Password"
                                            : null,
                                        // onSaved: (input) => password = input!,
                                        decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  hidePassword = !hidePassword;
                                                });
                                              },
                                              icon: Icon(hidePassword
                                                  ? Icons.visibility_off
                                                  : Icons.visibility),
                                            ),
                                            hintText: 'Password',
                                            //  isDense: true,
                                            contentPadding:
                                                const EdgeInsets.all(8),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6))),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30, left: 10, right: 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          child: InkWell(
                                            onTap: () async {
                                              if (_formkey.currentState!
                                                      .validate() &&
                                                  isPressed != true) {
                                                setState(() {
                                                  isPressed = true;
                                                });

                                                login();
                                              } else {
                                                setState(() {
                                                  isPressed = false;
                                                });
                                              }
                                            },
                                            child: Container(
                                              height: 40,
                                              width: fullWidth(context) * 0.35,
                                              color: red,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  !isPressed
                                                      ? textRegular(
                                                          color: white,
                                                          maxLine: 1,
                                                          size: 16,
                                                          text: "Sign In",
                                                          alignment:
                                                              TextAlign.center)
                                                      : const CircularProgressIndicator(
                                                          color: Colors.white,
                                                        )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
