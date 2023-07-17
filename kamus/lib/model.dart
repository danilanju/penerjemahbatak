class ApiModel {
  late int id;
  late String kata;
  late String translate;
  late String keterangan;

  ApiModel(
      {required this.id,
      required this.kata,
      required this.translate,
      required this.keterangan});

  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return ApiModel(
      id: json['id'],
      kata: json['kata'],
      translate: json['translate'],
      keterangan: json['ket'],
    );
  }
}
