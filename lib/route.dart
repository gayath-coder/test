import 'package:flutter/material.dart';
import 'package:webpage/mobile/about_mobile.dart';
import 'package:webpage/mobile/blog_mobile.dart';
import 'package:webpage/mobile/contact_mobile.dart';
import 'package:webpage/mobile/landing_page_mobile.dart';
import 'package:webpage/mobile/works_mobile.dart';
import 'package:webpage/web/about_web.dart';
import 'package:webpage/web/blog_web.dart';
import 'package:webpage/web/contact_web.dart';
import 'package:webpage/web/landing_page_web.dart';
import 'package:webpage/web/works_web.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return LandingPageWeb();
              } else
                return LandingPageMobile();
            },
          ),
        );
      case '/contact':
        return MaterialPageRoute(
            builder: (_) => LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return ContactWeb();
                  } else {
                    return ContactMobile();
                  }
                }),
            settings: settings);
      case '/about':
        return MaterialPageRoute(
            builder: (_) => LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return AboutWeb();
                  } else {
                    return AboutMobile();
                  }
                }),
            settings: settings);
      case '/blog':
        return MaterialPageRoute(
            builder: (_) => LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return BlogWeb();
                  } else {
                    return BlogMobile();
                  }
                }),
            settings: settings);
      case '/works':
        return MaterialPageRoute(
            builder: (_) => LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return WorksWeb();
                  } else {
                    return WorksMobile();
                  }
                }),
            settings: settings);
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return LandingPageWeb();
              } else
                return LandingPageMobile();
            },
          ),
        );
    }
  }
}
