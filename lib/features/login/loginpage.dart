import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoton_admin/common_widget/custom_alert_dialog.dart';
import 'package:spoton_admin/common_widget/custom_button.dart';
import 'package:spoton_admin/common_widget/custom_text_formfield.dart';
import 'package:spoton_admin/features/home/homescreen.dart';
import 'package:spoton_admin/features/login/login_bloc/login_bloc.dart';
import 'package:spoton_admin/util/value_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false,
            );
          } else if (state is LoginFailureState) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: 'Failed',
                description: state.message,
                primaryButton: 'Ok',
              ),
            );
          }
        },
        builder: (context, state) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.black,
                    child: const Image(
                      image: AssetImage(
                          'assets/max-ilienerwise-jmZ2q_k-dAE-unsplash.jpg'),
                      fit: BoxFit.cover,
                    ),
                  )),
              Expanded(
                child: Container(
                  color: Colors.black,
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'SpotOn',
                            style: TextStyle(
                                fontSize: 50.0,
                                color: Color(0xFF7F00FF),
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const Text(
                            'Email',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextFormField(
                              labelText: 'Email',
                              controller: _emailController,
                              validator: emailValidator),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Password',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextFormField(
                              labelText: 'Password',
                              controller: _passwordController,
                              validator: notEmptyValidator),
                          const SizedBox(
                            height: 30.0,
                          ),
                          CustomButton(
                            inverse: true,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                BlocProvider.of<LoginBloc>(context).add(
                                  LoginEvent(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                  ),
                                );
                              }
                            },
                            label: 'Login',
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ));
  }
}
