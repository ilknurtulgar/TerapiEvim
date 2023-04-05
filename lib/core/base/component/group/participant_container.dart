import 'package:terapievim/core/base/util/base_utility.dart';
import '../../ui_models/card_model.dart';
import '../home/custom_container.dart';

CustomContainer participantContainer(CardModel cardModel, double height,
        {double? width}) =>
    CustomContainer(
        containerModel:
            AppContainers.participantContainer(height, width: width),
        isThereCardModel: true,
        cardModel: cardModel);
