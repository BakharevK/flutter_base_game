import 'package:flutter_test/flutter_test.dart';

import 'package:bot_example_app/main.dart';

void main() {
  testWidgets('Test all buttons', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    int count = 100;
    expect(find.text(count.toString()), findsOneWidget);
    expect(find.text((count-1).toString()), findsNothing);

    for (int i = 1; i <= 6; ++i) {
      await tester.tap(find.text(i.toString()));
      await tester.pump();
      count -= i;
      expect(find.text(count.toString()), findsOneWidget);
    }
  });
}
