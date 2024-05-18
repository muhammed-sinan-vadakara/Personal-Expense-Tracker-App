import 'package:expense_tracker_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:expense_tracker_app/core/exceptions/base_exception.dart';

final class GoogleVerificationUsecase {
  final AuthRepository repository;
  GoogleVerificationUsecase({required this.repository});

  Future<void> call() async {
    try {
      await repository.googleverifications();
    } on Exception {
      throw BaseException('cannot login with google');
    }
  }
}
