import 'package:expense_tracker_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:expense_tracker_app/core/exceptions/base_exception.dart';

final class EmailVerificationUsecase {
  final AuthRepository repository;
  EmailVerificationUsecase({required this.repository});
  Future<void> call() async {
    try {
      await repository.emailVerify();
    } on Exception {
      throw BaseException('Cant verify');
    }
  }
}
