import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:pure_life/core/data/dto/dto.dart';
import 'package:pure_life/core/data/purelife_repository.dart';
import 'package:pure_life/core/ui_utils/ui_utils.dart';
import 'package:pure_life/core/utils/utils.dart';

class SignupScreenViewModel extends DisposableChangeNotifier {
  SignupScreenViewModel(this._repo);
  final PureLifeRepository _repo;

  final TextEditingController fName = TextEditingController();
  final TextEditingController lName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNo = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController passWord = TextEditingController();
  final TextEditingController confirmPassWord = TextEditingController();
  String country = '';
  String state = '';
  String city = '';

  num countryId = -1;
  num stateId = -1;
  num cityId = -1;

  List<Location> countries = [];
  List<Location> states = [];
  List<Location> areas = [];
  String selectedCountry = '';
  String selectedState = '';
  String selectedArea = '';
  final fbKey = GlobalKey<FormState>();

  String? fNameErrorText = '';

  String? lNameErrorText = '';
  String? emailErrorText = '';
  String? pswdErrorText = '';
  String? confirmPswdErrorText = '';

  Future<void> getCountries() async {
    final response = await _repo.listCountries();
    response.fold(
        (left) => showSnackBar(left.toString()), (right) => countries = List.from(right.locationList));
    selectedCountry = countries[0].name;
    notifyListeners();
  }

  Future<void> getStates() async {
    final response = await _repo.listStateInCountry(countryId: countryId);
    response.fold(
        (left) => showSnackBar(left.toString()), (right) => states = List.from(right.locationList));
    selectedState = states[0].name;
    notifyListeners();
  }

  Future<void> getCities() async {
    final response = await _repo.listAreasInState(stateId: stateId);
    response.fold(
        (left) => showSnackBar(left.toString()), (right) => areas = List.from(right.locationList));
    selectedArea = areas[0].name;
    notifyListeners();
  }

  num getLocationIdByName(List<Location> locationList, String name) {
    final location = locationList.firstWhere((element) => element.name == name);
    return location.id;
  }

  @override
  void disposeValues() {
    // TODO: implement disposeValues
  }
}
