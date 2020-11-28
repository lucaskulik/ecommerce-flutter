import 'dart:convert';
import 'dart:io';

import 'package:ecommerce/dtos/viacep_dto.dart';
import 'package:http/http.dart';

class ViaCepService {
  Future<ViaCepDTO> getAddressByCEP(String cep) async {
    var url = "https://viacep.com.br/ws/$cep/json/";

    print("URL CEP $url");

    try {
      Response response = await get(url);

      if (response.body == null ||
          response.body.isEmpty ||
          response.statusCode != HttpStatus.ok) {
        return Future.error("CEP Invalido");
      }

      Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;

      if (json.length < 1) {
        return Future.error("CEP Invalido");
      }

      return ViaCepDTO.fromJSON(json);
    } catch (e) {
      print(e);
      Future.error("Erro ao buscar CEP");
    }
  }
}
