
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constant/paddings.dart';
import '../../../../constant/spacing.dart';
import '../../../../constant/styles/app_textstyles.dart';
import '../../../../constant/styles/colors.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  String url = "https://ditllcae.com ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: cBlack,
            )),
        backgroundColor: colorWhite,
        title: Text(
          "Privacy Policy",
          style: hsmall.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: padA5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Who we are",
                      style: hMediumX,
                  ),
                  vSpac6,
                  Row(
                    children: [
                      Text(
                        "Our website address is: ",
                        style: hsmall,
                      ),
                      InkWell(
                          onTap: () {
                            launch(url);
                          },
                          child: Text(
                            "https://ditllcae.com ",
                            style: hsmall.copyWith(color: cRed),
                          )),
                    ],
                  ),
                  vSpac10,
                  Text(
                    "Comments",
                      style: hMediumX,
                  ),
                  vSpac6,
                  Text(
                    "When visitors leave comments on the site, we collect the data shown in the comments form and the visitor’s IP address and browser user agent string to help spam detection..",
                    style: hsmall,
                  ),
                  vSpac10,
                  Text(
                    "Media",
                      style: hMediumX,
                  ),
                  vSpac6,
                  Text(
                    "If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.",
                    style: hsmall,
                  ),
                  vSpac10,
                  Text(
                    "Cookies",
                      style: hMediumX,
                  ),
                  vSpac6,
                  Text(
                    "If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.",
                    style: hsmall,
                  ),
                  vSpac6,
                  Text(
                    "If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.",
                    style: hsmall,
                  ),
                  vSpac6,
                  Text(
                    "When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select “Remember Me”, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.",
                    style: hsmall,
                  ),
                  vSpac6,
                  Text(
                    "If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.",
                    style: hsmall,
                  ),
                  vSpac10,
                  Text(
                    "Embedded content from other websites",
                      style: hMediumX,
                  ),
                  vSpac6,
                  Text(
                    "Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.",
                    style: hsmall,
                  ),
                  vSpac6,
                  Text(
                    "These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.",
                    style: hsmall,
                  ),
                  vSpac10,
                  Text(
                    "Who we share your data with",
                      style: hMediumX,
                  ),
                  vSpac6,
                  Text(
                    "If you request a password reset, your IP address will be included in the reset email.",
                    style: hsmall,
                  ),
                  vSpac10,
                  Text(
                    "How long we retain your data",
                      style: hMediumX,
                  ),
                  vSpac6,
                  Text("If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.",style: hsmall,)
               ,vSpac6,
                  Text("For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.",style: hsmall,)
               , vSpac10,
                  Text(
                    "What rights you have over your data",
                      style: hMediumX,
                  ),
                  vSpac6,
                  Text("If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.",style: hsmall,)
               ,
                  vSpac10,
                  Text(
                    "Where your data is sent",
                      style: hMediumX,
                  ),
                  vSpac6,
                  Text("Visitor comments may be checked through an automated spam detection service.",style: hsmall,),
                  vSpac6,
                  Text(""),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
