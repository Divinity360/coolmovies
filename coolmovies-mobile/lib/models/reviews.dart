class AllReviews {
  List<Review>? reviews;

  AllReviews({this.reviews});

  AllReviews.fromJson(Map<String, dynamic> json) {
    if (json['nodes'] != null) {
      reviews = <Review>[];
      json['nodes'].forEach((v) {
        reviews!.add(new Review.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reviews != null) {
      data['nodes'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Review {
  String? userReviewerId;
  String? body;
  String? id;
  String? movieId;
  String? nodeId;
  int? rating;
  String? title;

  Review(
      {this.userReviewerId,
        this.body,
        this.id,
        this.movieId,
        this.nodeId,
        this.rating,
        this.title});

  Review.fromJson(Map<String, dynamic> json) {
    userReviewerId = json['userReviewerId'];
    body = json['body'];
    id = json['id'];
    movieId = json['movieId'];
    nodeId = json['nodeId'];
    rating = json['rating'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userReviewerId'] = this.userReviewerId;
    data['body'] = this.body;
    data['id'] = this.id;
    data['movieId'] = this.movieId;
    data['nodeId'] = this.nodeId;
    data['rating'] = this.rating;
    data['title'] = this.title;
    return data;
  }
}