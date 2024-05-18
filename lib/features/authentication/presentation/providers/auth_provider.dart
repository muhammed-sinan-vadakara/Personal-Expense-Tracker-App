import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:expense_tracker_app/core/exceptions/base_exception.dart';
import 'package:expense_tracker_app/core/utils/snack_bar_utils.dart';
import 'package:expense_tracker_app/features/authentication/data/repositoies/auth_repository_impl.dart';
import 'package:expense_tracker_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:expense_tracker_app/features/authentication/domain/usecases/email_verification_usecase.dart';
import 'package:expense_tracker_app/features/authentication/domain/usecases/google_verification_usecase.dart';
import 'package:expense_tracker_app/features/authentication/domain/usecases/login_usecase.dart';
import 'package:expense_tracker_app/features/authentication/domain/usecases/logout_usecase.dart';
import 'package:expense_tracker_app/features/authentication/domain/usecases/reset_password_usecase.dart';
import 'package:expense_tracker_app/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:expense_tracker_app/features/authentication/presentation/pages/login_page.dart';
import 'package:expense_tracker_app/features/authentication/presentation/providers/authentication_state_provider.dart';
import 'package:expense_tracker_app/features/home/presentation/pages/home_page.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  late final AuthRepository repository;
  @override
  AuthenticationState build() {
    repository = ref.read(authRepositoryProvider);
    return AuthenticationState(verificationId: '', resendToken: null);
  }

  Future<void> signup(
      BuildContext context, String email, String password) async {
    try {
      await SignupUsecase(repository: ref.read(authRepositoryProvider))(
          email, password);
      await verifyEmail(context);
      Future.sync(() => context.go(HomePage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(e.message));
    }
  }

  Future<void> login(
      BuildContext context, String email, String password) async {
    try {
      await LoginUsecase(repository: ref.read(authRepositoryProvider))(
          email, password);
      Future.sync(() => context.go(HomePage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(e.message));
    }
  }

  Future<void> verifyEmail(BuildContext context) async {
    try {
      await EmailVerificationUsecase(
          repository: ref.read(authRepositoryProvider))();
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(e.message));
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      await LogoutUsecase(repository: ref.read(authRepositoryProvider))();
      Future.sync(() => context.go(LoginPage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(e.message));
    }
  }

  Future<void> resetPasswordbyemail(String email, BuildContext context) async {
    try {
      await ResetPasswordbyEmailUsecase(
          repository: ref.read(authRepositoryProvider))(email);
      Future.sync(() => context.go(LoginPage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(e.message));
    }
  }

  Future<void> googleverification(BuildContext context) async {
    try {
      await GoogleVerificationUsecase(
          repository: ref.read(authRepositoryProvider))();
      Future.sync(() => context.go(HomePage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtils.showMessage(e.message));
    }
  }
}
