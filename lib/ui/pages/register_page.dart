import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngepet_id/cubit/auth_cubit.dart';
import 'package:ngepet_id/shared/theme.dart';
import 'package:ngepet_id/ui/widgets/custom_button.dart';

import '../widgets/custom_textformfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController usernameController =
      TextEditingController(text: '');
  final TextEditingController noHandphoneController =
      TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController rPasswordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Text(
                  "REGISTER",
                  style: boldTextStyle.copyWith(
                    color: kBlack2Color,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  title: "Nama*",
                  hintText: "Masukkan nama anda",
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  title: "Username*",
                  hintText: "Masukkan username anda",
                  controller: usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  title: "No Handphone*",
                  hintText: "Masukkan nomor handphone anda",
                  controller: noHandphoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor handphone tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  title: "Email*",
                  hintText: "Masukkan email anda",
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    } else if (!value.contains('@')) {
                      return 'Email tidak valid';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  title: "Password*",
                  obscureText: true,
                  hintText: "Masukkan password anda",
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  title: "Ulangi Password*",
                  obscureText: true,
                  hintText: "Masukkan ulang password anda",
                  controller: rPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ulangi password tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/main', (route) => false);
                    } else if (state is AuthFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: kRedColor,
                          content: Text(state.error),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomButton(
                        title: "Register",
                        color: kPrimaryColor,
                        titleColor: kWhiteColor,
                        onTap: () {
                          context.read<AuthCubit>().register(
                                email: emailController.text,
                                name: nameController.text,
                                password: passwordController.text,
                                username: usernameController.text,
                                no_telepon: noHandphoneController.text,
                                role_id: 'usr_usr',
                              );
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sudah punya akun?",
                      style: regularTextStyle.copyWith(
                        fontSize: 12,
                        color: kPurple2Color,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigasi ke halaman login
                        Navigator.pushNamed(context, '/main');
                      },
                      child: Text(
                        " Login Sekarang",
                        style: regularTextStyle.copyWith(
                          fontSize: 12,
                          color: kPrimaryColor,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
