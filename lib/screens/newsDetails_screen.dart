import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //! Main Column: Holds image + white text container
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //! Background image
                Image.asset(
                  'assets/images/1b253b61593c0eac981b4da390568868d72bc803.png',
                  width: 375.w,
                  height: 400.h,
                  fit: BoxFit.cover,
                ),

                //! News content container
                Transform.translate(
                  offset: Offset(0, -24.h), // Move upward by 24 pixels
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 16.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 50.h),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'LONDON — ',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xFF2E0505),
                                  fontWeight: FontWeight.w900,
                                  height: 1.6,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Cryptocurrencies “have no intrinsic value,” and people who invest in them should be prepared to lose all their money, Bank of England Governor Andrew Bailey said.\n\n'
                                    'Digital currencies like Bitcoin, Ether, and even Dogecoin have been on a tear this year, reminding some investors of the 2017 crypto bubble in which Bitcoin blasted toward \$20,000, only to sink as low as \$3,122 a year later.\n\n'
                                    'Asked at a press conference Thursday about the rising value of cryptocurrencies, Bailey said: “They have no intrinsic value. That doesn’t mean to say people don’t put value on them, because they can have extrinsic value. But they have no intrinsic value.”\n\n'
                                    '“I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.”\n\n'
                                    'Bailey’s comments echoed a similar warning from the U.K.’s Financial Conduct Authority.\n\n'
                                    '“Investing in cryptoassets, or investments and lending linked to them, generally involves taking very high risks with investors’ money,” the financial services watchdog said in January.\n\n'
                                    '“If consumers invest in these types of products, they should be prepared to lose all their money.”\n\n'
                                    'Bailey, who was formerly the chief executive of the FCA, has long been a skeptic of crypto. In 2017, he warned: “If you want to invest in Bitcoin, be prepared to lose all your money.”',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xFF2E0505),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Nunito',
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            //! Blurred container with headline (middle layer)
            Positioned(
              top: 295.h,
              left: 32.w,
              right: 32.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.45),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 16.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sunday, 9 May 2021',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Color(0xFF2E0505),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Crypto investors should be prepared to lose all their money, BOE governor says.',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Color(0xFF2E0505),
                            fontWeight: FontWeight.w700,
                            fontFamily: 'DM Serif Text',
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Published by Ryan Browne',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w800,
                            fontSize: 10.sp,
                            color: Color(0xFF2E0505),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            //! Back button (on top)
            Positioned(
              top: 52.h,
              left: 15.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.pop(context);
                    },
                    child: Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(6.w),
                      child: SvgPicture.asset(
                        'assets/images/left-arrow.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      //! Favourite button
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 48.h),
        child: GestureDetector(
          onTap: () {},
          child: SizedBox(
            width: 56.w,
            height: 56.h,
            child: SvgPicture.asset(
              'assets/images/FAB.svg',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.endFloat, // Position
    );
  }
}
