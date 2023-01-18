import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:vensemartserviceprovider/ServiceLocationScreen.dart';
import 'package:vensemartserviceprovider/model/service_home_model.dart';
import 'package:vensemartserviceprovider/model/service_provider_plans.dart';
import 'package:vensemartserviceprovider/model/upcoming_request.dart';
import 'package:vensemartserviceprovider/model/user_details_model.dart';
import '../../OtpVerification.dart';
import '../../ServiceIntroScreen.dart';
import '../../apiservices/auth_repo.dart';
import '../../core/session_manager.dart';
import '../../model/accept_reject_booking.dart';
import '../../model/canceled_request.dart';
import '../../model/completed_request.dart';
import '../../model/general_model.dart';
import '../../model/login_model.dart';
import '../../model/register_model.dart';
import '../../model/services_model.dart';
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
  ServicesModel? get servicesModel => _servicesModel;
  ServicesModel? _servicesModel;
  ServicesProviderPlans? get serviceProviderPlans => _serviceProviderPlans;
  ServicesProviderPlans? _serviceProviderPlans;

  UpcomingRequest? get upcomingRequest => _upcomingRequest;
  UpcomingRequest? _upcomingRequest;

  CompletedRequestModel? get completedRequestModel => _completedRequestModel;
  CompletedRequestModel? _completedRequestModel;
  CancelledRequestModel? get cancelledRequestModel => _cancelledRequestModel;
  CancelledRequestModel? _cancelledRequestModel;


  AcceptRejectBookingModel? get acceptRejectBookingModel => _acceptRejectBookingModel;
  AcceptRejectBookingModel? _acceptRejectBookingModel;



  bool get isAvailable =>
      _upcomingRequest != null &&
          _upcomingRequest?.data != null &&
          _upcomingRequest!.data!.isNotEmpty;

  bool get isPresent =>
      _serviceProviderPlans != null &&
          _serviceProviderPlans?.data != null &&
          _serviceProviderPlans!.data!.isNotEmpty;


  void signIn({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;

      String? token = await FirebaseMessaging.instance.getToken();
      print(token);
      notifyListeners();
      Response? response = await authRepo.login(map!);
      if (response != null && response.statusCode == 200) {
        _isLoading = false;
        SessionManager.instance.isLoggedIn = true;


        _loginModel = LoginModel.fromJson(response.data);
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content:  Text('${_loginModel?.message}'),
          duration: const Duration(seconds: 10),
          action: SnackBarAction(
            label: 'ACTION',
            onPressed: () { },
          ),
        ));
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
      ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
        content:  Text('${_registerModel?.message}'),
        duration: const Duration(seconds: 10),
        action: SnackBarAction(
          label: 'ACTION',
          onPressed: () { },
        ),
      ));
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
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content:  Text('${_registerModel?.message}'),
          duration: const Duration(seconds: 10),
          action: SnackBarAction(
            label: 'ACTION',
            onPressed: () { },
          ),
        ));
        print(_registerModel!.data!.email!);
        SessionManager.instance.authToken = _registerModel!.data!.apiToken!;
        _isLoading = false;
        sendOTP(context);
      }
      notifyListeners();
    } catch (e, str) {
      _isLoading = false;
      ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
        content:  Text('${_registerModel?.message}'),
        duration: const Duration(seconds: 10),
        action: SnackBarAction(
          label: 'ACTION',
          onPressed: () { },
        ),
      ));
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
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content:  Text('${ response?.statusMessage}'),
          duration: const Duration(seconds: 10),
          // action: SnackBarAction(
          //   label: 'ACTION',
          //   onPressed: () { },
          // ),
        ));

        Navigator.push(
          context!,
          MaterialPageRoute(
            builder: (context) => const ServiceIntroScreen(),
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

        ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
          content:  Text('profile updated successfully'),
          duration: Duration(seconds: 10),
          // action: SnackBarAction(
          //   label: 'ACTION',
          //   onPressed: () { },
          // ),
        ));
        // Navigator.push(
        //   context!,
        //   MaterialPageRoute(
        //     builder: (context) => const ServiceProviderHomeScreen(),
        //   ),
        // );

      }
      notifyListeners();
    } catch (e, str) {
      _isLoading = false;
      notifyListeners();
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void services() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.services();
      if (response != null && response.statusCode == 200) {
        _servicesModel = ServicesModel.fromJson(response.data);
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
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

  void serviceproviderplans() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.providerPlans();
      if (response != null && response.statusCode == 200) {
        _serviceProviderPlans = ServicesProviderPlans.fromJson(response.data);
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }


  void upcomingRequests() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.upcomingRequest();
      if (response != null && response.statusCode == 200) {
        _upcomingRequest = UpcomingRequest.fromJson(response.data);
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }

  void canceledRequests() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.canceledRequest();
      if (response != null && response.statusCode == 200) {
        _cancelledRequestModel = CancelledRequestModel.fromJson(response.data);
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }



  void completedRequests() async {
    try {
      _isLoading = true;
      Response? response = await authRepo.CompletedRequest();
      if (response != null && response.statusCode == 200) {
        _completedRequestModel = CompletedRequestModel.fromJson(response.data);
        _isLoading = false;
      }
      notifyListeners();
    } catch (e, str) {
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }







  void acceptRejectBooking({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.acceptRejectBooking(map!);
      if (response != null && response.statusCode == 200) {
        _isLoading = false;
        SessionManager.instance.isLoggedIn = true;

        _acceptRejectBookingModel = AcceptRejectBookingModel.fromJson(response.data);

        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content:  Text('${_acceptRejectBookingModel?.message}'),
          duration: const Duration(seconds: 10),
          action: SnackBarAction(
            label: 'ACTION',
            onPressed: () { },
          ),
        ));
        // Navigator.pushReplacement(
        //   context!,
        //   MaterialPageRoute(
        //     builder: (context) => const ServiceLocationScreen(),
        //   ),
        // );
      }
      notifyListeners();
    } catch (e, str) {
      _isLoading = false;
      ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
        content:  Text('${_acceptRejectBookingModel?.message}'),
        duration: const Duration(seconds: 10),
        action: SnackBarAction(
          label: 'ACTION',
          onPressed: () { },
        ),
      ));
      notifyListeners();
      debugPrint("Error: $e");
      debugPrint("StackTrace: $str");
    }
  }



  void endBooking({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.endBooking(map!);
      if (response != null && response.statusCode == 200) {
        _isLoading = false;
        SessionManager.instance.isLoggedIn = true;

        // _completedRequestModel = CompletedRequestModel.fromJson(response.data);
        //
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content:  Text('booking completed successfully'),
          duration: const Duration(seconds: 10),
          // action: SnackBarAction(
          //   label: 'ACTION',
          //   onPressed: () { },
          // ),
        ));
        // Navigator.pushReplacement(
        //   context!,
        //   MaterialPageRoute(
        //     builder: (context) => const ServiceLocationScreen(),
        //   ),
        // );
      }
      notifyListeners();
    } catch (e, str) {
      _isLoading = false;
      ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
        content:  Text('$e'),
        duration: const Duration(seconds: 10),
        // action: SnackBarAction(
        //   label: 'ACTION',
        //   onPressed: () { },
        // ),
      ));
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

  void sendLocation({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.sendLocation(map!);
      if (response != null && response.statusCode == 200) {
        _isLoading = false;
        SessionManager.instance.isLoggedIn = true;

        _servicesModel = ServicesModel.fromJson(response.data);

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

  void sendServiceId({Map<String, String>? map, BuildContext? context}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Response? response = await authRepo.sendServiceId(map!);
      if (response != null && response.statusCode == 200) {
        _isLoading = false;
        SessionManager.instance.isLoggedIn = true;

        _servicesModel = ServicesModel.fromJson(response.data);
        Navigator.pushReplacement(
          context!,
          MaterialPageRoute(
            builder: (context) => const ServiceLocationScreen(),
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



}
