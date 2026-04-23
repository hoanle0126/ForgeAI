import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/features/nutrition/models/nutrition_day_plan.dart';
import 'package:forge_ai/features/nutrition/models/nutrition_food_item.dart';
import 'package:forge_ai/features/nutrition/models/nutrition_meal.dart';

final nutritionWeekProvider = Provider<List<NutritionDayPlan>>((ref) {
  return buildMockNutritionWeek();
});

final selectedNutritionDayIndexProvider =
    NotifierProvider<SelectedNutritionDayIndexNotifier, int>(
      SelectedNutritionDayIndexNotifier.new,
    );

class SelectedNutritionDayIndexNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void selectDay(int index) {
    state = index;
  }
}

final selectedNutritionDayProvider = Provider<NutritionDayPlan>((ref) {
  final week = ref.watch(nutritionWeekProvider);
  final index = ref.watch(selectedNutritionDayIndexProvider);
  return week[index];
});

List<NutritionDayPlan> buildMockNutritionWeek() {
  return const [
    NutritionDayPlan(
      weekdayLabel: 'Mon',
      dayNumber: 22,
      strategyTitle: 'Fuel for strength training',
      strategySummary: 'Higher carbs around your training window today.',
      totalCalories: 2140,
      proteinGrams: 162,
      carbsGrams: 208,
      fatGrams: 68,
      isToday: true,
      meals: [
        NutritionMeal(
          label: 'BREAKFAST',
          time: '07:30',
          calories: 520,
          proteinGrams: 38,
          carbsGrams: 52,
          fatGrams: 16,
          items: [
            NutritionFoodItem(
              name: 'Greek Yogurt Bowl',
              detail: 'berries, chia, honey',
              calories: 320,
            ),
            NutritionFoodItem(
              name: 'Protein Oats',
              detail: 'whey, banana, cinnamon',
              calories: 200,
            ),
          ],
        ),
        NutritionMeal(
          label: 'LUNCH',
          time: '12:30',
          calories: 610,
          proteinGrams: 44,
          carbsGrams: 58,
          fatGrams: 18,
          items: [
            NutritionFoodItem(
              name: 'Chicken Rice Bowl',
              detail: 'jasmine rice, cucumber, greens',
              calories: 410,
            ),
            NutritionFoodItem(
              name: 'Miso Soup',
              detail: 'light broth',
              calories: 200,
            ),
          ],
        ),
        NutritionMeal(
          label: 'SNACK',
          time: '16:30',
          calories: 320,
          proteinGrams: 28,
          carbsGrams: 34,
          fatGrams: 12,
          items: [
            NutritionFoodItem(
              name: 'Cottage Cheese Toast',
              detail: 'whole-grain toast, tomato',
              calories: 180,
            ),
            NutritionFoodItem(
              name: 'Apple Almond Mix',
              detail: 'sliced apple, roasted almonds',
              calories: 140,
            ),
          ],
        ),
        NutritionMeal(
          label: 'DINNER',
          time: '19:00',
          calories: 690,
          proteinGrams: 52,
          carbsGrams: 64,
          fatGrams: 22,
          items: [
            NutritionFoodItem(
              name: 'Salmon Quinoa Plate',
              detail: 'roasted broccoli, lemon',
              calories: 460,
            ),
            NutritionFoodItem(
              name: 'Avocado Tomato Salad',
              detail: 'pumpkin seeds',
              calories: 230,
            ),
          ],
        ),
      ],
    ),
    NutritionDayPlan(
      weekdayLabel: 'Tue',
      dayNumber: 23,
      strategyTitle: 'Recovery balance',
      strategySummary: 'Keep meals lighter while preserving protein.',
      totalCalories: 1960,
      proteinGrams: 150,
      carbsGrams: 166,
      fatGrams: 64,
      meals: [
        NutritionMeal(
          label: 'BREAKFAST',
          time: '08:00',
          calories: 520,
          proteinGrams: 40,
          carbsGrams: 46,
          fatGrams: 18,
          items: [
            NutritionFoodItem(
              name: 'Spinach Egg Wrap',
              detail: 'whole-grain tortilla, feta',
              calories: 330,
            ),
            NutritionFoodItem(
              name: 'Cottage Fruit Cup',
              detail: 'pineapple, flax seeds',
              calories: 190,
            ),
          ],
        ),
        NutritionMeal(
          label: 'LUNCH',
          time: '12:45',
          calories: 640,
          proteinGrams: 50,
          carbsGrams: 56,
          fatGrams: 20,
          items: [
            NutritionFoodItem(
              name: 'Turkey Quinoa Bowl',
              detail: 'roasted peppers, tahini drizzle',
              calories: 430,
            ),
            NutritionFoodItem(
              name: 'Lentil Soup',
              detail: 'carrot, celery, herbs',
              calories: 210,
            ),
          ],
        ),
        NutritionMeal(
          label: 'DINNER',
          time: '19:15',
          calories: 800,
          proteinGrams: 60,
          carbsGrams: 64,
          fatGrams: 26,
          items: [
            NutritionFoodItem(
              name: 'Seared Tuna Rice Plate',
              detail: 'edamame, sesame greens',
              calories: 560,
            ),
            NutritionFoodItem(
              name: 'Dark Chocolate Yogurt',
              detail: '2% yogurt, cacao nibs',
              calories: 240,
            ),
          ],
        ),
      ],
    ),
    NutritionDayPlan(
      weekdayLabel: 'Wed',
      dayNumber: 24,
      strategyTitle: 'Performance rebuild',
      strategySummary: 'Push carbs back up for the next training block.',
      totalCalories: 2230,
      proteinGrams: 164,
      carbsGrams: 224,
      fatGrams: 66,
      meals: [
        NutritionMeal(
          label: 'BREAKFAST',
          time: '07:15',
          calories: 560,
          proteinGrams: 42,
          carbsGrams: 58,
          fatGrams: 18,
          items: [
            NutritionFoodItem(
              name: 'Overnight Protein Oats',
              detail: 'blueberries, almond butter',
              calories: 340,
            ),
            NutritionFoodItem(
              name: 'Boiled Eggs',
              detail: 'two eggs, sea salt',
              calories: 220,
            ),
          ],
        ),
        NutritionMeal(
          label: 'LUNCH',
          time: '12:30',
          calories: 710,
          proteinGrams: 52,
          carbsGrams: 72,
          fatGrams: 20,
          items: [
            NutritionFoodItem(
              name: 'Beef Burrito Bowl',
              detail: 'brown rice, black beans, salsa',
              calories: 470,
            ),
            NutritionFoodItem(
              name: 'Citrus Slaw',
              detail: 'cabbage, orange, olive oil',
              calories: 240,
            ),
          ],
        ),
        NutritionMeal(
          label: 'DINNER',
          time: '19:30',
          calories: 960,
          proteinGrams: 70,
          carbsGrams: 94,
          fatGrams: 28,
          items: [
            NutritionFoodItem(
              name: 'Chicken Pesto Pasta',
              detail: 'whole-wheat pasta, spinach',
              calories: 620,
            ),
            NutritionFoodItem(
              name: 'Parmesan Zucchini',
              detail: 'grilled ribbons, lemon zest',
              calories: 340,
            ),
          ],
        ),
      ],
    ),
    NutritionDayPlan(
      weekdayLabel: 'Thu',
      dayNumber: 25,
      strategyTitle: 'Lean consistency',
      strategySummary: 'Steady protein and moderate carbs across the day.',
      totalCalories: 2050,
      proteinGrams: 158,
      carbsGrams: 188,
      fatGrams: 62,
      meals: [
        NutritionMeal(
          label: 'BREAKFAST',
          time: '07:45',
          calories: 500,
          proteinGrams: 38,
          carbsGrams: 44,
          fatGrams: 16,
          items: [
            NutritionFoodItem(
              name: 'Skyr Berry Parfait',
              detail: 'granola, strawberries',
              calories: 310,
            ),
            NutritionFoodItem(
              name: 'Peanut Toast',
              detail: 'whole-grain bread, sliced banana',
              calories: 190,
            ),
          ],
        ),
        NutritionMeal(
          label: 'LUNCH',
          time: '13:00',
          calories: 670,
          proteinGrams: 52,
          carbsGrams: 62,
          fatGrams: 20,
          items: [
            NutritionFoodItem(
              name: 'Shrimp Couscous Salad',
              detail: 'cucumber, mint, olive oil',
              calories: 430,
            ),
            NutritionFoodItem(
              name: 'Roasted Pumpkin Soup',
              detail: 'ginger, pumpkin seeds',
              calories: 240,
            ),
          ],
        ),
        NutritionMeal(
          label: 'DINNER',
          time: '18:50',
          calories: 880,
          proteinGrams: 68,
          carbsGrams: 82,
          fatGrams: 26,
          items: [
            NutritionFoodItem(
              name: 'Lean Steak Plate',
              detail: 'sweet potato mash, green beans',
              calories: 560,
            ),
            NutritionFoodItem(
              name: 'Greek Salad Bowl',
              detail: 'feta, olives, tomato',
              calories: 320,
            ),
          ],
        ),
      ],
    ),
    NutritionDayPlan(
      weekdayLabel: 'Fri',
      dayNumber: 26,
      strategyTitle: 'Training support',
      strategySummary: 'Front-load energy before your evening session.',
      totalCalories: 2180,
      proteinGrams: 160,
      carbsGrams: 214,
      fatGrams: 64,
      meals: [
        NutritionMeal(
          label: 'BREAKFAST',
          time: '07:20',
          calories: 540,
          proteinGrams: 40,
          carbsGrams: 56,
          fatGrams: 16,
          items: [
            NutritionFoodItem(
              name: 'Banana Protein Pancakes',
              detail: 'oats, whey, maple drizzle',
              calories: 320,
            ),
            NutritionFoodItem(
              name: 'Turkey Bacon Scramble',
              detail: 'egg whites, spinach',
              calories: 220,
            ),
          ],
        ),
        NutritionMeal(
          label: 'LUNCH',
          time: '12:20',
          calories: 700,
          proteinGrams: 54,
          carbsGrams: 68,
          fatGrams: 20,
          items: [
            NutritionFoodItem(
              name: 'Teriyaki Chicken Rice',
              detail: 'broccoli, sesame seeds',
              calories: 460,
            ),
            NutritionFoodItem(
              name: 'Mango Chia Cup',
              detail: 'coconut yogurt, lime',
              calories: 240,
            ),
          ],
        ),
        NutritionMeal(
          label: 'DINNER',
          time: '20:00',
          calories: 940,
          proteinGrams: 66,
          carbsGrams: 90,
          fatGrams: 28,
          items: [
            NutritionFoodItem(
              name: 'Baked Cod Potato Tray',
              detail: 'herb potatoes, asparagus',
              calories: 620,
            ),
            NutritionFoodItem(
              name: 'Ricotta Berry Toast',
              detail: 'multigrain bread, honey',
              calories: 320,
            ),
          ],
        ),
      ],
    ),
    NutritionDayPlan(
      weekdayLabel: 'Sat',
      dayNumber: 27,
      strategyTitle: 'Flexible recovery',
      strategySummary: 'Keep structure while allowing a more relaxed dinner.',
      totalCalories: 2080,
      proteinGrams: 152,
      carbsGrams: 196,
      fatGrams: 68,
      meals: [
        NutritionMeal(
          label: 'BREAKFAST',
          time: '08:30',
          calories: 520,
          proteinGrams: 36,
          carbsGrams: 52,
          fatGrams: 18,
          items: [
            NutritionFoodItem(
              name: 'Smoked Salmon Bagel',
              detail: 'light cream cheese, arugula',
              calories: 300,
            ),
            NutritionFoodItem(
              name: 'Protein Smoothie',
              detail: 'banana, whey, oat milk',
              calories: 220,
            ),
          ],
        ),
        NutritionMeal(
          label: 'LUNCH',
          time: '13:15',
          calories: 680,
          proteinGrams: 50,
          carbsGrams: 64,
          fatGrams: 22,
          items: [
            NutritionFoodItem(
              name: 'Chicken Soba Bowl',
              detail: 'bok choy, scallions, soy-lime',
              calories: 440,
            ),
            NutritionFoodItem(
              name: 'Seaweed Edamame Salad',
              detail: 'sesame dressing',
              calories: 240,
            ),
          ],
        ),
        NutritionMeal(
          label: 'DINNER',
          time: '19:40',
          calories: 880,
          proteinGrams: 66,
          carbsGrams: 80,
          fatGrams: 28,
          items: [
            NutritionFoodItem(
              name: 'Turkey Burger Plate',
              detail: 'whole-grain bun, oven fries',
              calories: 560,
            ),
            NutritionFoodItem(
              name: 'Greek Yogurt Cheesecake Jar',
              detail: 'berries, almond crumble',
              calories: 320,
            ),
          ],
        ),
      ],
    ),
    NutritionDayPlan(
      weekdayLabel: 'Sun',
      dayNumber: 28,
      strategyTitle: 'Reset for next week',
      strategySummary: 'Simple meals with enough protein to recover well.',
      totalCalories: 1980,
      proteinGrams: 148,
      carbsGrams: 178,
      fatGrams: 65,
      isUpdated: true,
      meals: [
        NutritionMeal(
          label: 'BREAKFAST',
          time: '08:10',
          calories: 500,
          proteinGrams: 36,
          carbsGrams: 46,
          fatGrams: 18,
          items: [
            NutritionFoodItem(
              name: 'Avocado Egg Toast',
              detail: 'sourdough, chili flakes',
              calories: 300,
            ),
            NutritionFoodItem(
              name: 'Kefir Fruit Glass',
              detail: 'kiwi, chia, mint',
              calories: 200,
            ),
          ],
        ),
        NutritionMeal(
          label: 'LUNCH',
          time: '12:40',
          calories: 660,
          proteinGrams: 50,
          carbsGrams: 60,
          fatGrams: 21,
          items: [
            NutritionFoodItem(
              name: 'Grilled Chicken Wrap',
              detail: 'hummus, lettuce, tomato',
              calories: 430,
            ),
            NutritionFoodItem(
              name: 'Roasted Veggie Cup',
              detail: 'zucchini, bell pepper, herbs',
              calories: 230,
            ),
          ],
        ),
        NutritionMeal(
          label: 'DINNER',
          time: '18:30',
          calories: 820,
          proteinGrams: 62,
          carbsGrams: 72,
          fatGrams: 26,
          items: [
            NutritionFoodItem(
              name: 'Miso Glazed Salmon',
              detail: 'rice, steamed greens',
              calories: 520,
            ),
            NutritionFoodItem(
              name: 'Tofu Sesame Stir-Fry',
              detail: 'snap peas, carrot, garlic',
              calories: 300,
            ),
          ],
        ),
      ],
    ),
  ];
}
