import 'package:fininfocom/viewModel/user_profile_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserViewModel Tests', () {
    test('Fetch random user successfully', () async {
      final userViewModel = UserViewModel();
      await userViewModel.fetchRandomUser();

      // Assert that the user data is not null.
      expect(userViewModel.user, isNotNull);
    });
  });
}
