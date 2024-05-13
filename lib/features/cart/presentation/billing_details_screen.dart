import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:pure_life/core/constants.dart';
import 'package:pure_life/core/data/dto/delivery_response_dto.dart';
import 'package:pure_life/core/routes/path_names.dart';
import 'package:pure_life/core/themes/themes.dart';
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
              DropdownField<DeliveryItem>(
                value: value.selectedDeliveryLocation,
                controller: value.deliveryAddress,
                title: Strings.deliveryAddress,
                menuItems: value.deliveryItems,
                onChanged: (DeliveryItem? deliveryItem) {
                  value.selectedDeliveryLocation = deliveryItem!;
                },
                hintText: Strings.selectYourLocation,
                errorString: value.errorText,
                validator: _validateInput,
                displayField: (DeliveryItem deliveryItem) => deliveryItem.name,
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
              DropdownField(
                  value: '',
                  controller: value.state,
                  title: Strings.state,
                  menuItems: [],
                  onChanged: (val) {},
                  errorString: value.errorText,
                  displayField: (val) {
                    return '';
                  },
                  validator: _validateInput),
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
                    if (value.fbKey.currentState!.validate()) {
                      context.goNamed(AppPaths.billingSummaryName);
                    }
                  },
                  title: Strings.saveChanges),
            ],
          )),
        ),
      );
    });
  }
}
