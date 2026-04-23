import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forge_ai/features/nutrition/providers/nutrition_plan_provider.dart';

void main() {
  test('weekly nutrition plan exposes seven days', () {
    expect(buildMockNutritionWeek().length, 7);
  });

  test('selected nutrition day updates when index changes', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    expect(container.read(selectedNutritionDayProvider).weekdayLabel, 'Mon');

    container.read(selectedNutritionDayIndexProvider.notifier).selectDay(2);

    expect(container.read(selectedNutritionDayProvider).weekdayLabel, 'Wed');
  });
}
