import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ott_code_frontend/common/color_extension.dart';
import 'package:ott_code_frontend/common_widgets/rounded_button.dart';
import 'package:ott_code_frontend/enviorment_var.dart';
import 'package:ott_code_frontend/models/Movie.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({super.key, required this.movie});
  final Movie movie;

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  late Movie _movie;
  List castArr = [
    {
      "name": "Isabela Moner",
      "image": "",
    },
    {
      "name": "Michael Peña",
      "image": "assets/images/MichaelPena.png",
    },
    {
      "name": "Eva Longoria",
      "image": "assets/images/EvaLongoria.png",
    },
    {
      "name": "Eugenio Derbez",
      "image": "",
    },
  ];

  @override
  void initState() {
    super.initState();
    _movie = widget.movie;
    FBroadcast.instance().register("change_mode", (value, callback) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ApplicationColor.bgColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      width: media.width,
                      height: media.width * 0.8,
                      child: ClipRect(
                        child: Image.network(
                          '${EnvironmentVars.imagePath}${_movie.posterPath}',
                          width: media.width,
                          height: media.width,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                    Container(
                      width: media.width,
                      height: media.width * 0.8,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            ApplicationColor.bgDark,
                            ApplicationColor.bgDark.withOpacity(0),
                            ApplicationColor.bgDark.withOpacity(0),
                            ApplicationColor.bgColor
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                    ),
                    Container(
                      width: media.width,
                      height: media.width * 0.8,
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          //TODO Play
                        },
                        child: Image.asset("assets/images/play-button.png",
                            width: 55, height: 55),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _movie.title,
                            style: TextStyle(
                                color: ApplicationColor.text,
                                fontSize: 19,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Movie",
                                style: TextStyle(
                                    color: ApplicationColor.text,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                " | ",
                                style: TextStyle(
                                    color: ApplicationColor.text,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Adventure",
                                style: TextStyle(
                                    color: ApplicationColor.text,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                " | ",
                                style: TextStyle(
                                    color: ApplicationColor.text,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Comedy",
                                style: TextStyle(
                                    color: ApplicationColor.text,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                " | ",
                                style: TextStyle(
                                    color: ApplicationColor.text,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Family",
                                style: TextStyle(
                                    color: ApplicationColor.text,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Text(
                  _movie.voteAverage.toStringAsFixed(1),
                  style: TextStyle(
                    color: ApplicationColor.text,
                    fontSize: 33,
                  ),
                ),
                IgnorePointer(
                  ignoring: true,
                  child: RatingBar(
                    initialRating: _movie.voteAverage / 2,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 18,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    ratingWidget: RatingWidget(
                      full: Image.asset("assets/images/star_fill.png"),
                      half: Image.asset("assets/images/star.png"),
                      empty: Image.asset("assets/images/star.png"),
                    ),
                    onRatingUpdate: (rating) {
                      //print(rating);
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    _movie.overView,
                    style: TextStyle(
                      color: ApplicationColor.text,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 150,
                  child: RoundedButton(
                    title: "WATCH NOW",
                    height: 40,
                    onPressed: () {
                      //TODO Play
                    },
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Cast",
                          style: TextStyle(
                              color: ApplicationColor.text,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ]),
                ),
                SizedBox(
                  height: (media.width * 0.34) + 40,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      scrollDirection: Axis.horizontal,
                      itemCount: castArr.length,
                      itemBuilder: (context, index) {
                        var cObj = castArr[index] as Map? ?? {};
                        var image = cObj["image"].toString();

                        return InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                color: ApplicationColor.bgColor,
                                width: media.width * 0.25,
                                height: media.width * 0.32,
                                child: image != ""
                                    ? ClipRect(
                                        child: Image.asset(
                                          image,
                                          width: media.width * 0.25,
                                          height: media.width * 0.32,
                                          fit: BoxFit.contain,
                                        ),
                                      )
                                    : null,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                cObj["name"].toString(),
                                style: TextStyle(
                                  color: ApplicationColor.text,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leadingWidth: 100,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "assets/images/back_btn.png",
                            width: 13,
                            height: 13,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            "BACK",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ApplicationColor.primaryColor,
        onPressed: () {
          ApplicationColor.themeModeDark = !ApplicationColor.themeModeDark;
          FBroadcast.instance().broadcast("change_mode");
          if (mounted) {
            setState(() {});
          }
        },
        child: Icon(
          ApplicationColor.themeModeDark ? Icons.light_mode : Icons.dark_mode,
          color: ApplicationColor.text,
        ),
      ),
    );
  }
}
