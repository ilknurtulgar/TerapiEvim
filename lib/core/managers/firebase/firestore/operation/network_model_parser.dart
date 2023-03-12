part of '../firestore_manager.dart';

R? _parseBody<R, T extends INetworkModel>(dynamic responseBody, T model,
    [bool isLoggerEnabled = false]) {
  try {
    if (responseBody is List) {
      return responseBody.map((data) => model.fromJson(data))
          .cast<T>()
          .toList() as R;
    } else if (responseBody is Map<String, dynamic>) {
      return model.fromJson(responseBody) as R;
    } else {
      if (R is EmptyModel || R == EmptyModel) {
        return EmptyModel(name: responseBody.toString()) as R;
      } else {
        CustomLogger(
            isEnabled: isLoggerEnabled,
            data: 'Be careful your data $responseBody, I could not parse it');
        return null;
      }
    }
  } catch (e) {
    CustomLogger(
        isEnabled: isLoggerEnabled,
        data: 'Parse Error: $e - response body: $responseBody T model: $T , R model: $R ');
  }
  return null;
}
