// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RataingResquest _$RataingResquestFromJson(Map<String, dynamic> json) =>
    RataingResquest(
      rating:
          (json['rating'] as List<dynamic>?)
              ?.map((e) => Rating.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$RataingResquestToJson(RataingResquest instance) =>
    <String, dynamic>{'rating': instance.rating};

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
  users:
      (json['users'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
  'users': instance.users,
};

User _$UserFromJson(Map<String, dynamic> json) => User(
  ratedUser: json['ratedUser'] as String,
  comment: json['comment'] as String,
  reviews:
      (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
  cumulativeRatingPoints: (json['cumulativeRatingPoints'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'ratedUser': instance.ratedUser,
  'comment': instance.comment,
  'cumulativeRatingPoints': instance.cumulativeRatingPoints,
  'reviews': instance.reviews,
};

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
  title: json['title'] as String,
  points: (json['points'] as num).toInt(),
);

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
  'title': instance.title,
  'points': instance.points,
};
