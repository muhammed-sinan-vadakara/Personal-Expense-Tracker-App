abstract class FirebaseAuthDataSource {
  // Future<void> loginUser(String email, String password);
  Future<void> addExpense();
  Future<void> editExpense();
  Future<void> deleteExpense();
  Future<void> getAllExpense();
}
