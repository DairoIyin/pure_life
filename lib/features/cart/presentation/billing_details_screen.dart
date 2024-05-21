import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/constants.dart';
import 'package:pure_life/core/data/dto/delivery_response_dto.dart';
import 'package:pure_life/core/routes/path_names.dart';
import 'package:pure_life/core/themes/themes.dart';
import 'package:pure_life/core/ui_utils/extensions/delivery_name_extension.dart';
import 'package:pure_life/core/ui_utils/ui_utils.dart';
import 'package:pure_life/core/utils/utils.dart';
import 'package:pure_life/features/cart/viewmodel/cart_screen_view_model.dart';
import 'package:pure_life/features/widgets/widgets.dart';

class BillingDetailsScreen extends StatefulWidget {
  const BillingDetailsScreen({super.key});

  @override
  State<BillingDetailsScreen> createState() => _BillingDetailsScreenState();
}

class _BillingDetailsScreenState extends State<BillingDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<CartScreenViewModel>(context, listen: false)
          .getDeliveryLocations();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartScreenViewModel>(builder: (context, value, child) {
      String? _validateInput(Object? value) {
        if (value == null || value.toString().isEmpty) {
          return 'Please enter a value';
        }

        return null;
      }

      String? _validateEmail(String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an email address';
        }
        if (!EmailValidator.validate(value)) {
          return 'Enter a valid email address';
        }
        return null;
      }

      return Form(
        key: value.fbKey,
        child: Scaffold(
          backgroundColor: PureLifeColors.scaffold,
          body: SafeArea(
              child: ListView(
            padding: EdgeInsets.fromLTRB(16.0.w, 30.0.h, 16.0.w, 23.h),
            children: [
              PureLifeHeader(
                title: Strings.billingDetails,
                onBackPressed: () {
                  AppNavigator.pop(context);
                },
              ),
              SizedBox(height: 42.h),
              Text(
                Strings.addDeliveryAddress,
                style: context.textTheme.labelLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 38.h),
              Row(
                children: [
                  Expanded(
                    child: BorderlessTextField(
                      controller: value.fName,
                      title: Strings.firstName,
                      errorString: value.errorText,
                      validator: _validateInput,
                    ),
                  ),
                  SizedBox(width: 15.0.w),
                  Expanded(
                    child: BorderlessTextField(
                      controller: value.lName,
                      title: Strings.lastName,
                      errorString: value.errorText,
                      validator: _validateInput,
                    ),
                  ),
                ],
              ),
              BorderlessTextField(
                controller: value.country,
                title: Strings.country,
                errorString: value.errorText,
                validator: _validateInput,
              ),
              BorderlessTextField(
                controller: value.streetAddress,
                title: Strings.streetAddress,
                hintText: Strings.houseNumberAndStreetName,
                errorString: value.errorText,
                validator: _validateInput,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Strings.deliveryAddress,
                      style: context.textTheme.labelMedium),
                  SizedBox(height: 11.84.h),
                  DropdownButtonFormField(
                    isExpanded: true,
                    style: context.textTheme.labelMedium?.copyWith(
                        fontSize: 11.sp, color: PureLifeColors.secondaryText),
                    dropdownColor: Colors.white,
                    menuMaxHeight: 300.h,
                    value: value.selectedDeliveryLocation,
                    icon: SvgPicture.asset(AppIcons.arrow_downward,
                        width: 7.w, height: 11.h),
                    hint: Text(
                      Strings.selectYourLocation,
                      style: TextStyle(
                          fontSize: 11.sp, fontWeight: FontWeight.w400),
                    ),
                    decoration: dropDownDecoration(context,
                        errorString: value.errorText),
                    validator: _validateInput,
                    items: value.deliveryItems
                        .map<DropdownMenuItem<String>>(
                          (item) => DropdownMenuItem<String>(
                            value: item.name,
                            child: Text(item.name.trimDeliveryName),
                          ),
                        )
                        .toList(),
                    onChanged: (deliveryItem) {
                      value.selectedDeliveryLocation = deliveryItem ?? '';
                    },
                  ),
                ],
              ),
              BorderlessTextField(
                controller: value.apartment,
                title: Strings.deliveryAddress,
                hintText: Strings.apartmentSuiteUnit,
                errorString: value.errorText,
                validator: _validateInput,
                showTitle: false,
              ),
              BorderlessTextField(
                controller: value.town,
                title: Strings.town,
                errorString: value.errorText,
                validator: _validateInput,
              ),
              DropdownButtonFormField<Object>(
                isExpanded: true,
                style: context.textTheme.labelMedium?.copyWith(
                    fontSize: 11.sp, color: PureLifeColors.secondaryText),
                dropdownColor: Colors.white,
                menuMaxHeight: 300.h,
                value: value.selectedState,
                icon: SvgPicture.asset(AppIcons.arrow_downward,
                    width: 7.w, height: 11.h),
                hint: Text(
                  Strings.selectYourLocation,
                  style:
                      TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400),
                ),
                decoration:
                    dropDownDecoration(context, errorString: value.errorText),
                validator: _validateInput,
                items: [],
                onChanged: (val) {},
              ),
              BorderlessTextField(
                controller: value.phone,
                title: Strings.phone,
                errorString: value.errorText,
                validator: _validateInput,
              ),
              BorderlessTextField(
                controller: value.email,
                title: Strings.emailAddress,
                errorString: value.errorText,
                validator: _validateEmail,
              ),
              PureLifeButton(
                  onPressed: () {
                    
                   // if (value.fbKey.currentState!.validate()) {}
                    context.pushNamed(AppPaths.billingSummaryName);
                  },
                  title: Strings.saveChanges),
            ],
          )),
        ),
      );
    });
  }
}
