import '../../../core/app_export.dart';

/// This class is used in the [schedulelist_item_widget] screen.
class SchedulelistItemModel {
  SchedulelistItemModel({
    this.drMarcusHorizon,
    this.chardiologist,
    this.drMarcusHorizon1,
    this.date,
    this.time,
    this.confirmed,
    this.id,
  }) {
    drMarcusHorizon = drMarcusHorizon ?? "Dr. Marcus Horizon";
    chardiologist = chardiologist ?? "Chardiologist";
    drMarcusHorizon1 = drMarcusHorizon1 ?? ImageConstant.imgClose;
    date = date ?? "26/06/2022";
    time = time ?? "10:30 AM";
    confirmed = confirmed ?? "Confirmed";
    id = id ?? "";
  }

  String? drMarcusHorizon;

  String? chardiologist;

  String? drMarcusHorizon1;

  String? date;

  String? time;

  String? confirmed;

  String? id;
}
