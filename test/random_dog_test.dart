import 'package:fininfocom/viewModel/dog_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DogViewModel Tests', () {
    test('Fetch random dog image successfully', () async {
      final dogViewModel = DogViewModel();
      await dogViewModel.fetchRandomDog();

      // Assert that the image URL is not null.
      expect(dogViewModel.currentDog!.imageUrl, isNotNull);
    });
  });
}
