import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:forge_ai_lints/src/rules.dart';

PluginBase createPlugin() => _ForgeAiLintPlugin();

class _ForgeAiLintPlugin extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) {
    return const [
      NoHardcodedColors(),
      NoDirectTextStyle(),
      NoRawRouteStrings(),
      WidgetFileSize(),
      OnePublicWidgetPerFile(),
      NoDirectStateProviderMutationInWidgets(),
    ];
  }
}
