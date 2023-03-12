import '../interface/i_error_model.dart';
import '../interface/i_fire_response_model.dart';
import '../interface/i_network_model.dart';

class ResponseModel<T, E extends INetworkModel<E>?>
    extends IResponseModel<T?, E> {
  ResponseModel({T? data, IErrorModel<E>? error}) : super(data, error);
}
