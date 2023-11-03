// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'frametwentyfour_item_model.dart';
import '../../../core/app_export.dart';
import 'eightynine_item_model.dart';
import 'sixtyfour_item_model.dart';

/// This class defines the variables used in the [articles_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ArticlesModel extends Equatable {
  ArticlesModel({
    this.frametwentyfourItemList = const [],
    this.eightynineItemList = const [],
    this.sixtyfourItemList = const [],
  }) {}

  List<FrametwentyfourItemModel> frametwentyfourItemList;

  List<EightynineItemModel> eightynineItemList;

  List<SixtyfourItemModel> sixtyfourItemList;

  ArticlesModel copyWith({
    List<FrametwentyfourItemModel>? frametwentyfourItemList,
    List<EightynineItemModel>? eightynineItemList,
    List<SixtyfourItemModel>? sixtyfourItemList,
  }) {
    return ArticlesModel(
      frametwentyfourItemList:
          frametwentyfourItemList ?? this.frametwentyfourItemList,
      eightynineItemList: eightynineItemList ?? this.eightynineItemList,
      sixtyfourItemList: sixtyfourItemList ?? this.sixtyfourItemList,
    );
  }

  @override
  List<Object?> get props =>
      [frametwentyfourItemList, eightynineItemList, sixtyfourItemList];
}
