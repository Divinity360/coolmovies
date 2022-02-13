
class AllMovies {
  List<Movie>? movies;

  AllMovies({this.movies});

  AllMovies.fromJson(Map<String, dynamic> json) {
    if (json['nodes'] != null) {
      movies = <Movie>[];
      json['nodes'].forEach((v) {
        movies!.add(new Movie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movies != null) {
      data['nodes'] = this.movies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movie {
  String? id;
  String? imgUrl;
  String? movieDirectorId;
  String? userCreatorId;
  String? title;
  String? releaseDate;
  String? nodeId;
  UserByUserCreatorId? userByUserCreatorId;

  Movie(
      {this.id,
        this.imgUrl,
        this.movieDirectorId,
        this.userCreatorId,
        this.title,
        this.releaseDate,
        this.nodeId,
        this.userByUserCreatorId});

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgUrl = json['imgUrl'];
    movieDirectorId = json['movieDirectorId'];
    userCreatorId = json['userCreatorId'];
    title = json['title'];
    releaseDate = json['releaseDate'];
    nodeId = json['nodeId'];
    userByUserCreatorId = json['userByUserCreatorId'] != null
        ? new UserByUserCreatorId.fromJson(json['userByUserCreatorId'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imgUrl'] = this.imgUrl;
    data['movieDirectorId'] = this.movieDirectorId;
    data['userCreatorId'] = this.userCreatorId;
    data['title'] = this.title;
    data['releaseDate'] = this.releaseDate;
    data['nodeId'] = this.nodeId;
    if (this.userByUserCreatorId != null) {
      data['userByUserCreatorId'] = this.userByUserCreatorId!.toJson();
    }
    return data;
  }
}

class UserByUserCreatorId {
  String? id;
  String? name;
  String? nodeId;

  UserByUserCreatorId({this.id, this.name, this.nodeId});

  UserByUserCreatorId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nodeId = json['nodeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['nodeId'] = this.nodeId;
    return data;
  }
}