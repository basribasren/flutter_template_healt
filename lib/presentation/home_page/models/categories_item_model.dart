import '../../../core/app_export.dart';

/// This class is used in the [categories_item_widget] screen.
class CategoriesItemModel {
  CategoriesItemModel({
    this.ambulance,
    this.ambulance1,
    this.id,
  }) {
    ambulance = ambulance ?? ImageConstant.imgMusic;
    ambulance1 = ambulance1 ?? "Ambulance";
    id = id ?? "";
  }

  String? ambulance;

  String? ambulance1;

  String? id;
}
