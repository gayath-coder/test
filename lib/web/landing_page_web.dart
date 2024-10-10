import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:webpage/components.dart'; // Added this import for GoogleFonts

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  final _formKey = GlobalKey<FormState>(); // GlobalKey to access the form state

  // Validator methods for each field
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? validateMessage(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a message';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, do the submission logic here
      print("Form is valid");
    } else {
      print("Form is invalid");
    }
  }

  urlLauncher(String imgPath, String url) {
    return IconButton(
      icon: SvgPicture.asset(imgPath, color: Colors.black, width: 35),
      onPressed: () async {
        final Uri uri = Uri.parse(url);
        await launchUrl(uri);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 72,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/flower.jpg"),
              ),
            ),
            SizedBox(height: 15.0),
            SansBold("Gayathri", 30.0),
            SizedBox(height: 15.0),
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          size: 25.0,
          color: Colors.black,
        ),
        title: Row(
          children: [
            Spacer(flex: 3),
            TabsWeb(route: "/", title: "Home"),
            Spacer(),
            TabsWeb(route: "/works", title: "Works"),
            Spacer(),
            TabsWeb(route: "/blog", title: "Blog"),
            Spacer(),
            TabsWeb(route: "/about", title: "About"),
            Spacer(),
            TabsWeb(route: "/contact", title: "Contact"),
            Spacer(),
          ],
        ),
      ),
      body: ListView(
        children: [
          // First Page
          Container(
            height: heightDevice - 56, // Adjust if needed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          )),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: SansBold("Hello I'm", 15.0),
                    ),
                    SizedBox(height: 15.0),
                    SansBold("Gayathri Immidisetti", 55.0),
                    Sans("Mobile Application Developer", 30.0),
                    SizedBox(height: 15.0),
                    Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(width: 20),
                        Sans("imagayathri1234@gmail.com", 15.0),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.call),
                        SizedBox(width: 20),
                        Sans("7680980756", 15.0),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.location_pin),
                        SizedBox(width: 20),
                        Sans("Hyderabad", 15.0),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                SizedBox(
                    width:
                        20), // Add space between Column and CircleAvatar if needed
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 147.0,
                      backgroundColor: Colors.tealAccent,
                      child: CircleAvatar(
                        radius: 143.0,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          radius: 140.0,
                          backgroundColor: Colors.pink,
                          backgroundImage:
                              AssetImage("assets/image-circle.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Second Page
          Container(
            height: heightDevice / 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/web (1).jpg", height: widthDevice / 1.9),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold("About me", 40.0),
                    SizedBox(height: 15),
                    Sans(
                        "Hello! I'm Gayathri Immidisetti I specialized in flutter development",
                        15),
                    Sans(
                        "I strive to ensure outstanding performance with state of",
                        15),
                    Sans("The art security for Android ,Ios,Web,Mac,Linux", 15),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.tealAccent,
                                  style: BorderStyle.solid,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(5.0)),
                          padding: EdgeInsets.all(7.0),
                          child: Sans("Fultter", 15.0),
                        ),
                        SizedBox(width: 7.0),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.tealAccent,
                                  style: BorderStyle.solid,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(5.0)),
                          padding: EdgeInsets.all(7.0),
                          child: Sans("Firebase", 15.0),
                        ),
                        SizedBox(width: 7.0),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.tealAccent,
                                  style: BorderStyle.solid,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(5.0)),
                          padding: EdgeInsets.all(7.0),
                          child: Sans("Andriod", 15.0),
                        ),
                        SizedBox(width: 7.0),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.tealAccent,
                                  style: BorderStyle.solid,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(5.0)),
                          padding: EdgeInsets.all(7.0),
                          child: Sans("Ios", 15.0),
                        ),
                        SizedBox(width: 7.0),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.tealAccent,
                                  style: BorderStyle.solid,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(5.0)),
                          padding: EdgeInsets.all(7.0),
                          child: Sans("Windows", 15.0),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          // Fourth Section: Contact Me
          Container(
            height: heightDevice,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold("Contact me", 40),
                Form(
                  key: _formKey, // Assigning the form key
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          // First Name field
                          TextForm(
                            Containerwidth: 350,
                            text: "First Name",
                            hintText: "Please type your first name",
                            validator: validateName, // Add validation
                          ),
                          SizedBox(height: 15),
                          // Email field
                          TextForm(
                            text: "Email",
                            Containerwidth: 350,
                            hintText: "Please Enter your Email address",
                            validator: validateEmail, // Add validation
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          // Last Name field
                          TextForm(
                            text: "Last Name",
                            Containerwidth: 350,
                            hintText: "Please type your last name",
                            validator: validateName, // Add validation
                          ),
                          SizedBox(height: 15),
                          // Phone Number field
                          TextForm(
                            text: "Phone number",
                            Containerwidth: 350,
                            hintText: "Please type your phone number",
                            validator: validatePhone, // Add validation
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                // Message field
                TextForm(
                  text: "Message",
                  Containerwidth: widthDevice / 1.5,
                  hintText: "Please type your Message",
                  maxLines: 10,
                  validator: validateMessage, // Add validation
                ),
                // Submit button
                MaterialButton(
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  height: 60.0,
                  minWidth: 200.0,
                  color: Colors.tealAccent,
                  child: SansBold("Submit", 20.0),
                  onPressed: _submitForm, // Trigger form submission
                )
              ],
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

//
// class Sans extends StatelessWidget {
//   final String text;
//   final double size;
//   const Sans(this.text, this.size);
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: GoogleFonts.openSans(fontSize: size, color: Colors.black),
//     );
//   }
// }
//
// class SansBold extends StatelessWidget {
//   final String text;
//   final double size;
//   const SansBold(this.text, this.size);
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style:
//       GoogleFonts.openSans(fontSize: size, fontWeight: FontWeight.bold),
//     );
//   }
// }
//
// class TabsWeb extends StatelessWidget {
//   final String route;
//   final String title;
//
//   const TabsWeb({
//     required this.route,
//     required this.title,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(context, route);
//       },
//       child: SansBold(title, 15.0),
//     );
//   }
// }
