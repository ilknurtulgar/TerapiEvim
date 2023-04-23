import '../../../../core/base/service/base_service.dart';
import '../../../../core/constants/api_const.dart';
import '../../../../core/constants/app_const.dart';
import '../../../../core/init/cache/local_manager.dart';
import '../../../../core/init/network/model/error_model_custom.dart';
import '../../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../../core/managers/firebase/firestore/models/created_id_response.dart';
import '../../../../model/therapist/session/free_date/t_free_date_model.dart';
import '../../../../model/therapist/session/free_date/t_free_hours_model.dart';
import '../../../../product/enum/local_keys_enum.dart';
import 'i_t_free_dates_service.dart';

class TFreeDateService extends ITFreeDateService with BaseService {
  TFreeDateService(IFirestoreManager<ErrorModelCustom> manager)
      : super(manager);

  @override
  Future<CreatedIdResponse?> createFreeDate(TFreeDateModel freeDate) async {
    try {
      if (userId == null) return null;

      /// Setting id of a current therapist
      freeDate.therapistId = userId;

      /// Setting name of a current therapist
      freeDate.therapistName =
          LocalManager.instance.getStringValue(LocalManagerKeys.name);

      if (freeDate.hours.isEmpty) {
        throw Exception('freeDate.hours.isEmpty');
      }

      final CreatedIdResponse? createdIdResponseOfDate = await manager.create(
        collectionPath: APIConst.freeDates,
        data: freeDate.toJson()!,
      );

      if (createdIdResponseOfDate?.id == null) {
        throw Exception('createdIdResponseOfDate?.id == null');
      }

      for (TFreeHoursModel hour in freeDate.hours) {
        hour.freeDateId = createdIdResponseOfDate!.id;
        hour.isFree = true;
        hour.participantId = '';
        hour.therapistId = userId!;
        hour.therapistName = freeDate.therapistName ;
        final CreatedIdResponse? createdIdResponse = await manager.create(
          collectionPath: APIConst.freeHours,
          data: hour.toJson()!,
        );

        if (createdIdResponse == null) {
          throw Exception('createdIdResponse == null in freeDate.hours loop');
        }
      }

      return createdIdResponseOfDate;
    } catch (e) {
      await crashlyticsManager.sendACrash(
          error: e.toString(),
          stackTrace: StackTrace.current,
          reason: 'createFreeDate');
      rethrow;
    }
  }

  // @override
  // Future<String?> updateFreeDate(TFreeDateModel freeDate) async {
  //   try {
  //     if (userId == null) {
  //       throw Exception("userId is null in TFreeDateModel.");
  //     }
  //
  //     if (freeDate.id == null) {
  //       throw Exception("ID is null in TFreeDateModel.");
  //     }
  //     final result = await manager.update<TFreeDateModel, EmptyModel>(
  //       collectionPath: APIConst.freeDates,
  //       docId: freeDate.id!,
  //       data: freeDate,
  //     );
  //     if (result.error != null) {
  //       return result.error?.description;
  //     }
  //
  //     return null;
  //   } catch (e) {
  //     await crashlyticsManager.sendACrash(
  //         error: e.toString(), stackTrace: StackTrace.current, reason: '');
  //     return e.toString();
  //   }
  // }
  //
  // @override
  // Future<String?> deleteFreeDate(String freeDateId) async {
  //   if (userId == null) return null;
  //
  //   final result = await manager.delete(
  //     collectionPath: APIConst.freeDates,
  //     docId: freeDateId,
  //   );
  //   if (result == false) {
  //     return "ERROR";
  //   }
  //   return null;
  // }

  @override
  Future<TFreeDateModel?> getFreeDateById(String freeDateId) async {
    if (userId == null) return null;

    final result = await manager.readOne<TFreeDateModel, TFreeDateModel>(
      collectionPath: APIConst.freeDates,
      docId: freeDateId,
      parseModel: TFreeDateModel(),
    );

    if (result.error != null) {
      return null;
    }

    final List<TFreeHoursModel> freeHours =
        await _getFreeHours(result.data!.id!);
    if (freeHours.isNotEmpty) {
      result.data!.hours.addAll(freeHours);
    }

    return result.data;
  }

  @override
  Future<List<TFreeDateModel>> getMyFreeDatesOrdered({
    String lastDocId = '',
    String orderField = AppConst.dateTime,
    bool isDescending = false,
  }) async {
    try {
      if (userId == null) return [];

      final result =
          await manager.readOrderedWhere<TFreeDateModel, List<TFreeDateModel>>(
        collectionPath: APIConst.freeDates,
        parseModel: TFreeDateModel(),
        orderField: orderField,
        whereField: AppConst.therapistId,
        whereIsEqualTo: userId!,
        isDescending: isDescending,
        lastDocumentId: lastDocId,
      );
      if (result.error != null || result.data == null) {
        return [];
      }

      for (TFreeDateModel freeDate in result.data!) {
        if (freeDate.id == null) continue;

        final List<TFreeHoursModel> freeHours =
            await _getFreeHours(freeDate.id!);

        if (freeHours.isNotEmpty) freeDate.hours = [...freeHours];
      }

      return result.data!;
    } catch (e) {
      await crashlyticsManager.sendACrash(
          error: e.toString(),
          stackTrace: StackTrace.current,
          reason: 'getMyFreeDatesOrdered');
      rethrow;
    }
  }

  Future<List<TFreeHoursModel>> _getFreeHours(String freeDateId) async {
    try {
      final freeDateHours = await manager
          .readOrderedWhere<TFreeHoursModel, List<TFreeHoursModel>>(
        parseModel: TFreeHoursModel(),
        collectionPath: APIConst.freeHours,
        docId: freeDateId,
        whereField: AppConst.freeDateId,
        whereIsEqualTo: freeDateId,
        limit: AppConst.twentyItemsPerPage,
        orderField: AppConst.hour,
        lastDocumentId: '',
      );
      if (freeDateHours.error != null || freeDateHours.data == null) {
        return [];
      }
      return freeDateHours.data!;
    } catch (e) {
      await crashlyticsManager.sendACrash(
          error: e.toString(),
          stackTrace: StackTrace.current,
          reason: '_getFreeHours');
      rethrow;
    }
  }
}
