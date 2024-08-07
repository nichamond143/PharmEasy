// ignore_for_file: public_member_api_docs, sort_constructors_first
class Medicine {
  String name;
  double price;
  String imagePath;
  String shortDescription;
  String longDescription;

  Medicine(
      {required this.name,
      required this.price,
      required this.imagePath,
      required this.shortDescription,
      required this.longDescription,});
}
