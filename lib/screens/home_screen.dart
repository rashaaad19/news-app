import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'Healthy';

  final List<Map<String, dynamic>> newsCards = [
    {
      'author': 'Ryan Browne',
      'title':
          'Crypto investors should be prepared to lose all their money, BOE governor says',
      'description':
          '“I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.”',
      'img': 'assets/images/1b253b61593c0eac981b4da390568868d72bc803.png',
    },
    {
      'author': 'Ryan Browne',
      'title': 'Asia-Pacific markets trade broadly higher, oil prices climb',
      'description':
          'Stock markets in Asia-Pacific were broadly higher on Monday following “a big miss” in the April U.S. jobs report, while oil futures advanced.”',
      'img': 'assets/images/5baa12813c0e6239a2ea7f559e4ef62cf9f3e29c.png',
    },
  ];

  final List<Map<String, dynamic>> categoryCards = [
    {
      'author': 'Matt Villano',
      'title': "5 things to know about the 'conundrum' of lupus",
      'date': 'Sunday, 9 May 2021',
      'img': 'assets/images/69c61abdc00223e6f2740ac799449e0895416c82.jpg',
    },
    {
      'author': 'Zain Korsgaard',
      'title': '4 ways families can ease anxiety together',
      'date': 'Sunday, 9 May 2021',
      'img': 'assets/images/7fcfe2abdb2c76b6b9d1cef9a83e37fce052776f.jpg',
    },
    {
      'author': 'Zain Korsgaard',
      'title':
          "What to do if you're planning or attending a wedding during the pandemic",
      'date': 'Sunday, 9 May 2021',
      'img': 'assets/images/1279679f20420e71f53008269e726db07501f440.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Dogcoin to the moon',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: const Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            SvgPicture.asset(
              'assets/images/notif_badge.svg',
              width: 33,
              height: 33,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 16.h),
                //! First section - Header
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 111.w,
                        height: 21.h,
                        child: Text(
                          'Latest News',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontFamily: 'DM Serif Text',
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Text(
                              'See All',
                              style: TextStyle(color: Color(0xFF0080FF)),
                            ),
                            SizedBox(width: 8.w),
                            Icon(
                              Icons.arrow_forward,
                              size: 12.sp,
                              color: Color(0xFF0080FF),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),

                //! Second section - Scrollable Row of Cards
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: SizedBox(
                    height: 260.h,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:
                            newsCards.map((card) {
                              return Padding(
                                padding: EdgeInsets.only(right: 12.w),
                                child: SizedBox(
                                  width: 321.w,
                                  height: 260.h,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8.r,
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(card['img']),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8.r,
                                          ),
                                          color: Colors.black.withOpacity(0.3),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(16.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 80.h),
                                            Text(
                                              'by ${card['author']}',
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.white,
                                                fontFamily: 'DM Serif Text',
                                              ),
                                            ),
                                            SizedBox(height: 2.h),
                                            Text(
                                              card['title'],
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(height: 30.h),
                                            Text(
                                              card['description'],
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                      ),
                    ),
                  ),
                ),

                //! Third section -- Category scrollbar
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var category in [
                          'Healthy',
                          'Technology',
                          'Finance',
                          'Arts',
                          'Sports',
                        ])
                          Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: ElevatedButton(
                              onPressed:
                                  () => setState(
                                    () => _selectedCategory = category,
                                  ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(0, 32.h),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r),
                                  side: BorderSide(
                                    width: 1.w,
                                    color: const Color(0xFFFFB3B6),
                                  ),
                                ),
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                              ),
                              child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  gradient:
                                      _selectedCategory == category
                                          ? const LinearGradient(
                                            colors: [
                                              Color(0xFFFF3A44),
                                              Color(0xFFFF8086),
                                            ],
                                          )
                                          : null,
                                  color:
                                      _selectedCategory == category
                                          ? null
                                          : Colors.white,
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                    vertical: 8.h,
                                  ),
                                  child: Text(
                                    category,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color:
                                          _selectedCategory == category
                                              ? Colors.white
                                              : const Color(0xFF2E0505),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.h),

                //! Fourth section - Category cards
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    children:
                        categoryCards.map((card) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: SizedBox(
                              height: 128.h,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.r),
                                    child: Image.asset(
                                      card['img'],
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      color: Colors.black.withOpacity(0.28),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(16.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          card['title'],
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Spacer(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'by ${card['author']}',
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.white,
                                                fontFamily: 'DM Serif Text',
                                              ),
                                            ),
                                            Text(
                                              card['date'] ?? '',
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ),
                SizedBox(
                  height: 80.h,
                ), 
              ],
            ),
          ),

          //! Fixed bottom navigation bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 289.w,
                height: 66.h,
                margin: EdgeInsets.only(bottom: 16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.r),
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 40.w,
                        right: 40.w,
                        top: 16.h,
                        bottom: 8.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'assets/images/home.svg',
                                width: 24.w,
                                height: 24.h,
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                'Home',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF2E0505),
                                ),
                              ),
                            ],
                          ),

                          // Favorites Column with top dash
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Column(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/heart.svg',
                                    width: 24.w,
                                    height: 24.h,
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    'Favorites',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Color(0xFFA6A6A6),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                top: -12.h, 
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Container(
                                    width: 24.w,
                                    height: 4.h,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE0E0E0),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'assets/images/smile.svg',
                                width: 24.w,
                                height: 24.h,
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                'Profile',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Color(0xFFA6A6A6),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
