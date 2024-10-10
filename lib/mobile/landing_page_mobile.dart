import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webpage/components.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  urlLauncher(String imgPath, String url) {
    return IconButton(
      icon: SvgPicture.asset(imgPath, color: Colors.black, width: 35.0),
      onPressed: () async {
        final Uri uri = Uri.parse(url);
        await launchUrl(uri);
      },
    );
  }

  tealContainer(String text) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.tealAccent,
            style: BorderStyle.solid,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(5.0)),
      padding: EdgeInsets.all(7.0),
      child: Text(
        text,
        style: GoogleFonts.openSans(fontSize: 15.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(size: 35.0, color: Colors.black),
      ),
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DrawerHeader(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2.0, color: Colors.black)),
                child: Image.asset("assets/image-circle.png"),
              ),
            ),
            TabsMobile(text: "Home", route: '/'),
            SizedBox(height: 20.0),
            TabsMobile(text: "Works", route: "/works"),
            SizedBox(height: 20.0),
            TabsMobile(text: "Blog", route: "/blog"),
            SizedBox(height: 20.0),
            TabsMobile(text: "About", route: "/about"),
            SizedBox(height: 20.0),
            TabsMobile(text: "Contact", route: "/contact"),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                urlLauncher(
                    "assets/instagram.svg", "https://www.instagram.com"),
                urlLauncher("assets/twitter.svg", "https://www.twitter.com"),
                urlLauncher("assets/github.svg", "https://www.github.com"),
              ],
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          CircleAvatar(
            radius: 117.0,
            backgroundColor: Colors.tealAccent,
            child: CircleAvatar(
              radius: 110.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/image-circle.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0))),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: SansBold("Hello I'm", 15.0),
                    ),
                    SansBold("Gayathri Immidisetti", 40.0),
                    Sans("Flutter Developer", 20.0)
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 3.0,
                      children: [
                        Icon(Icons.email),
                        Icon(Icons.call),
                        Icon(Icons.location_pin),
                      ],
                    ),
                    SizedBox(width: 40.0),
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 9.0,
                      children: [
                        Sans("Gayathri immidisetti", 15.0),
                        Sans("7680980757", 15.0),
                        Sans("Hyderabad", 15.0),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 90.0),
          //About me  second section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SansBold("About Me", 35.0),
                Sans(
                    "Hello I'm Gayathri immidisetti .I'm specialised in flutter development",
                    15.0),
                Sans("I strive to ensure astounding performance with state of",
                    15.0),
                Sans("The art security for Andruiod,Ios,Web,Mac,linux", 15.0),
                SizedBox(height: 10.0),
                Wrap(
                  spacing: 7.0,
                  runSpacing: 7.0,
                  children: [
                    tealContainer("Flutter"),
                    tealContainer("Firebase"),
                    tealContainer("Andriod"),
                    tealContainer("Windows"),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 60.0),
          //Third Section What I do
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SansBold("What I do", 35.0),
              AnimatedCard(
                imagePath: "assets/webL.png",
                text: "Web Development",
                width: 300.0,
              ),
              SizedBox(height: 60.0),
              AnimatedCard(
                imagePath: "assets/firebase.png",
                text: "BackEnd Development",
                width: 300.0,
              ),
              SizedBox(height: 60.0),
              AnimatedCard(
                imagePath: "assets/app.png",
                text: "App Development",
                width: 300.0,
              ),
              SizedBox(height: 60.0),
              //Contact fourth section
              Wrap(
                runSpacing: 20.0,
                spacing: 20.0,
                alignment: WrapAlignment.center,
                children: [
                  SansBold("Contact Me", 30.0),
                  TextForm(
                      text: "First Name",
                      Containerwidth: widthDevice / 1.4,
                      hintText: "Enter your first name"),
                  TextForm(
                      text: "Last Name",
                      Containerwidth: widthDevice / 1.4,
                      hintText: "Enter your Last Name"),
                  TextForm(
                      text: "Email",
                      Containerwidth: widthDevice / 1.4,
                      hintText: "Enter your email address"),
                  TextForm(
                      text: "Phone number",
                      Containerwidth: widthDevice / 1.4,
                      hintText: "Enter your phone number"),
                  TextForm(
                    text: "Message",
                    Containerwidth: widthDevice / 1.4,
                    hintText: "Enter your Message",
                    maxLines: 10,
                  ),
                  MaterialButton(
                      elevation: 20.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      height: 60.0,
                      minWidth: widthDevice / 2.2,
                      color: Colors.tealAccent,
                      child: SansBold("Submit", 20.0),
                      onPressed: () {})
                ],
              ),
              SizedBox(height: 20.0)
            ],
          )
        ],
      ),
    );
  }
}
