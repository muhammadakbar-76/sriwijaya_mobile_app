import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sriwijaya/cubit/auth_cubit.dart';
import 'package:sriwijaya/ui/widgets/custom_button.dart';
import 'package:sriwijaya/ui/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController hobbyController = TextEditingController(text: '');

  Widget title() {
    return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Text(
          //we wrap text inside container bcos text doesnt have margin/padding property
          'Join Us and get\nyour next journey',
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
        ));
  }

  Widget inputSection(BuildContext context) {
    Widget submitButton() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, "/bonus", (route) => false);
          } else if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: kRedColor,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return CustomButton(
            textButton: 'Sign Up',
            eventFunc: () {
              context.read<AuthCubit>().signUp(
                    email: emailController.text,
                    password: passwordController.text,
                    name: nameController.text,
                    hobby: hobbyController.text,
                  );
            },
          );
        },
      );
    }

    return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration:
            BoxDecoration(color: kWhiteColor, borderRadius: borderDefault),
        child: Column(
          children: [
            CustomFormField(
                controller: nameController,
                title: "Name",
                hint: "Input Your Name",
                margin: const EdgeInsets.only(top: 20)),
            CustomFormField(
                controller: emailController,
                title: "Email",
                hint: "Input Your Email",
                margin: const EdgeInsets.only(top: 20)),
            CustomFormField(
                controller: passwordController,
                title: "Password",
                hint: "Input Password",
                isObscureText: true,
                margin: const EdgeInsets.only(top: 20)),
            CustomFormField(
                controller: hobbyController,
                title: "Hobby",
                hint: "Input Hobby",
                margin: const EdgeInsets.only(top: 30, bottom: 50)),
            submitButton()
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
            //to keep content not overflowing to statusbar in your phone
            child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            title(),
            inputSection(context),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/sign-in");
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                  top: 50,
                  bottom: 73,
                ),
                child: Text(
                  "Have an account? Sign In",
                  style: grayTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: light,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            )
          ],
        )));
  }
}
