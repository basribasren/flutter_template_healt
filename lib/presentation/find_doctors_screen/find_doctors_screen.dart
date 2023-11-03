import '../find_doctors_screen/widgets/doctors_item_widget.dart';
import '../find_doctors_screen/widgets/finddoctors_item_widget.dart';
import 'bloc/find_doctors_bloc.dart';
import 'models/doctors_item_model.dart';
import 'models/find_doctors_model.dart';
import 'models/finddoctors_item_model.dart';
import 'package:basri_s_application16/core/app_export.dart';
import 'package:basri_s_application16/widgets/app_bar/appbar_leading_image.dart';
import 'package:basri_s_application16/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:basri_s_application16/widgets/app_bar/custom_app_bar.dart';
import 'package:basri_s_application16/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

class FindDoctorsScreen extends StatelessWidget {
  const FindDoctorsScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<FindDoctorsBloc>(
        create: (context) => FindDoctorsBloc(
            FindDoctorsState(findDoctorsModelObj: FindDoctorsModel()))
          ..add(FindDoctorsInitialEvent()),
        child: FindDoctorsScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 24.v),
                child: Column(children: [
                  BlocSelector<FindDoctorsBloc, FindDoctorsState,
                          TextEditingController?>(
                      selector: (state) => state.searchController,
                      builder: (context, searchController) {
                        return CustomSearchView(
                            controller: searchController,
                            hintText: "lbl_find_a_doctor".tr);
                      }),
                  SizedBox(height: 28.v),
                  _buildCategories(context),
                  SizedBox(height: 24.v),
                  _buildRecommendedDoctors(context),
                  SizedBox(height: 26.v),
                  _buildYourRecentDoctors(context),
                  SizedBox(height: 5.v)
                ]))));
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
        title: AppbarSubtitleOne(text: "lbl_find_doctors".tr));
  }

  /// Section Widget
  Widget _buildCategories(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 2.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_category".tr, style: theme.textTheme.titleMedium),
          SizedBox(height: 16.v),
          Padding(
              padding: EdgeInsets.only(right: 5.h),
              child: BlocSelector<FindDoctorsBloc, FindDoctorsState,
                      FindDoctorsModel?>(
                  selector: (state) => state.findDoctorsModelObj,
                  builder: (context, findDoctorsModelObj) {
                    return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 83.v,
                            crossAxisCount: 4,
                            mainAxisSpacing: 22.h,
                            crossAxisSpacing: 22.h),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:
                            findDoctorsModelObj?.finddoctorsItemList.length ??
                                0,
                        itemBuilder: (context, index) {
                          FinddoctorsItemModel model =
                              findDoctorsModelObj?.finddoctorsItemList[index] ??
                                  FinddoctorsItemModel();
                          return FinddoctorsItemWidget(model);
                        });
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildRecommendedDoctors(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 2.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("msg_recommended_doctors".tr,
              style: theme.textTheme.titleMedium),
          SizedBox(height: 11.v),
          Container(
              margin: EdgeInsets.only(right: 2.h),
              padding: EdgeInsets.symmetric(vertical: 15.v),
              decoration: AppDecoration.outlineGray300
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgEllipse8888x88,
                        height: 88.adaptSize,
                        width: 88.adaptSize,
                        radius: BorderRadius.circular(44.h),
                        margin: EdgeInsets.only(bottom: 12.v)),
                    Padding(
                        padding: EdgeInsets.only(top: 2.v, bottom: 7.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("msg_dr_marcus_horizon".tr,
                                  style: CustomTextStyles.titleMedium16),
                              SizedBox(height: 9.v),
                              Text("lbl_chardiologist".tr,
                                  style: CustomTextStyles.bodyMediumGray500),
                              SizedBox(height: 4.v),
                              SizedBox(width: 167.h, child: Divider()),
                              SizedBox(height: 22.v),
                              Row(children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgStar,
                                    height: 16.adaptSize,
                                    width: 16.adaptSize,
                                    margin: EdgeInsets.only(bottom: 1.v)),
                                Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: Text("lbl_4_7".tr,
                                        style: CustomTextStyles
                                            .labelLargeAmber500)),
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgLocationErrorcontainer,
                                    height: 16.adaptSize,
                                    width: 16.adaptSize,
                                    margin: EdgeInsets.only(
                                        left: 24.h, bottom: 1.v)),
                                Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: Text("lbl_800m_away".tr,
                                        style: CustomTextStyles
                                            .titleSmallErrorContainer))
                              ])
                            ]))
                  ]))
        ]));
  }

  /// Section Widget
  Widget _buildYourRecentDoctors(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 2.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("msg_your_recent_doctors".tr,
              style: theme.textTheme.titleMedium),
          SizedBox(height: 18.v),
          SizedBox(
              height: 89.v,
              child: BlocSelector<FindDoctorsBloc, FindDoctorsState,
                      FindDoctorsModel?>(
                  selector: (state) => state.findDoctorsModelObj,
                  builder: (context, findDoctorsModelObj) {
                    return ListView.separated(
                        padding: EdgeInsets.only(right: 2.h),
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 24.h);
                        },
                        itemCount:
                            findDoctorsModelObj?.doctorsItemList.length ?? 0,
                        itemBuilder: (context, index) {
                          DoctorsItemModel model =
                              findDoctorsModelObj?.doctorsItemList[index] ??
                                  DoctorsItemModel();
                          return DoctorsItemWidget(model);
                        });
                  }))
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
