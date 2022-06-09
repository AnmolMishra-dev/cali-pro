import 'dart:ui';

import 'package:calibrum/components/app_scaffold.dart';
import 'package:calibrum/components/dashboard_card.dart';
import 'package:calibrum/constants/constant.dart';
import 'package:calibrum/helper/responsive.dart';
import 'package:calibrum/widget/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../my_flutter_app_icons.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  double windowWidth = 0;
  double windowHeight = 0;
  TabController _tabController;
  int index = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: newBody,
      subHeader: subHeader(),
    );
  }

  Widget subHeader() {
    return Container(
      height: 50,
      color: Colors.white,
      child: Center(
        child: TabBar(
          controller: _tabController,
          labelColor: headerDarkBG,
          unselectedLabelColor: headerDarkBG,
          isScrollable: true,
          indicatorColor: headerDarkBG,
          tabs: [
            Tab(
              child: Text(
                'Dashboard',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            Tab(
              child: Text(
                'Lorem Ipusm',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            Tab(
              child: Text(
                'Lorem Ipusm',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }

  customTab(String title) {
    return Tab(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
              color:
                  _tabController.index == index ? headerLightBG : headerDarkBG,
              width: 1),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ),
      ),
    );
  }

  get newBody {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;
    Widget otherWidget;

    if (Responsive.isDesktop(context)) {
      otherWidget = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 6, child: surveyQuestion()),
          SizedBox(
            width: 20,
          ),
          Expanded(flex: 4, child: totalUsersSurveys()),
        ],
      );
    } else {
      otherWidget = Column(children: [
        surveyQuestion(),
        SizedBox(height: 20),
        totalUsersSurveys(),
      ]);
    }
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: [dashboardSecond, dashboardBG],
            begin: Alignment.topCenter,
            end: Alignment.center,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: ListView(
        padding: EdgeInsets.all(
            Responsive.isDesktop(context) ? defaultPadding : padding_10),
        children: [
          headerWithIcon(MyFlutterApp.custom_tachometer, "Dashboad", context),
          SizedBox(
            height: 10,
          ),
          totalGridWidget(),
          SizedBox(
            height: 20,
          ),
          otherWidget,
        ],
      ),
    );
  }

  Widget surveyQuestion() {
    return Container(
      height: Responsive.isDesktop(context) ? windowHeight - 340.0 : 500.0,
      width: double.infinity,
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(
                  Responsive.isDesktop(context) ? defaultPadding : padding_10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Survey Questions',
                    style: headerStye(),
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(
                        child: Responsive.isDesktop(context)
                            ? _surveyQuestionDesktop()
                            : _surveyQuestionMobile()),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: new LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Scrollbar(
                      isAlwaysShown: true,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  minWidth: constraints.maxWidth),
                              child: showData()),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle headerStye() {
    return TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
  }

  Widget _surveyQuestionDesktop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomElevatedButton(
          title: '+ Add New',
          backgroundColor: headerButtonBG,
          width: Responsive.isMobile(context) ? 80.0 : 120.0,
          height: 30.0,
        ),
      ],
    );
  }

  Widget _surveyQuestionMobile() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Text('50 Records'),
        // SizedBox(width: 10.0),
        CustomElevatedButton(
          title: '+ Add New',
          backgroundColor: headerButtonBG,
          width: 90.0,
          height: 30.0,
        ),
      ],
    );
  }

  Widget totalUsersSurveys() {
    return Container(
      height: Responsive.isDesktop(context) ? windowHeight - 450.0 : 300.0,
      width: double.infinity,
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(
                  Responsive.isDesktop(context) ? defaultPadding : padding_10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 0.8,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    children: [
                      Text(
                        'Total Users Surveys',
                        style: headerStye(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: SfCartesianChart(
                  tooltipBehavior: TooltipBehavior(enable: true),
                  primaryXAxis: CategoryAxis(),
                  series: <ChartSeries>[
                    LineSeries<SalesData, String>(
                        dataSource: [
                          SalesData('Mon', 10),
                          SalesData('Tue', 20),
                          SalesData('Mon', 30),
                          SalesData('Wed', 40),
                          SalesData('Thu', 60),
                          SalesData('Fri', 45),
                          SalesData('Sat', 25),
                          SalesData('Sun', 50),
                        ],
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget totalGridWidget() {
    double _crossAxisSpacing = Responsive.isMobile(context) ? 0.0 : 30.0,
        _mainAxisSpacing = 10.0;
    int _crossAxisCount = Responsive.isMobile(context) ? 1 : 2;
    var cellHeight = Responsive.isMobile(context) ? 80 : 70;
    double screenWidth = MediaQuery.of(context).size.width;

    var width = (screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var _aspectRatio1 = width / cellHeight;

    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: dashboardCount.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _crossAxisCount,
        crossAxisSpacing: _crossAxisSpacing,
        mainAxisSpacing: _mainAxisSpacing,
        childAspectRatio: _aspectRatio1,
      ),
      itemBuilder: (context, index) {
        var data = dashboardCount[index];
        print(data.toString());
        return DashboardCard(
          title: data['title'],
          totalCount: data['totalCount'],
          icon: data['icon'],
          press: () {},
        );
      },
    );
  }

  Widget showData() {
    return DataTable(
      columnSpacing: 30.0,
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Name',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
          ),
        ),
        DataColumn(
          label: Text(
            'Help Text',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
          ),
        ),
        DataColumn(
          label: Text(
            'Date',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
          ),
        ),
        DataColumn(
          label: Text(
            'Domain Name',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
          ),
        ),
        DataColumn(
          label: Text(
            'Sub Domain Name',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
          ),
        ),
        DataColumn(
          label: Text(''),
        ),
      ],
      rows: List.generate(
        20,
        (index) => DataRow(
          cells: <DataCell>[
            DataCell(
              Text('ExternalisingBehaviour', style: customTextStyle()),
            ),
            DataCell(
              Text('tantrum. Externalising behaviour might include.....',
                  style: customTextStyle()),
            ),
            DataCell(
              Text('22 June 2021', style: customTextStyle()),
            ),
            DataCell(
              Text('Outcomes related to behaviour', style: customTextStyle()),
            ),
            DataCell(
              Text('Lorem ipsum Lorem ipsum', style: customTextStyle()),
            ),
            DataCell(
              CustomIconButton(
                icon: Icons.more_vert,
                iconColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle customTextStyle() {
    return GoogleFonts.poppins(
      textStyle: TextStyle(fontSize: 14.0, color: Colors.black),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
