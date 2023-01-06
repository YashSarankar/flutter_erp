import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/middlewares/auth_middleware.dart';
import '../data/middlewares/redirect_middleware.dart';
import '../data/services/token_service.dart';
import '../modules/class/bindings/class_binding.dart';
import '../modules/class/views/class_view.dart';
import '../modules/customers/bindings/customers_binding.dart';
import '../modules/customers/views/customers_view.dart';
import '../modules/designations/bindings/designations_binding.dart';
import '../modules/designations/views/designations_view.dart';
import '../modules/employees/bindings/employees_binding.dart';
import '../modules/employees/views/employees_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/user_group/bindings/user_group_binding.dart';
import '../modules/user_group/views/user_group_view.dart';
import '../modules/users/bindings/users_binding.dart';
import '../modules/users/views/users_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final INITIAL =
      Get.find<TokenService>().hasToken ? Routes.HOME : Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
      middlewares: [
        AuthMiddleware(),
        RedirectMiddleware(
          (route) => const RouteSettings(name: Routes.DESIGNATIONS),
        ),
      ],
    ),
    GetPage(
      name: _Paths.EMPLOYEES,
      page: () => EmployeesView(),
      binding: EmployeesBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.DESIGNATIONS,
      page: () => DesignationsView(),
      binding: DesignationsBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.USERS,
      page: () => UsersView(),
      binding: UsersBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.USER_GROUPS,
      page: () => UserGroupView(),
      binding: UserGroupBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.CUSTOMERS,
      page: () => CustomersView(),
      binding: CustomersBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.CLASS,
      page: () => ClassView(),
      binding: ClassBinding(),
    ),
  ];
}
