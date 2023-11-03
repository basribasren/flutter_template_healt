// ignore_for_file: must_be_immutable

part of 'booking_doctor_bloc.dart';

/// Represents the state of BookingDoctor in the application.
class BookingDoctorState extends Equatable {
  BookingDoctorState({
    this.shareController,
    this.bookingDoctorModelObj,
  });

  TextEditingController? shareController;

  BookingDoctorModel? bookingDoctorModelObj;

  @override
  List<Object?> get props => [
        shareController,
        bookingDoctorModelObj,
      ];
  BookingDoctorState copyWith({
    TextEditingController? shareController,
    BookingDoctorModel? bookingDoctorModelObj,
  }) {
    return BookingDoctorState(
      shareController: shareController ?? this.shareController,
      bookingDoctorModelObj:
          bookingDoctorModelObj ?? this.bookingDoctorModelObj,
    );
  }
}
