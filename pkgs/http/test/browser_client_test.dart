// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:http/src/browser_client.dart';
import 'package:test/test.dart';

void main() {
  group('RequestCredentials', () {
    test('defaults to sameOrigin', () {
      final client = BrowserClient();
      expect(client.requestCredentials, RequestCredentials.sameOrigin);
      // ignore: deprecated_member_use_from_same_package
      expect(client.withCredentials, isFalse);
    });

    test('can be set via constructor', () {
      final client =
          BrowserClient(requestCredentials: RequestCredentials.include);
      expect(client.requestCredentials, RequestCredentials.include);
      // ignore: deprecated_member_use_from_same_package
      expect(client.withCredentials, isTrue);

      final clientOmit =
          BrowserClient(requestCredentials: RequestCredentials.omit);
      expect(clientOmit.requestCredentials, RequestCredentials.omit);
      // ignore: deprecated_member_use_from_same_package
      expect(clientOmit.withCredentials, isFalse);
    });

    test('deprecated withCredentials setter updates state correctly', () {
      final client = BrowserClient()

        // ignore: deprecated_member_use_from_same_package
        ..withCredentials = true;
      expect(client.requestCredentials, RequestCredentials.include);
      // ignore: deprecated_member_use_from_same_package
      expect(client.withCredentials, isTrue);

      // ignore: deprecated_member_use_from_same_package
      client.withCredentials = false;
      expect(client.requestCredentials, RequestCredentials.sameOrigin);
      // ignore: deprecated_member_use_from_same_package
      expect(client.withCredentials, isFalse);
    });
  });
}
