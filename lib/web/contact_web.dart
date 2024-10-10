import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webpage/components.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({super.key});

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
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
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 72.0,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/image-circle.png"),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            SansBold("Gayathri", 30.0),
            SizedBox(
              height: 15.0,
            ),
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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 500.0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(size: 25.0, color: Colors.black),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/contact_image.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
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
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.0,
              ),
              SansBold("Contact me", 40.0),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      TextForm(
                          Containerwidth: 350,
                          text: "First Name",
                          hintText: "Please type your first name"),
                      SizedBox(height: 15),
                      TextForm(
                          text: "Email",
                          Containerwidth: 350,
                          hintText: "Please Enter your Email address"),
                    ],
                  ),
                  Column(
                    children: [
                      TextForm(
                          text: "Last Name",
                          Containerwidth: 350,
                          hintText: "Please type your last name"),
                      SizedBox(height: 15),
                      TextForm(
                          text: "Phone number",
                          Containerwidth: 350,
                          hintText: "please type your phone number"),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              TextForm(
                text: "message",
                Containerwidth: widthDevice / 1.5,
                hintText: "Enter your message",
                maxLines: 10,
              ),
              SizedBox(
                height: 20.0,
              ),
              MaterialButton(
                onPressed: () {},
                elevation: 20.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                height: 60.0,
                minWidth: 200.0,
                color: Colors.tealAccent,
                child: SansBold("Submit", 20.0),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
