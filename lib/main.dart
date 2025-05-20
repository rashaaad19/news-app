import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/cubit/news_cubit.dart';
import 'package:newsapp/repos/news_repo.dart';
import 'package:newsapp/screens/home_screen.dart';
import 'package:newsapp/screens/newsDetails_screen.dart';
import 'package:newsapp/screens/newsFetch_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return BlocProvider(
          create: (context) => NewsCubit(NewsRepo()),
          child: MaterialApp(
            //solve colors interaction issue
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                elevation: 0,
                scrolledUnderElevation: 0,
                color: Colors.white,
              ),
              colorScheme: ColorScheme.light(
                // background: Colors.white,
                surface: Colors.white,
                onSurface: Colors.black,
              ),
            ),

            title: 'News App',
            home: const HomeScreen(),
          ),
        );
      },
    );
  }
}
