import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_url.freezed.dart';
part 'image_url.g.dart';

@freezed
class ImageUrl with _$ImageUrl {
  const factory ImageUrl({
    @Default(ImageUrl.defaultOrigin) String origin,
    @Default(ImageUrl.defaultSm) String sm,
    @Default(ImageUrl.defaultMd) String md,
    @Default(ImageUrl.defaultLg) String lg,
  }) = _ImageUrl;

  static const defaultOrigin = '';
  static const defaultSm = '';
  static const defaultMd = '';
  static const defaultLg = '';
  factory ImageUrl.fromJson(Map<String, dynamic> json) => _$ImageUrlFromJson(json);
}
