import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewsDetails extends StatelessWidget {
  final String newsImg;
  final String newsTitle;
  final String newsAuthor;
  final String newsDescription;
  final String newsContent;
  final String newsPublishedAt;

  const NewsDetails({
    super.key,
    required this.newsImg,
    required this.newsTitle,
    required this.newsAuthor,
    required this.newsDescription,
    required this.newsContent,
    required this.newsPublishedAt,
  });

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
                Image.network(
                  newsImg,
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
                                text: newsContent,
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
                          newsPublishedAt,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Color(0xFF2E0505),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          newsDescription,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,

                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Color(0xFF2E0505),
                            fontWeight: FontWeight.w700,
                            fontFamily: 'DM Serif Text',
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          newsAuthor,
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
                      Navigator.pop(context);
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
