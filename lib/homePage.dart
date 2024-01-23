import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_ui/models/movie_model.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<movieModel> movies = [];
  @override
  void initState() {
    super.initState();
    _getInitialInfo();
  }

  void _getInitialInfo() {
    movies = movieModel.getmovie();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 57, 56, 59),
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.transparent.withOpacity(0.4),
          child: Column(
            children: [
              SizedBox(
                height: 18,
              ),
              _filterButtons(),
              SizedBox(
                height: 20,
              ),
              _movieProfile(),
              SizedBox(
                height: 20,
              ),
              //my List
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "My List : ",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                ),
              ]),
              SizedBox(
                height: 20,
              ),
              _myList(),
              SizedBox(
                height: 20,
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Continue watching : ",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                ),
              ]),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.5)),
                                image: DecorationImage(
                                    image:
                                        AssetImage(movies[index].thumbnailPath),
                                    fit: BoxFit.cover))),
                      );
                    },
                    separatorBuilder: (context, index) => (SizedBox(
                          width: 7,
                        )),
                    itemCount: movies.length),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _myList() {
    return Container(
      height: 200,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white.withOpacity(0.5)),
                      image: DecorationImage(
                          image: AssetImage(movies[index].thumbnailPath),
                          fit: BoxFit.cover))),
            );
          },
          separatorBuilder: (context, index) => (SizedBox(
                width: 7,
              )),
          itemCount: movies.length),
    );
  }

  Padding _filterButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white)),
              onPressed: null,
              child: const Text(
                "Tv Shows",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              )),
          const SizedBox(
            width: 10,
          ),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white)),
              onPressed: null,
              child: const Text(
                "Movies",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              )),
          const SizedBox(
            width: 10,
          ),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white)),
              onPressed: null,
              child: Text(
                "Categories ⬇",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              )),
        ],
      ),
    );
  }

  Padding _movieProfile() {
    return Padding(
      padding: EdgeInsets.only(left: 50, right: 50),
      child: Container(
        height: 400,
        width: 350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white, width: 1),
            image: DecorationImage(
                image: AssetImage(
                  "assets/icons/movie_3.jpeg",
                ),
                fit: BoxFit.fill)),
        child: Row(children: [
          SizedBox(
            width: 7,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: null,
                child: Text(
                  "Play",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 9),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 57, 56, 59),
                      side: const BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: null,
                  child: Text(
                    "Add to my list",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
            ),
          ),
        ]),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent.withOpacity(0.5),
      leading: Padding(
        padding: EdgeInsets.all(10),
        child: Image.asset(
          'assets/icons/Netflix.png',
          height: 10,
          fit: BoxFit.cover,
        ),
      ),
      actions: [
        Padding(
            padding: EdgeInsets.all(9),
            child: Icon(
              Icons.search,
              size: 35,
              color: Colors.white,
            )),
        /*Padding(
          padding: EdgeInsets.only(left: 18, right: 10, top: 7, bottom: 7),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('assets/icons/user.png'),
          ),
        )*/
      ],
    );
  }
}
