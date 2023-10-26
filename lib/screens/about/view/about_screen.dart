
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/fonts_strings.dart';
import '../../../constant/image_assets.dart';
import '../../../constant/paddings.dart';
import '../../../constant/spacing.dart';
import '../../../constant/styles/app_textstyles.dart';
import '../../../constant/styles/colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: cBlack,)),
        elevation: 0,
        backgroundColor: colorWhite,
        title: SizedBox(
          width: 60.w,
          child: Image.asset(
            ImageAssests.logoImge.toString(),
            fit: BoxFit.cover,
          ),
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              "https://deltastore.ae/wp-content/uploads/2023/09/About-Us-Banner.png",
            ),
            vSpac12,
            Padding(
              padding: padA1,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About Us",
                        style: hMediumX,
                      ),
                      vSpac10,
                      Text(
                        "At DIT, we collaborate with \ndiverse communities and s\ntrive ahead to develop both\n our environment and com\nmunity. We aim at rebalan\ncing our future resources. \nWe are a value-driven org\nanization and thrive to ma\nke significant contributions\n towards development goals \nand bring a positive impact o\nn the lives of people through\n sustainable long-term programs",
                        style: hMediumX.copyWith(
                            fontSize: 12, fontFamily: nexalight),
                      ),
                    ],
                  ),
                  hSpac20,
                  SizedBox(
                    height: 120,
                    width: 100,
                    child: Image.network(
                      'https://ditllcae.com/wp-content/uploads/2022/12/admin-ajax.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            vSpac12,
            Padding(
              padding: padA1,
              child: Row(
                children: [
                  SizedBox(
                    height: 120,
                    width: 100,
                    child: Image.network(
                      'https://ditllcae.com/wp-content/uploads/2023/01/Untitled-design-1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  hSpac20,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mission:",
                        style: hMediumX,
                      ),
                      vSpac10,
                      SizedBox(
                        width: 64.w,
                        child: Text(
                          "At “DELTA” we give 2nd Life to End of life IT devices, making technology affordable, and Accepting environmental challenges. DIT mission is to be with the global effort to help the environment, Supply IT Products with a Combination of Quality & innovation at great prices. Sustainable climate-friendly Electronic recycling is one of the greatest challenges of our time. We are excited to be able to contribute as Solution–Delta Refurbished Center Reduce e-waste >Renew >Reuse > be prudent> by offering our refurbished products and services that can combine performance and reasonable pricing, we aim to provide excellent service to our customers and build long-term relationships with them. We aim at rebalancing our future resources. We are a value-driven organization and thrive to make significant contributions towards development goals and bring a positive impact on the lives of people through sustainable long-term programs.",
                          style: hMediumX.copyWith(
                              fontSize: 12, fontFamily: nexalight),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            vSpac12,
            Padding(
              padding: padA1,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Our Vision",
                        style: hMediumX,
                      ),

                      Container(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            Row(

                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      width: 69.w,
                                      child: Text(
                                        "Our vision is to be the largest sustainable and environmentally friendly Electronic repair, reuse, and recycler in the Middle East."

                                       ,
                                        style: hMediumX.copyWith(
                                            fontSize: 12, fontFamily: nexalight),
                                      ),
                                    ),
                                    vSpac6,
                                    SizedBox(
                                      width: 69.w,
                                      child: Text(
                                        "Integrity in our processes of data sanitization, repair, and test of computers and other electronic devices."

                                       ,
                                        style: hMediumX.copyWith(
                                            fontSize: 12, fontFamily: nexalight),
                                      ),
                                    ),
                                    vSpac6,
                                    SizedBox(
                                      width: 69.w,
                                      child: Text(
                                        "Employing only competent personal for our purposes."

                                       ,
                                        style: hMediumX.copyWith(
                                            fontSize: 12, fontFamily: nexalight),
                                      ),
                                    ),
                                    vSpac6,
                                    SizedBox(
                                      width: 69.w,
                                      child: Text(
                                        "Complying with the legal requirements related to the Environment, Health and Safety. "

                                       ,
                                        style: hMediumX.copyWith(
                                            fontSize: 12, fontFamily: nexalight),
                                      ),
                                    ),
                                    vSpac6,
                                    SizedBox(
                                      width: 69.w,
                                      child: Text(
                                        "Preventing pollution."

                                        ,
                                        style: hMediumX.copyWith(
                                            fontSize: 12, fontFamily: nexalight),
                                      ),
                                    ),
                                    vSpac6,
                                    SizedBox(
                                      width: 69.w,
                                      child: Text(
                                        " Preventing work place injuries and ill health."

                                        ,
                                        style: hMediumX.copyWith(
                                            fontSize: 12, fontFamily: nexalight),
                                      ),
                                    ),
                                    vSpac6,
                                    SizedBox(
                                      width: 69.w,
                                      child: Text(
                                        "Striving Providing a comfortable working environment to our team of employees and nurturing their growth."

                                        ,
                                        style: hMediumX.copyWith(
                                            fontSize: 12, fontFamily: nexalight),
                                      ),
                                    ),
                                    vSpac6,
                                    SizedBox(
                                      width: 69.w,
                                      child: Text(
                                        "Striving for continual improvement."

                                        ,
                                        style: hMediumX.copyWith(
                                            fontSize: 12, fontFamily: nexalight),
                                      ),
                                    ),
                        ],
                                ),

                              ],
                            ),


                          ],
                        ),
                      ),
                    ],
                  ),
                  hSpac14,

                  SizedBox(
                    height: 120,
                    width: 50,
                    child: Image.network(
                      'https://ditllcae.com/wp-content/uploads/2023/01/who-we-are-top-image_1360x765.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),


                ],
              ),
            ),
            vSpac12,
            Padding(
              padding: padA1,
              child: Row(
                children: [
                  SizedBox(
                    height: 120,
                    width: 100,
                    child: Image.network(
                      'https://ditllcae.com/wp-content/uploads/2022/12/image-008-466x500-1-280x300-2.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  hSpac20,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About Dit,What do we do?",
                        style: hMediumX,
                      ),
                      vSpac10,
                      SizedBox(
                        width: 60.w,
                        child: Text(
                          "DIT specializes in used and refurbished laptops, computers, and parts like hard drives, RAM, and computer accessories. A large volume of our products is exported to customers worldwide. We give strong emphasis on the quality of products and work with complete determination. Our dedication, reliability, and tested products have built trusted relationships with our customers and made them our repeated buyers. We focus on customer service and want them to be pleased with our product’s service. We stand behind everything we sell. Our success depends on your repeat demands for our products and services. Our refurbished laptops are guaranteed, greatly functional, and can be availed at reasonable rates. visit our store ",
                          style: hMediumX.copyWith(
                              fontSize: 12, fontFamily: nexalight),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            vSpac12,
            Padding(
              padding: padA1,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      Container(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            Row(

                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      width: 69.w,
                                      child: Text(
                                        "Refurbished servers and server accessories"

                                        ,
                                        style: hMediumX.copyWith(
                                            fontSize: 12, fontFamily: nexalight),
                                      ),
                                    ),
                                    vSpac6,
                                    SizedBox(
                                      width: 69.w,
                                      child: Text(
                                        "Refurbished computers and accessories"

                                        ,
                                        style: hMediumX.copyWith(
                                            fontSize: 12, fontFamily: nexalight),
                                      ),
                                    ),
                                    vSpac6,
                                    SizedBox(
                                      width: 69.w,
                                      child: Text(
                                        "Refurbished laptops"

                                        ,
                                        style: hMediumX.copyWith(
                                            fontSize: 12, fontFamily: nexalight),
                                      ),
                                    ),
                                    vSpac6,
                                    SizedBox(
                                      width: 69.w,
                                      child: Text(
                                        "Customize Kiosk solution"

                                        ,
                                        style: hMediumX.copyWith(
                                            fontSize: 12, fontFamily: nexalight),
                                      ),
                                    ),
                                    vSpac6,
                                    SizedBox(
                                      width: 69.w,
                                      child: Text(
                                        "Networking equipment as well as other accessories"

                                        ,
                                        style: hMediumX.copyWith(
                                            fontSize: 12, fontFamily: nexalight),
                                      ),
                                    ),
                                    vSpac6,
                                    SizedBox(
                                      width: 69.w,
                                      child: Text(
                                        " Refurbished printers"

                                        ,
                                        style: hMediumX.copyWith(
                                            fontSize: 12, fontFamily: nexalight),
                                      ),
                                    ),
                                    vSpac6,
                                    SizedBox(
                                      width: 69.w,
                                      child: Text(
                                        "Software design and development"

                                        ,
                                        style: hMediumX.copyWith(
                                            fontSize: 12, fontFamily: nexalight),
                                      ),
                                    ),
                                    vSpac6,
                                    SizedBox(
                                      width: 69.w,
                                      child: Text(
                                        "Maintaining and repairing"

                                        ,
                                        style: hMediumX.copyWith(
                                            fontSize: 12, fontFamily: nexalight),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),


                          ],
                        ),
                      ),
                    ],
                  ),
                  hSpac14,

                  SizedBox(
                    height: 120,
                    width: 50,
                    child: Image.network(
                      'https://deltastore.ae/wp-content/uploads/2022/12/Page-6-Image-18.png',
                      fit: BoxFit.cover,
                    ),
                  ),


                ],
              ),
            ),
            vSpac12,
            Column(
              children: [
                Text("About Our partners:", style: hMediumX,),
                Column(
                  children: [
                    Padding(
                     padding: padA1,
                      child: Text("Delta International Trd. (DIT).is a new division formed by joined efforts of “Delta Office Automation”(DOA) and Circuit Computer (CC). DOA or delta office automation is a name associated with banking equipment and print management solution in UAE. It has a strong foundation having qualified, experienced and competent individuals with more than 20years of experience in the field of office automation. Circuit computer (CC) is a UAE-based company since 1999 with an interest in information technology. The CC team is a genuine mix of talent and diversified experience that has successfully developed and implemented – the complete ERP solutions for financial institutions and medium scale businesses. For more contact us", style: hMediumX.copyWith(
                          fontSize: 12, fontFamily: nexalight),
                      ),
                    ),
                  ],
                )
              ],
            ),
            vSpac12,
            Column(
              children: [
                Text("Our refurbished Laptops & Computers:",  style: hMediumX,),
                Column(
                  children: [
                    Padding(
                      padding: padA1,
                      child: Text("Source all range of hardware to facilitate need from every walk of life. Solutions for a home or business to heavy professional workload or Server and networking equipment. DTI with its diverse dictated resources has established and developed a modern refurbishment center to renew products that can guarantee same performance and condition as good as it manufactured first time . We offer productsthat can ultimately help our customers and partners to achieve there IT goals. visit us", style: hMediumX.copyWith(
                          fontSize: 12, fontFamily: nexalight),
                      ),
                    ),
                  ],
                )
              ],
            ),
            vSpac12,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: SizedBox(
                    height: 120,
                    width: 43.w,
                    child: Image.network(
                      'https://deltastore.ae/wp-content/uploads/2022/12/ayoola-salako-BPZX9pTacXE-unsplash-1536x864-1-1024x576-1.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                hSpac7,
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: SizedBox(
                    height: 120,
                    width: 43.w,
                    child: Image.network(
                      'https://deltastore.ae/wp-content/uploads/2022/12/wonderlane-FkHpejze0C4-unsplash-1536x864-1-1024x576-1.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                vSpac12,
                const Text(''),
              ],
            )
          ],
        ),
      ),
    );
  }
}
