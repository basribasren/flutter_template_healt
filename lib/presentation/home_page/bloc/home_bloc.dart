import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/categories_item_model.dart';
import '../models/doctor_item_model.dart';
import 'package:basri_s_application16/presentation/home_page/models/home_model.dart';
part 'home_event.dart';
part 'home_state.dart';

/// A bloc that manages the state of a Home according to the event that is dispatched to it.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState) {
    on<HomeInitialEvent>(_onInitialize);
  }

  List<CategoriesItemModel> fillCategoriesItemList() {
    return [
      CategoriesItemModel(
          ambulance: ImageConstant.imgMusic, ambulance1: "Ambulance"),
      CategoriesItemModel(
          ambulance: ImageConstant.imgUserPrimary, ambulance1: "Doctor"),
      CategoriesItemModel(
          ambulance: ImageConstant.imgLink, ambulance1: "Pharmacy"),
      CategoriesItemModel(
          ambulance: ImageConstant.imgIconHospital, ambulance1: "Hospital")
    ];
  }

  List<DoctorItemModel> fillDoctorItemList() {
    return [
      DoctorItemModel(
          circleImage: ImageConstant.imgEllipse88,
          fortySeven: "4.7",
          drMarcusHorizon: "Dr. Marcus Horizon",
          chardiologist: "Chardiologist",
          distance: "800m away"),
      DoctorItemModel(
          circleImage: ImageConstant.imgEllipse89,
          fortySeven: "4.7",
          drMarcusHorizon: "Dr. Maria Elena",
          chardiologist: "Chardiologist",
          distance: "800m away"),
      DoctorItemModel(
          circleImage: ImageConstant.imgEllipse88,
          fortySeven: "4.7",
          drMarcusHorizon: "Dr. Marcus Horizon",
          chardiologist: "Chardiologist",
          distance: "800m away"),
      DoctorItemModel(
          circleImage: ImageConstant.imgEllipse89,
          fortySeven: "4.7",
          drMarcusHorizon: "Dr. Maria Elena",
          chardiologist: "Chardiologist",
          distance: "800m away")
    ];
  }

  _onInitialize(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(searchController: TextEditingController()));
    emit(state.copyWith(
        homeModelObj: state.homeModelObj?.copyWith(
            categoriesItemList: fillCategoriesItemList(),
            doctorItemList: fillDoctorItemList())));
  }
}
