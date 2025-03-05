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
            children: <Widget>[
              Expanded(
                  child: Container(
                height: 800,
                width: 400,
                color: Colors.black,
                child: const Image(
                  image: NetworkImage(
                      'https://t4.ftcdn.net/jpg/12/14/07/63/240_F_1214076346_IP3vmKVr1c5M6FVxPktpLRj7k7pyLPqn.jpg'),
                  fit: BoxFit.contain,
                ),
              )),
              Expanded(
                child: Container(
                  color: Colors.black,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Center(
                            child: Text(
                          'SpotOn',
                          style: TextStyle(
                              fontSize: 50.0, color: Color(0xFF7F00FF)),
                          textAlign: TextAlign.center,
                        )),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomTextFormField(
                            labelText: 'Email',
                            controller: _emailController,
                            validator: emailValidator),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextFormField(
                            labelText: 'Password',
                            controller: _passwordController,
                            validator: notEmptyValidator),
                        SizedBox(
                          width: 400,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                      fontSize: 15.0, color: Color(0xFF7F00FF)),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        CustomButton(
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
            ],
          );
        },
      ),
    ));
  }
}
