import 'package:http/http.dart' as http;

class Koneksi {
  final _baseUrl = 'http://technologysupport.id/api/get_kamus';

  Future postData(String kunci) async {
    try {
      final response = await http.post(Uri.parse(_baseUrl), body: {
        //masukkan keynya
        "kunci": kunci,
      });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
