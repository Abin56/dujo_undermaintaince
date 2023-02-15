
import 'package:dujo_website/view/fonts/fonts.dart';
import 'package:flutter/material.dart';

import '../../../colors/colors.dart';
import '../../../constants/const.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 680,
      width: double.infinity,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 400,
            width: double.infinity,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Company',
                              style:
                                  GoogleFont.miniHeadTextStyleBold,
                            ),
                            Text('Who We Are',),
                            Text('Why Choose Us'),
                            Text('Blog'),
                            Text('Contact Us'),
                          ],
                        ),
                        Column(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sevices',
                              style:
                                  GoogleFont.miniHeadTextStyleBold,
                            ),
                            Text('Mobile App Development'),
                            Text('iOS App Development'),
                            Text('Android App Development'),
                            Text('Wordpress Development'),
                            Text('Custom Development'),
                          ],
                        ),
                        Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Solutions',
                              style:
                                  GoogleFont.miniHeadTextStyleBold,
                            ),
                            Text('On demand App Solution'),
                            Text('Photo Editing App Solution'),
                            Text('Taxi Booking App'),
                            Text('Fleet Management'),
                            Text('Photo Editing App'),
                          ],
                        ),
                        Column(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Enterprise',
                              style:
                                  GoogleFont.miniHeadTextStyleBold,
                            ),
                            Text('Enterprise Mobility'),
                            Text('Custom Solution'),
                            Text('Healthcare Apps'),
                            Text('B2B'),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            color: Color(0xFF26A69A),
          ),
          Container(
            height: 200,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 200,
                    width: 300,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://firebasestorage.googleapis.com/v0/b/leptonscipro-31792.appspot.com/o/files%2Fimages%2FLepton-removebg-preview.png?alt=media&token=cb2cbd20-7630-4681-8857-f8b245018453'))),
                  ),
                  Text(
                    'Lepton Plus Communications is a customer oriented company offering digital solutions in Healthcare, E-Commerce Applications,\nHome Automation and Social Networking. We are committed to\n providing high end sustainable products and services that\nenhances the quality of life',
                    style: GoogleFont.normalHeadTextStyle,
                  )
                ],
              ),
            ),
          ),
          Container(
            color: cBlack,
            height: 60,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Copyright ©️ All rights reserved | by LeptonCommunications",
                  style: GoogleFont.miniHeadTextStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
