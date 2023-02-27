import 'package:terapievim/core/base/util/base_utility.dart';
import '../../models/card_model.dart';
import '../home/custom_container.dart';

CustomContainer participantContainer(
        CardModel cardModel, double height, double width) =>
    CustomContainer(
        containerModel: AppContainers.participantContainer(height, width),
        isThereCardModel: true,
        cardModel: cardModel);
