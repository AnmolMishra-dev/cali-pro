import 'package:calibrum/constants/constant.dart';
import 'package:calibrum/helper/responsive.dart';
import 'package:calibrum/screens/login.dart';
import 'package:calibrum/widget/custom_widget.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String userName;
  const Header({Key key, this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: [headerLightBG, headerDarkBG],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: Responsive.isDesktop(context)
                    ? defaultPadding
                    : padding_10),
            child: Image.asset('assets/images/logo_white.png', width: 150.0),
          ),
          if (!Responsive.isMobile(context))
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconField(
                    userName: userName,
                  )
                ],
              ),
            ),
          if (Responsive.isMobile(context)) popupMenu(context),
        ],
      ),
    );
  }

  popupMenu(BuildContext context) {
    return PopupMenuButton(
      child: Center(child: Icon(Icons.more_vert, color: Colors.white)),
      onSelected: (String result) {
        if (result == "Logout") {
          _showMyDialog(context);
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Center(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: primaryColor,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.3),
                      offset: Offset(0, 5),
                      blurRadius: 25)
                ],
              ),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: _buildSelectIcon('', 'JN'),
                  ),
                ],
              ),
            ),
          ),
          value: "Profile",
        ),
        PopupMenuItem(
          child: Text(
            userName,
            textAlign: TextAlign.center,
          ),
          value: "User Name",
        ),
        PopupMenuItem(
          child: Text(
            'Orgnaization',
            textAlign: TextAlign.center,
          ),
          value: "Orgnaization",
        ),
        PopupMenuItem(
          child: iconWithText("Logout", Icons.logout, "Logout"),
          value: "Logout",
        ),
      ],
    );
  }
}

class IconField extends StatelessWidget {
  final String userName;
  const IconField({Key key, this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomElevatedButton(
            title: 'Orgnaization',
            backgroundColor: headerButtonBG,
            width: 120.0,
          ),
          SizedBox(width: 16.0),
          CustomElevatedButton(
            title: userName,
            icon: Icons.arrow_drop_down,
            backgroundColor: headerButtonBG,
          ),
          SizedBox(width: 16.0),
          CustomIconButton(
            icon: Icons.logout,
            press: () {
              _showMyDialog(context);
            },
          ),
        ],
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Calibrum'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Are you confirm to Logout?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop();
              doLogout(context);
            },
          ),
        ],
      );
    },
  );
}

doLogout(BuildContext context) {
  pushAndReplace(context, Login());
}

Widget _buildSelectIcon(String imgUrl, String name) {
  if (imgUrl != '') {
    return CircleAvatar(
      backgroundImage: NetworkImage(imgUrl),
    );
  } else {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: Text(
        name,
        style: TextStyle(color: primaryColor),
      ),
    );
  }
}
