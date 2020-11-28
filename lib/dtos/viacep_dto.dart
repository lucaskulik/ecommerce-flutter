class ViaCepDTO {
  String cep;
  String logradouro;
  String bairro;
  String localidade;
  String uf;

  ViaCepDTO.fromJSON(Map<String, dynamic> map) {
    cep = map["cep"] ?? "";
    logradouro = map["logradouro"] ?? "";
    bairro = map["bairro"] ?? "";
    localidade = map["localidade"] ?? "";
    uf = map["uf"] ?? "";
  }
}
