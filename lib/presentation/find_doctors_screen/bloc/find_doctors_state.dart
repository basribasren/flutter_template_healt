// ignore_for_file: must_be_immutable

part of 'find_doctors_bloc.dart';

/// Represents the state of FindDoctors in the application.
class FindDoctorsState extends Equatable {
  FindDoctorsState({
    this.searchController,
    this.findDoctorsModelObj,
  });

  TextEditingController? searchController;

  FindDoctorsModel? findDoctorsModelObj;

  @override
  List<Object?> get props => [
        searchController,
        findDoctorsModelObj,
      ];
  FindDoctorsState copyWith({
    TextEditingController? searchController,
    FindDoctorsModel? findDoctorsModelObj,
  }) {
    return FindDoctorsState(
      searchController: searchController ?? this.searchController,
      findDoctorsModelObj: findDoctorsModelObj ?? this.findDoctorsModelObj,
    );
  }
}
