import 'i_network_model.dart';

abstract class IErrorModel<T extends INetworkModel?> {
  int? statusCode;
  String? description;
  T? model;
}
