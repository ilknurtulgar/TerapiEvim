import '../../core/constants/api_const.dart';
import '../../core/init/network/model/error_model_custom.dart';
import '../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../core/managers/firebase/firestore/models/empty_model.dart';
import '../../model/participant/_initial_data/is_session_complete_model.dart';
import 'i_short_video_call_service.dart';

class ShortVideoCallService extends IShortVideoCallService {
  ShortVideoCallService(IFirestoreManager<ErrorModelCustom> manager)
      : super(manager);

  @override
  Future<String?> pSetIsSessionComplete() async {
    if (userId == null) return 'UserId is null';

    final result = await manager.update<IsSessionCompleteModel, EmptyModel>(
      collectionPath: APIConst.participant,
      docId: userId!,
      data: IsSessionCompleteModel(isSessionComplete: true),
    );
    if (result.error != null) {
      return result.error?.description;
    }
    return null;
  }
}
