import 'package:flutter_test/flutter_test.dart';
import 'package:hmi_core/hmi_core.dart' hide Result;
import 'package:hmi_core/hmi_core_result_new.dart';
import 'package:hmi_core/src/core/result_new/extension_adapter.dart';
//
void main() {
  //
  group('Result Adapter extension ok', () {
    //
    test('ok returns Some for Ok and None for Err', () {
      const ok = Ok(1);
      const err = Err('error');
      expect(ok.ok(), isA<Some>());
      expect(err.ok(), isA<None>());
    });
    //
    test('ok returns Some with value inside for Ok', () {
      const resultList = <(Ok, dynamic)>[
        (Ok(1), 1), // int
        (Ok(1.0), 1.0), // double
        (Ok('1'), '1'), // String
        (Ok(true), true), // bool
        (Ok(null), null), // null
        (Ok([1, 2, 3]), [1, 2, 3]), // List
        (Ok({'a': 1, 'b': 2}), {'a': 1, 'b': 2}), // Map
      ];
      for (final result in resultList) {
        final (ok, value) = result;
        expect(ok.ok(), isA<Some>());
        expect((ok.ok() as Some).value, equals(value));
      }
    });
    //
    test('err returns Some for Err and None for Ok', () {
      const ok = Ok(1);
      const err = Err('error');
      expect(ok.err(), isA<None>());
      expect(err.err(), isA<Some>());
    });
    //
    test('err returns Some with value inside for Err', () {
      const resultList = <(Err, dynamic)>[
        (Err(1), 1), // int
        (Err(1.0), 1.0), // double
        (Err('1'), '1'), // String
        (Err(true), true), // bool
        (Err(null), null), // null
        (Err([1, 2, 3]), [1, 2, 3]), // List
        (Err({'a': 1, 'b': 2}), {'a': 1, 'b': 2}), // Map
      ];
      for (final result in resultList) {
        final (err, value) = result;
        expect(err.err(), isA<Some>());
        expect((err.err() as Some).value, equals(value));
      }
    });
  });
}
