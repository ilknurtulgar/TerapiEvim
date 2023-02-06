import 'package:terapievim/core/base/util/base_utility.dart';
import '../../../core/base/models/card_model.dart';
import '../../home/component/custom_container.dart';

CustomContainer participantContainer(
        CardModel cardModel, double height, double width) =>
    CustomContainer(
        containerModel: AppContainers.participantContainer(height, width),
        cardModel: cardModel);
