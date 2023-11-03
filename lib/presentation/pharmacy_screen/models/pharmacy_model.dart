// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'popularproduct_item_model.dart';
import 'productonsale_item_model.dart';

/// This class defines the variables used in the [pharmacy_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class PharmacyModel extends Equatable {
  PharmacyModel({
    this.popularproductItemList = const [],
    this.productonsaleItemList = const [],
  }) {}

  List<PopularproductItemModel> popularproductItemList;

  List<ProductonsaleItemModel> productonsaleItemList;

  PharmacyModel copyWith({
    List<PopularproductItemModel>? popularproductItemList,
    List<ProductonsaleItemModel>? productonsaleItemList,
  }) {
    return PharmacyModel(
      popularproductItemList:
          popularproductItemList ?? this.popularproductItemList,
      productonsaleItemList:
          productonsaleItemList ?? this.productonsaleItemList,
    );
  }

  @override
  List<Object?> get props => [popularproductItemList, productonsaleItemList];
}
