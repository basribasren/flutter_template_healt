// ignore_for_file: must_be_immutable

part of 'location_bloc.dart';

/// Represents the state of Location in the application.
class LocationState extends Equatable {
  LocationState({
    this.searchController,
    this.addressController,
    this.locationModelObj,
  });

  TextEditingController? searchController;

  TextEditingController? addressController;

  LocationModel? locationModelObj;

  @override
  List<Object?> get props => [
        searchController,
        addressController,
        locationModelObj,
      ];
  LocationState copyWith({
    TextEditingController? searchController,
    TextEditingController? addressController,
    LocationModel? locationModelObj,
  }) {
    return LocationState(
      searchController: searchController ?? this.searchController,
      addressController: addressController ?? this.addressController,
      locationModelObj: locationModelObj ?? this.locationModelObj,
    );
  }
}
