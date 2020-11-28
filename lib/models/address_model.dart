import 'package:ecommerce/dtos/viacep_dto.dart';

class AddressModel {
  String zipCode;
  String street;
  String number;
  String district;
  String city;
  String state;
  String complement;

  AddressModel();

  AddressModel.fromViaCEP(ViaCepDTO viaCepDTO) {
    zipCode = viaCepDTO.cep;
    street = viaCepDTO.logradouro;
    district = viaCepDTO.bairro;
    city = viaCepDTO.localidade;
    state = viaCepDTO.uf;
  }
}
