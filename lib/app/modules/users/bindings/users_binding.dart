import 'package:get/get.dart';

import 'package:flutter_erp/app/data/repositories/designation_repository.dart';
import 'package:flutter_erp/app/data/repositories/employee_repository.dart';
import 'package:flutter_erp/app/data/repositories/permission_group_repository.dart';
import 'package:flutter_erp/app/data/repositories/user_repository.dart';
import 'package:flutter_erp/app/modules/users/controllers/user_form_controller.dart';

import '../controllers/users_controller.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserFormController>(
      () => UserFormController(),
    );
    Get.lazyPut<UsersController>(() => UsersController());
    Get.lazyPut<UserRepository>(() => UserRepository());
    Get.create<EmployeeRepository>(() => EmployeeRepository());
    Get.create<DesignationRepository>(() => DesignationRepository());
    Get.create<PermissionGroupRepository>(() => PermissionGroupRepository());
  }
}
