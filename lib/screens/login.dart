import 'package:calibrum/constants/constant.dart';
import 'package:calibrum/helper/responsive.dart';
import 'package:calibrum/screens/dashboard.dart';
import 'package:calibrum/widget/custom_widget.dart';
import 'package:flutter/material.dart';

import '../my_flutter_app_icons.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Row(
          children: [
            if (!Responsive.isMobile(context))
              Container(
                color: headerDarkBG,
                width: MediaQuery.of(context).size.width / 2,
                height: double.infinity,
                child: Center(
                  child: Image.asset(
                    'assets/images/fav.png',
                    fit: BoxFit.cover,
                    width: 200.0,
                  ),
                ),
              ),
            Container(
              width: Responsive.isMobile(context)
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width / 2,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                  left: Responsive.isDesktop(context)
                      ? defaultPadding
                      : padding_10,
                  right: Responsive.isDesktop(context)
                      ? defaultPadding
                      : padding_10,
                  top: 40,
                  bottom: 20),
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: Responsive.isDesktop(context)
                            ? defaultPadding
                            : padding_10,
                        bottom: 20),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo_color.png'),
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Responsive.isDesktop(context)
                            ? defaultPadding
                            : padding_10),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          color: HexColor("#0A71A9"),
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Responsive.isDesktop(context)
                            ? defaultPadding
                            : padding_10),
                    child: Text(
                      "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,",
                      style: TextStyle(
                        color: HexColor("#707070"),
                        fontSize: 12,
                      ),
                    ),
                  ),
                  CustomTextArea(
                    titleText: 'Email Id',
                    hintText: 'Enter Email Id',
                    prefix: Icon(
                      MyFlutterApp.custom_email_id,
                      size: 20.0,
                    ),
                  ),
                  CustomTextArea(
                    titleText: 'Password',
                    hintText: 'Enter Password',
                    prefix: Icon(
                      MyFlutterApp.custom_password,
                      size: 20.0,
                    ),
                  ),
                  CustomTextArea(
                    titleText: 'Account Id',
                    hintText: 'Enter Account Id',
                    prefix: Icon(
                      MyFlutterApp.custom_account_id,
                      size: 20.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: Responsive.isDesktop(context)
                                ? defaultPadding
                                : padding_10),
                        child: CustomElevatedButton(
                          callBack: () {
                            pushAndReplace(context, Dashboard());
                          },
                          title: 'Sign In',
                          backgroundColor: primaryColor,
                          width: Responsive.isMobile(context)
                              ? 100.0
                              : Responsive.isTablet(context)
                                  ? 150.0
                                  : 200,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: Responsive.isDesktop(context)
                                ? defaultPadding
                                : padding_10),
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
