import 'package:calibrum/constants/constant.dart';
import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    Key key,
    this.title,
    this.totalCount,
    this.press,
    this.icon,
  }) : super(key: key);

  final String title, totalCount;
  final IconData icon;
  final void Function() press;
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: press,
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.lightBlue[50],
                blurRadius: 8,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  child: Row(
                    children: [
                      Icon(icon, color: primaryColor, size: 15.0),
                      SizedBox(width: 15.0),
                      Text(
                        title,
                        style: TextStyle(
                            color: countTitleColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  totalCount,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: _size.width < 650 ? 16 : 16,
                      color: headerDarkBG,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
