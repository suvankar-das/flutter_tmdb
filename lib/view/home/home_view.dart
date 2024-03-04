import 'package:flutter/material.dart';
import 'package:ott_code_frontend/api/api.dart';
import 'package:ott_code_frontend/common/color_extension.dart';
import 'package:ott_code_frontend/models/Movie.dart';
import 'package:ott_code_frontend/view/home/movies_slider.dart';
import 'package:ott_code_frontend/view/home/trending_sliders.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> upcomingMovies;
  late Future<List<Movie>> topRatedMovies;

  @override
  void initState() {
    super.initState();
    // Your initState code
    trendingMovies = Api().getTrendingMovies();
    upcomingMovies = Api().getUpcomingMovies();
    topRatedMovies = Api().getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ApplicationColor.themeModeDark
          ? ApplicationColor.bgDark
          : ApplicationColor.cardLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          "assets/images/logo.png",
          fit: BoxFit.cover,
          height: 40,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                "Trending movies",
                style: TextStyle(
                  fontFamily: "Gotham",
                  fontWeight: FontWeight.w700,
                  color: ApplicationColor.text,
                  fontSize: 25,
                ),
              ),
            ),
            // Main container to hold carousel sliders
            SizedBox(
              child: FutureBuilder(
                future: trendingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Some error occured"),
                    );
                  } else if (snapshot.hasData) {
                    return TrendingSlider(
                      media: media,
                      snapshot: snapshot,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Top rated movies",
              style: TextStyle(
                fontFamily: "Gotham",
                fontWeight: FontWeight.w700,
                color: ApplicationColor.text,
                fontSize: 25,
              ),
            ),

            SizedBox(
              child: FutureBuilder(
                future: topRatedMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Some error occured"),
                    );
                  } else if (snapshot.hasData) {
                    return MoviesSlider(
                      media: media,
                      snapshot: snapshot,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Upcoming movies",
              style: TextStyle(
                fontFamily: "Gotham",
                fontWeight: FontWeight.w700,
                color: ApplicationColor.text,
                fontSize: 25,
              ),
            ),

            SizedBox(
              child: FutureBuilder(
                future: upcomingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Some error occured"),
                    );
                  } else if (snapshot.hasData) {
                    return MoviesSlider(
                      media: media,
                      snapshot: snapshot,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
