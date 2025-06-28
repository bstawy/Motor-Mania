import '../../domain/entities/offer_entity.dart';

class OfferModel extends OfferEntity {
  const OfferModel({
    required super.id,
    required super.imageUrl,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
        id: json['id'],
        imageUrl: (json['guest_image_url'] != null &&
                json['guest_image_url'].isNotEmpty)
            ? json['guest_image_url']
            : json['user_image_url']);
  }
}
