// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'categories_item_model.dart';
import 'doctor_item_model.dart';

/// This class defines the variables used in the [home_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeModel extends Equatable {
  HomeModel({
    this.categoriesItemList = const [],
    this.doctorItemList = const [],
  }) {}

  List<CategoriesItemModel> categoriesItemList;

  List<DoctorItemModel> doctorItemList;

  HomeModel copyWith({
    List<CategoriesItemModel>? categoriesItemList,
    List<DoctorItemModel>? doctorItemList,
  }) {
    return HomeModel(
      categoriesItemList: categoriesItemList ?? this.categoriesItemList,
      doctorItemList: doctorItemList ?? this.doctorItemList,
    );
  }

  @override
  List<Object?> get props => [categoriesItemList, doctorItemList];
}
