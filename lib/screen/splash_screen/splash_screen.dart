import 'package:flutter/material.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/screen/home_screen/widgets/screen_dash.dart';
import 'package:netflix/series_details/series_details.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  List<SeriesDetails> movieList = [];
  @override
  void initState() {
    gotologin();
    populateAllMovie();

    super.initState();
  }

  void populateAllMovie() async {
    final movies = await fetchAllSeries(category: 'popular');
    setState(
      () {
        movieList = movies;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Image.asset(
          'assets/images/logo.ico',
          width: 50,
          height: 50,
        ),
      ),
    );
  }

  Future<void> gotologin() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => ScreenDash(
          coverimg:
              "https://image.tmdb.org/t/p/w500${movieList[0].posterPath!}",
        ),
      ),
    );
  }
}
