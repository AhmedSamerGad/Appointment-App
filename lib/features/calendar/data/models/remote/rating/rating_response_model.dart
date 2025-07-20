import 'package:json_annotation/json_annotation.dart';
import 'package:appointments/features/calendar/domin/review_entity.dart';

part 'rating_response_model.g.dart';

@JsonSerializable()
class RatingResponseModel {
  final String? ratedBy;
  final bool? hasRated;
  final DateTime? ratedAt;

  @JsonKey(defaultValue: [])
  final List<UserRatingResponseModel> users;

  @JsonKey(name: '_id')
  final String? id;

  RatingResponseModel({
    required this.ratedBy,
    required this.hasRated,
    required this.ratedAt,
    required this.users,
    required this.id,
  });

  factory RatingResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RatingResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RatingResponseModelToJson(this);

  ReviewEntity toEntity() {
    return ReviewEntity(
      id: id,
      ratedBy: ratedBy,
      hasRated: hasRated,
      ratedAt: ratedAt,
      ratedUsers: users.map((e) => e.toEntity()).toList(),
    );
  }

  static RatingResponseModel fromEntity(ReviewEntity entity) {
    return RatingResponseModel(
      id: entity.id,
      ratedBy: entity.ratedBy,
      hasRated: entity.hasRated,
      ratedAt: entity.ratedAt,
      users: entity.ratedUsers.map((e) => UserRatingResponseModel.fromEntity(e)).toList(),
    );
  }
}

@JsonSerializable()
class UserRatingResponseModel {
  final String? ratedUser;
  final String? comment;
  final int? cumulativeRatingPoints;

  @JsonKey(defaultValue: [])
  final List<ReviewDetailResponseModel> reviews;

  UserRatingResponseModel({
    required this.ratedUser,
    required this.comment,
    required this.cumulativeRatingPoints,
    required this.reviews,
  });

  factory UserRatingResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserRatingResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserRatingResponseModelToJson(this);

  RatedUserEntity toEntity() {
    return RatedUserEntity(
      ratedUser: ratedUser,
      comment: comment,
      cumulativeRatingPoints: cumulativeRatingPoints,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }

  static UserRatingResponseModel fromEntity(RatedUserEntity entity) {
    return UserRatingResponseModel(
      ratedUser: entity.ratedUser ?? '',
      comment: entity.comment,
      cumulativeRatingPoints: entity.cumulativeRatingPoints,
      reviews: entity.reviews.map((e) => ReviewDetailResponseModel.fromEntity(e)).toList(),
    );
  }
}

@JsonSerializable()
class ReviewDetailResponseModel {
  final String? title;
  final int? points;

  ReviewDetailResponseModel({
    required this.title,
    required this.points,
  });

  factory ReviewDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewDetailResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewDetailResponseModelToJson(this);

  ReviewingEvtity toEntity() {
    return ReviewingEvtity(
      title: title ?? '',
      points: points ?? 0,
    );
  }

  static ReviewDetailResponseModel fromEntity(ReviewingEvtity entity) {
    return ReviewDetailResponseModel(
      title: entity.title,
      points: entity.points,
    );
  }
}
