import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_jobfinder_app/SizeConfig.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: SplashScreen(),
        );
      });
    });
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 7 * SizeConfig.heightMultiplier,
                  left: 5 * SizeConfig.widthMultiplier),
              child: Icon(
                Icons.menu,
                color: Colors.black,
                size: 6 * SizeConfig.imageSizeMultiplier,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: 2 * SizeConfig.heightMultiplier,
                    left: 5 * SizeConfig.widthMultiplier),
                child: Text(
                  "Hi Jonas, Find your\nDream Job",
                  style: GoogleFonts.nunitoSans(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      fontSize: 3.5 * SizeConfig.textMultiplier),
                )),
            Padding(
              padding: EdgeInsets.only(
                top: 4 * SizeConfig.heightMultiplier,
                left: 5 * SizeConfig.widthMultiplier,
                right: 5 * SizeConfig.widthMultiplier,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3 * SizeConfig.widthMultiplier,
                            vertical: 2 * SizeConfig.heightMultiplier),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 5 * SizeConfig.imageSizeMultiplier,
                            ),
                            SizedBox(
                              width: 1.5 * SizeConfig.widthMultiplier,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: search,
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.blue,
                                style: GoogleFonts.nunitoSans(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 1.6 * SizeConfig.textMultiplier),
                                decoration: InputDecoration.collapsed(
                                    hintText: "Search",
                                    hintStyle: TextStyle(
                                        fontSize:
                                        1.7 * SizeConfig.textMultiplier,
                                        color: Colors.grey)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2 * SizeConfig.widthMultiplier,
                  ),
                  Container(
                    width: 12.5 * SizeConfig.widthMultiplier,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue.withOpacity(0.05)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Icon(
                        Icons.sort,
                        color: Colors.black,
                        size: 6 * SizeConfig.imageSizeMultiplier,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 2 * SizeConfig.heightMultiplier,
                  left: 5 * SizeConfig.widthMultiplier),
              child: Row(
                children: [
                  _category("Product"),
                  SizedBox(
                    width: 2 * SizeConfig.widthMultiplier,
                  ),
                  _category("Design"),
                  SizedBox(
                    width: 2 * SizeConfig.widthMultiplier,
                  ),
                  _category("Google"),
                ],
              ),
            ),
            SizedBox(
              height: 7 * SizeConfig.heightMultiplier,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40.0)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 5 * SizeConfig.widthMultiplier,
                    vertical: 2 * SizeConfig.heightMultiplier),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Popular Job",
                          style: GoogleFonts.nunitoSans(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                              fontSize: 2.4 * SizeConfig.textMultiplier),
                        ),
                        Spacer(),
                        Text(
                          "show All",
                          style: GoogleFonts.nunitoSans(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                              fontSize: 1.8 * SizeConfig.textMultiplier),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4 * SizeConfig.heightMultiplier,
                    ),
                    Container(
                      height: 23 * SizeConfig.heightMultiplier,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _jobs("Design System Developer"),
                          SizedBox(
                            width: 4 * SizeConfig.widthMultiplier,
                          ),
                          GestureDetector(
                            onTap: () {
                              openBottomSheet();
                            },
                            child: _jobs("Visual Designer"),
                          ),
                          SizedBox(
                            width: 4 * SizeConfig.widthMultiplier,
                          ),
                          _jobs("Design System Develoepr"),
                          SizedBox(
                            width: 5 * SizeConfig.widthMultiplier,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4 * SizeConfig.heightMultiplier,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 4 * SizeConfig.heightMultiplier,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 5 * SizeConfig.widthMultiplier),
              child: Row(
                children: [
                  Text(
                    "Job Category",
                    style: GoogleFonts.nunitoSans(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                        fontSize: 2.4 * SizeConfig.textMultiplier),
                  ),
                  Spacer(),
                  Text(
                    "show All",
                    style: GoogleFonts.nunitoSans(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                        fontSize: 1.8 * SizeConfig.textMultiplier),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3 * SizeConfig.heightMultiplier,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5 * SizeConfig.widthMultiplier),
              child: Container(
                height: 7 * SizeConfig.heightMultiplier,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _jobCategory("Design\nJob", Colors.blue[50], Colors.blue),
                    SizedBox(
                      width: 3 * SizeConfig.widthMultiplier,
                    ),
                    _jobCategory("Development", Colors.red[50], Colors.red),
                    SizedBox(
                      width: 3 * SizeConfig.widthMultiplier,
                    ),
                    _jobCategory("Sales", Colors.orange[50], Colors.orange),
                    SizedBox(
                      width: 3 * SizeConfig.widthMultiplier,
                    ),
                    _jobCategory("Marketing", Colors.purple[50], Colors.purple),
                    SizedBox(
                      width: 3 * SizeConfig.widthMultiplier,
                    ),
                    _jobCategory("Engineer", Colors.teal[50], Colors.teal),
                    SizedBox(
                      width: 5 * SizeConfig.widthMultiplier,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 3 * SizeConfig.heightMultiplier,
            ),
          ],
        ),
      ),
    );
  }

  _category(String category) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          category,
          style: GoogleFonts.nunitoSans(
              color: Colors.blueGrey,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
              fontSize: 1.6 * SizeConfig.textMultiplier),
        ),
      ),
    );
  }

  _jobs(String job) {
    return Container(
      height: 23 * SizeConfig.heightMultiplier,
      width: 65 * SizeConfig.widthMultiplier,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25.0)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      "assets/images/google.png",
                      height: 5 * SizeConfig.imageSizeMultiplier,
                      width: 5 * SizeConfig.imageSizeMultiplier,
                    ),
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.favorite_border,
                  color: Colors.grey,
                  size: 6 * SizeConfig.imageSizeMultiplier,
                )
              ],
            ),
            SizedBox(
              height: 1 * SizeConfig.heightMultiplier,
            ),
            Text(
              "Google LLC",
              style: GoogleFonts.nunitoSans(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                  fontSize: 1.7 * SizeConfig.textMultiplier),
            ),
            SizedBox(
              height: 0.5 * SizeConfig.heightMultiplier,
            ),
            Text(
              job,
              style: GoogleFonts.nunitoSans(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                  fontSize: 1.7 * SizeConfig.textMultiplier),
            ),
            SizedBox(
              height: 0.5 * SizeConfig.heightMultiplier,
            ),
            Text(
              "Mountain View, California",
              style: GoogleFonts.nunitoSans(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                  fontSize: 1.7 * SizeConfig.textMultiplier),
            ),
            Text(
              "United States",
              style: GoogleFonts.nunitoSans(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                  fontSize: 1.7 * SizeConfig.textMultiplier),
            ),
          ],
        ),
      ),
    );
  }

  _jobCategory(String category, Color color1, Color color2) {
    return Container(
      decoration: BoxDecoration(
          color: color1, borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: 3 * SizeConfig.widthMultiplier),
        child: Center(
          child: Text(
            category,
            style: GoogleFonts.nunitoSans(
                color: color2,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                fontSize: 2 * SizeConfig.textMultiplier),
          ),
        ),
      ),
    );
  }

  void openBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return Container(
            color: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.only(top: 25 * SizeConfig.heightMultiplier),
              child: Container(
                height: 90 * SizeConfig.heightMultiplier,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 3 * SizeConfig.heightMultiplier,
                          horizontal: 4 * SizeConfig.widthMultiplier),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                            size: 5 * SizeConfig.imageSizeMultiplier,
                          ),
                          Spacer(),
                          Icon(
                            Icons.file_upload,
                            color: Colors.black,
                            size: 6 * SizeConfig.imageSizeMultiplier,
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Image.asset(
                            "assets/images/google.png",
                            height: 15 * SizeConfig.imageSizeMultiplier,
                            width: 15 * SizeConfig.imageSizeMultiplier,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2 * SizeConfig.heightMultiplier,
                    ),
                    Center(
                      child: Text(
                        "Visual Designer",
                        style: GoogleFonts.nunitoSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 4 * SizeConfig.textMultiplier),
                      ),
                    ),
                    SizedBox(
                      height: 1 * SizeConfig.heightMultiplier,
                    ),
                    Center(
                      child: Text(
                        "Google LLC/Mountain View",
                        style: GoogleFonts.nunitoSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 1.7 * SizeConfig.textMultiplier),
                      ),
                    ),
                    SizedBox(
                      height: 2 * SizeConfig.heightMultiplier,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 7 * SizeConfig.heightMultiplier,
                          decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3 * SizeConfig.widthMultiplier),
                            child: Center(
                              child: Text(
                                "Description",
                                style: GoogleFonts.nunitoSans(
                                    color: Colors.lightBlue,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                    fontSize: 2 * SizeConfig.textMultiplier),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 7 * SizeConfig.heightMultiplier,
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3 * SizeConfig.widthMultiplier),
                            child: Center(
                              child: Text(
                                "Company",
                                style: GoogleFonts.nunitoSans(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                    fontSize: 2 * SizeConfig.textMultiplier),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 7 * SizeConfig.heightMultiplier,
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3 * SizeConfig.widthMultiplier),
                            child: Center(
                              child: Text(
                                "Reviews",
                                style: GoogleFonts.nunitoSans(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                    fontSize: 2 * SizeConfig.textMultiplier),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2 * SizeConfig.heightMultiplier,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 4 * SizeConfig.widthMultiplier),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Minimum Qualifications",
                            style: GoogleFonts.nunitoSans(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                                fontSize: 2 * SizeConfig.textMultiplier),
                          ),
                          SizedBox(
                            height: 2 * SizeConfig.heightMultiplier,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 3.0,
                                  backgroundColor: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 2 * SizeConfig.widthMultiplier,
                              ),
                              Text(
                                "Bachelor's degree in design or\nequivalent practical experience",
                                style: GoogleFonts.nunitoSans(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                    fontSize: 1.7 * SizeConfig.textMultiplier),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1 * SizeConfig.heightMultiplier,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 3.0,
                                  backgroundColor: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 2 * SizeConfig.widthMultiplier,
                              ),
                              Text(
                                "Experience designing across\nmultiple platforms",
                                style: GoogleFonts.nunitoSans(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                    fontSize: 1.7 * SizeConfig.textMultiplier),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 10 * SizeConfig.heightMultiplier,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[200],
                                offset: Offset(-3, -3),
                                blurRadius: 10.0)
                          ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4 * SizeConfig.widthMultiplier),
                        child: Row(
                          children: [
                            Container(
                              height: 7.5 * SizeConfig.heightMultiplier,
                              width: 15 * SizeConfig.widthMultiplier,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.greenAccent, width: 3.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.greenAccent,
                                  size: 7 * SizeConfig.imageSizeMultiplier,
                                ),
                              ),
                            ),
                            SizedBox(width: 2 * SizeConfig.widthMultiplier,),
                            Expanded(
                              child: Container(
                                height: 7.5 * SizeConfig.heightMultiplier,
                                decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    borderRadius: BorderRadius.circular(20.0)
                                ),
                                child: Center(
                                    child: Text(
                                      "Apply Here",
                                      style: GoogleFonts.nunitoSans(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.5,
                                          fontSize: 2 *
                                              SizeConfig.textMultiplier
                                      ),
                                    ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
