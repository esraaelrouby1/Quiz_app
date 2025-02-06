import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/controller/login/login_controller.dart';
import 'package:quiz_app/core/resources/assets_values_manger.dart';
import 'package:quiz_app/core/resources/color_manger.dart';
import 'package:quiz_app/core/resources/font_manager.dart';
import 'package:quiz_app/core/resources/height_values.dart';
import 'package:quiz_app/core/resources/strings_values.dart';
import 'package:quiz_app/core/widgets/custom_material_button.dart';
import 'package:quiz_app/view/login/widgets/custom_logo_screen.dart';
import 'package:quiz_app/view/login/widgets/custon_text_form_field_login_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginController _loginController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginController = LoginController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _loginController.onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsValuesManger.kLoginScreenImage),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomLogoScreen(),
              Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      "Enter your name",
                      style: GoogleFonts.baloo2(
                        fontSize: FontSize.f18,
                        color: ColorManger.kPurpleColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: HeightValues.h10,
                  ),
                  CustomTextFormFieldLoginScreen(
                    validator: (value) {
                      return _loginController.validateName(value);
                    },
                    onChanged: (value) {
                      _loginController.onChangedTextFormField();
                    },
                    keyForm: _loginController.formKeyName,
                  ),
                ],
              ),
              CustomMaterialButton(
                isActiveOutputStream: _loginController.isActiveOutputStream,
                onPressed: () {
                  _loginController.navigateToQuizScreen(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
