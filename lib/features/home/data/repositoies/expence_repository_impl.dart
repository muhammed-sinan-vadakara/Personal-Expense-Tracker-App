import 'package:expense_tracker_app/features/home/domain/repositoies/expence_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:expense_tracker_app/features/authentication/data/datasource/authentication_datasource_impl.dart';
import 'package:expense_tracker_app/features/authentication/domain/repositories/auth_repository.dart';

part 'expence_repository_impl.g.dart';

class ExpenceRepositoryImpl implements ExpenceRepository {
  @override
  Future<void> addExpense() {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteExpense() {
    throw UnimplementedError();
  }

  @override
  Future<void> editExpense() {
    throw UnimplementedError();
  }

  @override
  Future<void> getAllExpense() {
    throw UnimplementedError();
  }
  // final FirebaseAuthDataSource datasource;
  // AuthRepositoryImpl({
  // required this.datasource
  // });

  // @override
  // Future<void> createAccount(String email, String password) async {
  //   await datasource.createAccount(email, password);
  // }

  // @override
  // Future<void> loginUser(String email, String password) async {
  //   await datasource.loginUser(email, password);
  // }

  // @override
  // Future<void> logout() async {
  //   await datasource.logout();
  // }

  // @override
  // Future<void> emailVerify() async {
  //   await datasource.emailVerfication();
  // }

  // @override
  // Future<void> resetPasswordbyemail(String email) async {
  //   await datasource.resetPassword(email);
  // }

  // @override
  // Future<void> googleverifications() async {
  //   await datasource.googleverification();
  // }

  // @override
  // Future<(String, int?)> phoneNumberVerificationbyOtp(
  //     String phoneNumber) async {
  //   return await datasource.phoneNumberVerificationbyOtp(phoneNumber);
  // }

  // @override
  // Future<void> verifyPhoneOtp(String verificationId, String otp) async {
  //   await datasource.verifyOtp(verificationId, otp);
  // }
}

@riverpod
ExpenceRepository expenceRepository(ExpenceRepositoryRef ref) {
  return ExpenceRepositoryImpl(
      // datasource: ref.watch(firebaseAuthDataSourceProvider),
      );
}
