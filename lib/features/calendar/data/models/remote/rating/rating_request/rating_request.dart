import 'package:json_annotation/json_annotation.dart';

part 'rating_request.g.dart';

@JsonSerializable()
class RataingResquest {
    RataingResquest({
        required this.rating,
    });

    final List<Rating>? rating;

    RataingResquest copyWith({
        List<Rating>? rating,
    }) {
        return RataingResquest(
            rating: rating ?? this.rating,
        );
    }

    factory RataingResquest.fromJson(Map<String, dynamic> json) => _$RataingResquestFromJson(json);

    Map<String, dynamic> toJson() => _$RataingResquestToJson(this);

}

@JsonSerializable()
class Rating {
    Rating({
        required this.users,
    });

    final List<User>? users;

    Rating copyWith({
        List<User>? users,
    }) {
        return Rating(
            users: users ?? this.users,
        );
    }

    factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

    Map<String, dynamic> toJson() => _$RatingToJson(this);

}

@JsonSerializable()
class User {
    User( {
        required this.ratedUser,
        required this.comment,
        required this.reviews,this.cumulativeRatingPoints,
    });

    final String ratedUser;
    final String comment;
    final int? cumulativeRatingPoints;
    final List<Review>? reviews;

    User copyWith({
        String? ratedUser,
        String? comment,
        List<Review>? reviews,
    }) {
        return User(
            ratedUser: ratedUser ?? this.ratedUser,
            comment: comment ?? this.comment,
            reviews: reviews ?? this.reviews,
        );
    }

    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

    Map<String, dynamic> toJson() => _$UserToJson(this);

}

@JsonSerializable()
class Review {
    Review({
        required this.title,
        required this.points,
    });

    final String title;
    final int points;

    Review copyWith({
        String? title,
        int? points,
    }) {
        return Review(
            title: title ?? this.title,
            points: points ?? this.points,
        );
    }

    factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

    Map<String, dynamic> toJson() => _$ReviewToJson(this);

}
