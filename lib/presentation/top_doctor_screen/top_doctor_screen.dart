import '../top_doctor_screen/widgets/topdoctor_item_widget.dart';
import 'bloc/top_doctor_bloc.dart';
import 'models/top_doctor_model.dart';
import 'models/topdoctor_item_model.dart';
import 'package:basri_s_application16/core/app_export.dart';
import 'package:basri_s_application16/widgets/app_bar/appbar_leading_image.dart';
import 'package:basri_s_application16/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:basri_s_application16/widgets/app_bar/appbar_trailing_image.dart';
import 'package:basri_s_application16/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class TopDoctorScreen extends StatelessWidget {
  const TopDoctorScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<TopDoctorBloc>(
        create: (context) =>
            TopDoctorBloc(TopDoctorState(topDoctorModelObj: TopDoctorModel()))
              ..add(TopDoctorInitialEvent()),
        child: TopDoctorScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Padding(
                padding: EdgeInsets.only(left: 24.h, top: 24.v, right: 24.h),
                child: BlocSelector<TopDoctorBloc, TopDoctorState,
                        TopDoctorModel?>(
                    selector: (state) => state.topDoctorModelObj,
                    builder: (context, topDoctorModelObj) {
                      return ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 16.v);
                          },
                          itemCount:
                              topDoctorModelObj?.topdoctorItemList.length ?? 0,
                          itemBuilder: (context, index) {
                            TopdoctorItemModel model =
                                topDoctorModelObj?.topdoctorItemList[index] ??
                                    TopdoctorItemModel();
                            return TopdoctorItemWidget(model);
                          });
                    }))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 64.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 24.h),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarSubtitleTwo(text: "lbl_top_doctor".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgOverflowMenu,
              margin: EdgeInsets.symmetric(horizontal: 16.h))
        ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
