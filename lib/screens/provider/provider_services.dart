import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vensemartserviceprovider/model/service_home_model.dart';
import 'package:vensemartserviceprovider/model/user_details_model.dart';
import '../../OtpVerification.dart';
import '../../apiservices/auth_repo.dart';
import '../../core/session_manager.dart';
import '../../model/general_model.dart';
import '../../model/login_model.dart';
import '../../model/register_model.dart';
import '../ServiceProviderHomeScreen.dart';

class ProviderServices extends ChangeNotifier {
  AuthRepo authRepo = AuthRepo();
  bool? get isLoading => _isLoading;
  bool? _isLoading;
  LoginModel? get loginModel => _loginModel;
  LoginModel? _loginModel;
  RegisterModel? _registerModel;
  ServiceHomeModel? get serviceHomeModel => _serviceHhomeModel;
  ServiceHomeModel? _serviceHhomeModel;
  UserDetailsModel? get userDetailModel => _userDetailsModel;
  UserDetailsModel? _userDetailsModel;

  void signIn({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.login(map!);
      if (response != null && response.statusCode == 200) {
        _isLoading = false;
        SessionManager.instance.isLoggedIn = true;

        _loginModel = LoginModel.fromJson(response.data);
        print(_loginModel?.data?.apiToken);
        SessionManager.instance.authToken = _loginModel!.data!.apiToken!;
        Navigator.pushReplacement(
          context!,
          MaterialPageRoute(
            builder: (context) => const ServiceProviderHomeScreen(),
          ),
        );
      }
      notifyListeners();
    } catch (e, str) {
      _isLoading = false;
      notifyListeners();
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void register({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.register(map!);
      if (response != null && response.statusCode == 200) {
        _registerModel = RegisterModel.fromJson(response.data);
        print(_registerModel!.data!.email!);
        SessionManager.instance.authToken = _registerModel!.data!.apiToken!;
        _isLoading = false;
        sendOTP(context);
      }
      notifyListeners();
    } catch (e, str) {
      _isLoading = false;
      notifyListeners();
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void sendOTP(context) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response =
          await authRepo.sendOtp({'phone_number': phoneNumber!});
      if (response != null && response.statusCode == 200) {
        _isLoading = false;

        Navigator.push(
          context!,
          MaterialPageRoute(
            builder: (context) => OtpVerification(),
          ),
        );
      }
      notifyListeners();
    } catch (e, str) {
      _isLoading = false;
      notifyListeners();
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void verifyOTP({context, otpNumber}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo
          .verifyOtp({"phone_number": phoneNumber!, "otp": otpNumber});
      if (response != null && response.statusCode == 200) {
        _isLoading = false;

        Navigator.push(
          context!,
          MaterialPageRoute(
            builder: (context) => const ServiceProviderHomeScreen(),
          ),
        );
      }
      notifyListeners();
    } catch (e, str) {
      _isLoading = false;
      notifyListeners();
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void updateProfile({context, Map<String, dynamic>? credentials}) async {
    try {
      _isLoading = true;
      notifyListeners();
      var response = await authRepo.updateProfile(credentials!);
      if (response != null) {
        _isLoading = false;

        Navigator.pop(context);
      }
      notifyListeners();
    } catch (e, str) {
      _isLoading = false;
      notifyListeners();
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void serviceHome() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.serviceHome();
      if (response != null && response.statusCode == 200) {
        _isLoading = false;

        _serviceHhomeModel = ServiceHomeModel.fromJson(response.data);
      }
      notifyListeners();
    } catch (e, str) {
      _isLoading = false;
      notifyListeners();
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void getUserDetails() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.getUserDetails();
      if (response != null && response.statusCode == 200) {
        _isLoading = false;

        _userDetailsModel = UserDetailsModel.fromJson(response.data);
      }
      notifyListeners();
    } catch (e, str) {
      _isLoading = false;
      notifyListeners();
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }
}
