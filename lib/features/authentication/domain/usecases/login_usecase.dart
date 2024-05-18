import 'package:expense_tracker_app/core/exceptions/authentication/auth_failed_exception.dart';
import 'package:expense_tracker_app/core/exceptions/authentication/invalid_credentials_exception.dart';
import 'package:expense_tracker_app/features/authentication/domain/repositories/auth_repository.dart';

final class LoginUsecase {
  final AuthRepository repository;
  LoginUsecase({required this.repository});

  Future<void> call(String email, String password) async {
    /// Verify email and password
    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw InvalidCredentialsException();
    }

    try {
      await repository.loginUser(email, password);
    } on Exception {
      throw AuthenticationFailedException('Cannot Login. Please try again.');
    }
  }
}
