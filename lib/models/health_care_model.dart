class PregnancyCareModel {
  final String message;
  final String image;

  PregnancyCareModel({
    required this.message,
    required this.image,
  });

  static PregnancyCareModel fromJSON(Map<String, dynamic> map) {
    return PregnancyCareModel(
      message: map['message'],
      image: map['image'],
    );
  }
}
