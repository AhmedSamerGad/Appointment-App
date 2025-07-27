// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingResponseModel _$RatingResponseModelFromJson(Map<String, dynamic> json) =>
    RatingResponseModel(
      ratedBy: json['ratedBy'] as String?,
      hasRated: json['hasRated'] as bool?,
      ratedAt:
          json['ratedAt'] == null
              ? null
              : DateTime.parse(json['ratedAt'] as String),
      users:
          (json['users'] as List<dynamic>?)
              ?.map(
                (e) =>
                    UserRatingResponseModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$RatingResponseModelToJson(
  RatingResponseModel instance,
) => <String, dynamic>{
  'ratedBy': instance.ratedBy,
  'hasRated': instance.hasRated,
  'ratedAt': instance.ratedAt?.toIso8601String(),
  'users': instance.users,
  '_id': instance.id,
};

UserRatingResponseModel _$UserRatingResponseModelFromJson(
  Map<String, dynamic> json,
) => UserRatingResponseModel(
  ratedUser: json['ratedUser'] as String?,
  comment: json['comment'] as String?,
  cumulativeRatingPoints: (json['cumulativeRatingPoints'] as num?)?.toInt(),
  reviews:
      (json['reviews'] as List<dynamic>?)
          ?.map(
            (e) =>
                ReviewDetailResponseModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
);

Map<String, dynamic> _$UserRatingResponseModelToJson(
  UserRatingResponseModel instance,
) => <String, dynamic>{
  'ratedUser': instance.ratedUser,
  'comment': instance.comment,
  'cumulativeRatingPoints': instance.cumulativeRatingPoints,
  'reviews': instance.reviews,
};

ReviewDetailResponseModel _$ReviewDetailResponseModelFromJson(
  Map<String, dynamic> json,
) => ReviewDetailResponseModel(
  title: json['title'] as String?,
  points: (json['points'] as num?)?.toInt(),
);

Map<String, dynamic> _$ReviewDetailResponseModelToJson(
  ReviewDetailResponseModel instance,
) => <String, dynamic>{'title': instance.title, 'points': instance.points};
