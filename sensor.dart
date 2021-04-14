class Tambak {
  final String hari;
  final String jam;
  final String tanggal;
  final double salinitasAir;
  final double pHAir;
  final double ketinggianAir;
  final String statusTambak;

  Tambak({
    this.hari,
    this.jam,
    this.tanggal,
    this.salinitasAir,
    this.pHAir,
    this.ketinggianAir,
    this.statusTambak,
  });

  factory Tambak.fromJson(Map<dynamic, dynamic> json) {
    double parser(dynamic source) {
      try {
        return double.parse(source.toString());
      } on FormatException {
        return -1;
      }
    }

    return Tambak(
      hari: (json['hari']),
      jam: (json['jam']),
      tanggal: (json['tanggal']),
      salinitasAir: parser(json['salinitas_air']),
      pHAir: parser(json['pH_air']),
      ketinggianAir: parser(json['ketinggian_air']),
      statusTambak: (json['status_tambak']),
    );
  }
}
