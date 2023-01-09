import 'package:flutter/material.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/common_widget/common_widgets.dart';
import 'package:netflix/screen/home_screen/widgets/category_widget.dart';
import 'package:netflix/screen/home_screen/widgets/gradient.dart';
import 'package:netflix/screen/home_screen/widgets/home_button.dart';
import 'package:netflix/screen/home_screen/widgets/my_list.dart';
import 'package:netflix/screen/home_screen/widgets/popular.dart';
import 'package:netflix/screen/home_screen/widgets/trending.dart';
import 'package:netflix/series_details/series_details.dart';

class ScreenHome extends StatefulWidget {
  final String coverImg;
  const ScreenHome({required this.coverImg, Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<SeriesDetails> movieList = [];

  @override
  void initState() {
    super.initState();
    populateAllMovie();
  }

  void populateAllMovie() async {
    final movies = await fetchAllSeries(category: 'top_rated');
    setState(() {
      movieList = movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: size.height - 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 500,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                image: NetworkImage(
                                  widget.coverImg,
                                ),
                                fit: BoxFit.cover)),
                      ),
                      const GradientWidget()
                    ],
                  ),
                  heightbox(height: 10.0),
                  const HomeButton(),
                  heightbox(height: 40.0),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: const [
                            Text(
                              'Now Playing',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      heightbox(height: 10.0),
                      const MyList(),
                      heightbox(height: 30.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: const [
                            Text(
                              'Trending',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      heightbox(height: 10.0),
                      const TrendingWidget(),
                      heightbox(height: 30.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: const [
                            Text(
                              'Popular On Netflix',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      heightbox(height: 10.0),
                      const PopularWidget(),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/logo.ico',
                            width: 35,
                            fit: BoxFit.cover,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.collections_bookmark,
                                    color: Colors.white,
                                    size: 26,
                                  )),
                              widthbox(width: 3.0),
                              InkWell(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/netflixavatar.png',
                                  width: 26,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    heightbox(height: 15.0),
                    const CategoryWidget(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
