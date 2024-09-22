import '../../domain/entities/slider.dart';

class SliderModel extends Slider {
  SliderModel({
    required String imageUrl,
  }) : super(imageUrl: imageUrl);

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      imageUrl: json['photo'], // Correctly map the 'photo' key
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'photo': imageUrl,
    };
  }
}
