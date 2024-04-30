import 'package:freezed_annotation/freezed_annotation.dart';

part 'rate_model.freezed.dart';
part 'rate_model.g.dart';

@freezed
class RatingModel with _$RatingModel {
  factory RatingModel({
    final double? rate,
    final int? count,
  }) = _RatingModel;
  factory RatingModel.fromJson(Map<String, dynamic> json) =>
      _$RatingModelFromJson(json);
}
