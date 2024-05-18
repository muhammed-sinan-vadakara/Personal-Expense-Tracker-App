import 'package:expense_tracker_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:expense_tracker_app/core/exceptions/authentication/auth_failed_exception.dart';

final class ResetPasswordbyEmailUsecase {
  final AuthRepository repository;
  ResetPasswordbyEmailUsecase({required this.repository});

  Future<void> call(String email) async {
    try {
      await repository.resetPasswordbyemail(email);
    } on Exception {
      throw AuthenticationFailedException('Cannot send the reset password');
    }
  }
}
