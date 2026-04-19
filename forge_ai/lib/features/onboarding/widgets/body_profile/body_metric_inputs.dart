import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge_ai/core/constants/app_spacing.dart';
import 'package:forge_ai/features/onboarding/providers/onboarding_provider.dart';
import 'package:forge_ai/features/onboarding/widgets/body_profile/metric_input_field.dart';
import 'package:forge_ai/shared/widgets/app_card.dart';

class BodyMetricInputs extends ConsumerWidget {
  const BodyMetricInputs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: MetricInputField(
                  label: 'HEIGHT',
                  hint: '175cm',
                  initialValue: ref.watch(heightProvider),
                  onChanged: (value) =>
                      ref.read(heightProvider.notifier).update(value),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: MetricInputField(
                  label: 'WEIGHT',
                  hint: '70kg',
                  initialValue: ref.watch(weightProvider),
                  onChanged: (value) =>
                      ref.read(weightProvider.notifier).update(value),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          MetricInputField(
            label: 'AGE',
            hint: '25',
            initialValue: ref.watch(ageProvider),
            onChanged: (value) => ref.read(ageProvider.notifier).update(value),
          ),
        ],
      ),
    );
  }
}
