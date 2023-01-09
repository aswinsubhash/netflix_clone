import 'package:flutter/material.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/screen/home_screen/widgets/detail_screen.dart';
import 'package:netflix/series_details/series_details.dart';

class TrendingWidget extends StatefulWidget {
  const TrendingWidget({Key? key}) : super(key: key);

  @override
  State<TrendingWidget> createState() => _TrendingWidgetState();
}

class _TrendingWidgetState extends State<TrendingWidget> {
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: List.generate(movieList.length, (index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return DetailScreen(
                    mvdetails:
                        "https://image.tmdb.org/t/p/w500${movieList[index].backdropPath}",
                    mvDescription: movieList[index].overview!,
                    mvTitle: movieList[index].originalName!,
                  );
                }));
              },
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                height: 160,
                width: 110,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w500${movieList[index].posterPath}",
                      fit: BoxFit.cover,
                      frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) {
                        return child;
                      },
                      loadingBuilder: (ctx, child, loading) {
                        if (loading == null) {
                          return child;
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Color.fromARGB(255, 234, 20, 4),
                            ),
                          );
                        }
                      },
                    )),
              ),
            );
          }),
        ),
      ),
    );
  }
}
