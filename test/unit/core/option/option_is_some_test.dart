import 'package:flutter_test/flutter_test.dart';
import 'package:hmi_core/hmi_core_option.dart';

void main() {
  group('Option is Some', () {
    test('returns true if it is instance of Some', () {
      for(int i=-50; i<=50; i++) {
        final Option<int> option = Some(i);
        expect(option is Some, equals(true));
      }
    });
    test('returns false if it is instance of None', () {
      const Option<int> option = None();
      expect(option is Some, equals(false));
    });
  });
}