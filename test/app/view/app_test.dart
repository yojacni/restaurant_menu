import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_menu/app/app.dart';
import 'package:restaurant_menu/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
