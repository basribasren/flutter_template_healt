import '../../../core/app_export.dart';

/// This class is used in the [popularproduct_item_widget] screen.
class PopularproductItemModel {
  PopularproductItemModel({
    this.panadol,
    this.panadol1,
    this.pcs,
    this.price,
    this.id,
  }) {
    panadol = panadol ?? ImageConstant.imgEf58faa9a71e47e;
    panadol1 = panadol1 ?? "Panadol";
    pcs = pcs ?? "20pcs";
    price = price ?? "15.99";
    id = id ?? "";
  }

  String? panadol;

  String? panadol1;

  String? pcs;

  String? price;

  String? id;
}
