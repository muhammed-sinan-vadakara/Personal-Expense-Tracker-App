import 'package:expense_tracker_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:expense_tracker_app/core/exceptions/authentication/auth_failed_exception.dart';
import 'package:expense_tracker_app/core/exceptions/authentication/invalid_credentials_exception.dart';

final class SignupUsecase {
  final AuthRepository repository;
  SignupUsecase({required this.repository});

  Future<void> call(String email, String password) async {
    /// Verify email and password
    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw InvalidCredentialsException();
    }

    try {
      await repository.createAccount(email, password);
    } on Exception {
      throw AuthenticationFailedException('Cannot signup. Please try again.');
    }
  }
}
