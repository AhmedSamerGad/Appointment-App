import 'package:appointments/features/calendar/data/models/remote/rating/rating_response_model.dart';

class ReviewEntity {
  final String? id;
  final String? ratedBy;
  final bool? hasRated;
  final DateTime? ratedAt;
  List<RatedUserEntity> ratedUsers;

  ReviewEntity(
   { this.id,
    this.ratedBy,
    this.hasRated,
    this.ratedAt,
  required  this.ratedUsers,});

  RatingResponseModel toModel() {
    return RatingResponseModel( 
      id: id,
      ratedBy: ratedBy,
      hasRated: hasRated,
      ratedAt: ratedAt,
      users: ratedUsers.map((e) => e.toModel()).toList(),
    );
  }
}

class RatedUserEntity {
  final String? ratedUser;
  final String? comment;
  final int? cumulativeRatingPoints;
  List<ReviewingEvtity> reviews;

  RatedUserEntity(
{this.ratedUser,
this.comment,
this.cumulativeRatingPoints, 
required this.reviews,}
  );

  UserRatingResponseModel toModel() {
    return UserRatingResponseModel(
      ratedUser: ratedUser ?? '',
      comment: comment,
      cumulativeRatingPoints: cumulativeRatingPoints,
      reviews: reviews.map((e) => e.toModel()).toList(),
    );
  }
}

class ReviewingEvtity {
  final String title;
  final int points;
  final int? currentValue ;

  ReviewingEvtity({required this.title, required this.points , this.currentValue = 0});

  ReviewingEvtity copyWith({
    String? title,
    int? points,
    int? currentValue,
  }) {
    return ReviewingEvtity(
      title: title ?? this.title,
      points: points ?? this.points,
      currentValue: currentValue ?? this.currentValue,
    );
  }

  ReviewDetailResponseModel toModel() {
    return ReviewDetailResponseModel(title: title, points: points);
  }
}
