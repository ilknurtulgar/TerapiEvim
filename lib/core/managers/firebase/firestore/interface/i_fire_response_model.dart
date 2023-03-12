import 'i_error_model.dart';
import 'i_network_model.dart';

abstract class IResponseModel<T, E extends INetworkModel<E>?> {
  T data;
  IErrorModel<E>? error;

  IResponseModel(this.data, this.error);
}
