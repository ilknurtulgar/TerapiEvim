import 'package:flutter/material.dart';

import '../../../../core/base/component/login/custom_textfield.dart';
import '../../../../core/base/ui_models/row_model.dart';
import '../../../../core/base/util/base_utility.dart';

final TextEditingController activityTextController = TextEditingController();

class Search extends StatelessWidget implements PreferredSizeWidget {
  const Search(
      {super.key, required this.rowModel, this.height = SizeUtil.appBarHeight});
  final RowModel rowModel;
  final double height;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        iconTheme: const IconThemeData(color: AppColors.black),
        backgroundColor: AppColors.blueChalk,
        elevation: 0,
        title: CustomTextField(
          isOne: true,
          isBig: true,
          isRowModel: true,
          rowModel: rowModel,
          textController: activityTextController,
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

/*   search(UiBaseModel.searchModel(
                  ActivityTextUtil.searchText,
                  IconButton(
                    onPressed: () {
                      context.push(const FilterScreen());

                      //trendyolfiltreicondüzenleme
                    },
                    icon: IconUtility.fiterIcon,
                  ),
                )),*/
