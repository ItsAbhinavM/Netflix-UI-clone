class movieModel {
  String thumbnailPath;

  movieModel({
    required this.thumbnailPath,
  });

  static List<movieModel> getmovie() {
    List<movieModel> _movie = [];

    _movie.add(movieModel(thumbnailPath: 'assets/icons/movie_1.jpeg'));
    _movie.add(movieModel(thumbnailPath: 'assets/icons/movie_4.jpeg'));
    _movie.add(movieModel(thumbnailPath: 'assets/icons/movie_3.jpeg'));

    return _movie;
  }
}
