// ignore_for_file: must_be_immutable

part of 'doctor_detail_bloc.dart';

/// Represents the state of DoctorDetail in the application.
class DoctorDetailState extends Equatable {
  DoctorDetailState({this.doctorDetailModelObj});

  DoctorDetailModel? doctorDetailModelObj;

  @override
  List<Object?> get props => [
        doctorDetailModelObj,
      ];
  DoctorDetailState copyWith({DoctorDetailModel? doctorDetailModelObj}) {
    return DoctorDetailState(
      doctorDetailModelObj: doctorDetailModelObj ?? this.doctorDetailModelObj,
    );
  }
}
