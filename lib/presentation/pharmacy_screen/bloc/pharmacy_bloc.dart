import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/popularproduct_item_model.dart';
import '../models/productonsale_item_model.dart';
import 'package:basri_s_application16/presentation/pharmacy_screen/models/pharmacy_model.dart';
part 'pharmacy_event.dart';
part 'pharmacy_state.dart';

/// A bloc that manages the state of a Pharmacy according to the event that is dispatched to it.
class PharmacyBloc extends Bloc<PharmacyEvent, PharmacyState> {
  PharmacyBloc(PharmacyState initialState) : super(initialState) {
    on<PharmacyInitialEvent>(_onInitialize);
  }

  List<PopularproductItemModel> fillPopularproductItemList() {
    return [
      PopularproductItemModel(
          panadol: ImageConstant.imgEf58faa9a71e47e,
          panadol1: "Panadol",
          pcs: "20pcs",
          price: "15.99"),
      PopularproductItemModel(
          panadol1: "Bodrex Herbal", pcs: "100ml", price: "7.99"),
      PopularproductItemModel(panadol1: "Konidin", pcs: "3pcs", price: "5.99")
    ];
  }

  List<ProductonsaleItemModel> fillProductonsaleItemList() {
    return [
      ProductonsaleItemModel(
          oBHCombi: ImageConstant.imgCalciumLLysin,
          oBHCombi1: "OBH Combi",
          measurement: "75ml",
          price: "9.99",
          price1: "10.99"),
      ProductonsaleItemModel(oBHCombi1: "Betadine", measurement: "50ml"),
      ProductonsaleItemModel(
          oBHCombi1: "Bodrexin",
          measurement: "75ml",
          price: "7.99",
          price1: "8.99")
    ];
  }

  _onInitialize(
    PharmacyInitialEvent event,
    Emitter<PharmacyState> emit,
  ) async {
    emit(state.copyWith(searchController: TextEditingController()));
    emit(state.copyWith(
        pharmacyModelObj: state.pharmacyModelObj?.copyWith(
            popularproductItemList: fillPopularproductItemList(),
            productonsaleItemList: fillProductonsaleItemList())));
  }
}
