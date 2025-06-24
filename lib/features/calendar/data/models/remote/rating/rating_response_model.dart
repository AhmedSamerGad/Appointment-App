import 'package:appointments/features/calendar/domin/review_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating_response_model.g.dart';

@JsonSerializable()
class RatingResponseModel {
    RatingResponseModel({
        required this.ratedBy,
        required this.hasRated,
        required this.ratedAt,
        required this.users,
        required this.id,
       
    });

    final String? ratedBy;
    final bool? hasRated;
    final DateTime? ratedAt;
    final List<User>? users;

    @JsonKey(name: '_id') 
    final String? id;
  

    factory RatingResponseModel.fromJson(Map<String, dynamic> json) => _$RatingResponseModelFromJson(json);

    Map<String, dynamic> toJson() => _$RatingResponseModelToJson(this);

    ReviewEntity toEntity() => ReviewEntity(
      ratedBy ?? '',
      id ?? '',
      hasRated,
      ratedAt,
      users!.map((e) => e.toEntity()).toList(),
    );
}

@JsonSerializable()
class User {
    User({
        required this.ratedUser,
        required this.comment,
        required this.cumulativeRatingPoints,
        required this.reviews,
    });

    final String ratedUser;
    final String? comment;
    final int? cumulativeRatingPoints;
    final List<Review>? reviews;

    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

    Map<String, dynamic> toJson() => _$UserToJson(this);

    RatedUserEntity toEntity() {
      return RatedUserEntity(
        ratedUser   ,
        comment ?? '' ,
        cumulativeRatingPoints ?? 0,
        reviews: reviews?.map((e)=>e.toEntity()).toList()
      );
    }
}

@JsonSerializable()
class Review {
    Review({
        required this.title,
        required this.points,
    });

    final String? title;
    final int? points;

    factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

    Map<String, dynamic> toJson() => _$ReviewToJson(this);

    ReviewingEvtity toEntity() => ReviewingEvtity(
      title: title!,
      points: points!,
    );
}