import 'package:flutter/material.dart';
import 'package:ott_code_frontend/common/color_extension.dart';
import 'package:ott_code_frontend/common_widgets/rounded_button.dart';
import 'package:ott_code_frontend/common_widgets/rounded_text_field.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();
  TextEditingController txtMobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 100,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/images/back_btn.png",
                  width: 13,
                  height: 13,
                  color: ApplicationColor.subText,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "BACK",
                  style: TextStyle(
                      color: ApplicationColor.subText,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: ApplicationColor.bgColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ApplicationColor.primaryColor,
        onPressed: () {
          ApplicationColor.themeModeDark = !ApplicationColor.themeModeDark;
          if (mounted) {
            setState(() {});
          }
        },
        child: Icon(
          ApplicationColor.themeModeDark ? Icons.light_mode : Icons.dark_mode,
          color: ApplicationColor.text,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: media.width * 0.12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: ApplicationColor.cardDark,
                        borderRadius: BorderRadius.circular(media.width * 0.75),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 4))
                        ]),
                    child: Image.asset(
                      "assets/images/user_placeholder.png",
                      width: media.width * 0.18,
                      height: media.width * 0.18,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              RoundedTextField(
                  title: "Contact Number",
                  hintText: "Mobile Number",
                  controller: txtMobile,
                  keyboardType: TextInputType.number),
              const SizedBox(
                height: 30,
              ),
              RoundedTextField(
                  title: "Email Address",
                  hintText: "Email Address",
                  controller: txtEmail),
              const SizedBox(
                height: 30,
              ),
              RoundedTextField(
                title: "Password",
                hintText: "Password here",
                obscureText: true,
                controller: txtPassword,
              ),
              const SizedBox(
                height: 30,
              ),
              RoundedTextField(
                title: "Re-Enter Password",
                hintText: "Password here",
                obscureText: true,
                controller: txtPassword,
              ),
              const SizedBox(
                height: 30,
              ),
              RoundedButton(onPressed: () {}, title: "Register"),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
