import 'dart:io';

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

const _forgeRuleUrl = 'https://github.com/ForgeAI/ForgeAI/blob/main/AGENTS.md';

bool _isGenerated(String path) {
  return path.endsWith('.g.dart') || path.endsWith('.freezed.dart');
}

String _normalize(String path) {
  return path.replaceAll(r'\', '/');
}

bool _isUiPath(String path) {
  final normalized = _normalize(path);
  return normalized.contains('/lib/features/') ||
      normalized.contains('/lib/shared/');
}

bool _isWidgetClass(ClassDeclaration node) {
  final extendsClause = node.extendsClause;
  if (extendsClause == null) return false;

  final superType = extendsClause.superclass.name2.lexeme;
  return superType == 'Widget' ||
      superType.endsWith('Widget') ||
      superType == 'StatelessWidget' ||
      superType == 'StatefulWidget' ||
      superType == 'ConsumerWidget';
}

bool _isPublic(String name) => !name.startsWith('_');

class NoHardcodedColors extends DartLintRule {
  const NoHardcodedColors() : super(code: _code);

  static const _code = LintCode(
    name: 'forge_no_hardcoded_colors',
    problemMessage:
        'Do not hardcode colors in UI code. Use AppColors from the design system.',
    correctionMessage:
        'Move the color to AppColors or reuse an existing AppColors token.',
    errorSeverity: ErrorSeverity.ERROR,
    url: _forgeRuleUrl,
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    if (_isGenerated(resolver.path) || !_isUiPath(resolver.path)) return;

    context.registry.addInstanceCreationExpression((node) {
      if (node.constructorName.type.name2.lexeme == 'Color') {
        reporter.reportErrorForNode(code, node);
      }
    });

    context.registry.addPrefixedIdentifier((node) {
      if (node.prefix.name == 'Colors') {
        reporter.reportErrorForNode(code, node);
      }
    });

    context.registry.addPropertyAccess((node) {
      if (node.target?.toSource() == 'Colors') {
        reporter.reportErrorForNode(code, node);
      }
    });
  }
}

class NoDirectTextStyle extends DartLintRule {
  const NoDirectTextStyle() : super(code: _code);

  static const _code = LintCode(
    name: 'forge_no_direct_text_style',
    problemMessage:
        'Do not instantiate TextStyle directly in UI code. Use AppTypography.',
    correctionMessage: 'Use AppTypography.*.copyWith(...) instead.',
    errorSeverity: ErrorSeverity.ERROR,
    url: _forgeRuleUrl,
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    if (_isGenerated(resolver.path) || !_isUiPath(resolver.path)) return;

    context.registry.addInstanceCreationExpression((node) {
      if (node.constructorName.type.name2.lexeme == 'TextStyle') {
        reporter.reportErrorForNode(code, node);
      }
    });
  }
}

class NoRawRouteStrings extends DartLintRule {
  const NoRawRouteStrings() : super(code: _code);

  static const _code = LintCode(
    name: 'forge_no_raw_route_strings',
    problemMessage:
        'Do not navigate with raw route strings. Use AppRoutes constants.',
    correctionMessage:
        'Replace the string literal with an AppRoutes.* constant.',
    errorSeverity: ErrorSeverity.ERROR,
    url: _forgeRuleUrl,
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    if (_isGenerated(resolver.path) ||
        !_normalize(resolver.path).contains('/lib/')) {
      return;
    }

    context.registry.addMethodInvocation((node) {
      final methodName = node.methodName.name;
      if (methodName != 'go' && methodName != 'push') return;

      final target = node.target?.toSource();
      if (target != 'context') return;

      final arguments = node.argumentList.arguments;
      if (arguments.isEmpty) return;

      final firstArgument = arguments.first;
      if (firstArgument is! SimpleStringLiteral) return;

      if (firstArgument.value.startsWith('/')) {
        reporter.reportErrorForNode(code, firstArgument);
      }
    });
  }
}

class WidgetFileSize extends DartLintRule {
  const WidgetFileSize() : super(code: _code);

  static const _maxLines = 120;

  static const _code = LintCode(
    name: 'forge_widget_file_size',
    problemMessage: 'Widget files must stay under 120 lines.',
    correctionMessage:
        'Split large widget files into focused, reusable widgets.',
    errorSeverity: ErrorSeverity.ERROR,
    url: _forgeRuleUrl,
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    if (_isGenerated(resolver.path) || !_isUiPath(resolver.path)) return;

    context.registry.addCompilationUnit((node) {
      final hasPublicWidget = node.declarations
          .whereType<ClassDeclaration>()
          .any((declaration) {
            return _isPublic(declaration.name.lexeme) &&
                _isWidgetClass(declaration);
          });

      if (!hasPublicWidget) return;

      final lineCount = File(resolver.path).readAsLinesSync().length;
      if (lineCount <= _maxLines) return;

      reporter.reportErrorForOffset(code, 0, 1);
    });
  }
}

class OnePublicWidgetPerFile extends DartLintRule {
  const OnePublicWidgetPerFile() : super(code: _code);

  static const _code = LintCode(
    name: 'forge_one_public_widget_per_file',
    problemMessage: 'A Dart file may contain only one public widget class.',
    correctionMessage:
        'Move additional public widgets into their own files, or make private helpers private.',
    errorSeverity: ErrorSeverity.ERROR,
    url: _forgeRuleUrl,
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    if (_isGenerated(resolver.path) || !_isUiPath(resolver.path)) return;

    context.registry.addCompilationUnit((node) {
      final publicWidgets = node.declarations
          .whereType<ClassDeclaration>()
          .where((declaration) {
            return _isPublic(declaration.name.lexeme) &&
                _isWidgetClass(declaration);
          })
          .toList();

      if (publicWidgets.length <= 1) return;

      for (final extraWidget in publicWidgets.skip(1)) {
        reporter.reportErrorForOffset(
          code,
          extraWidget.name.offset,
          extraWidget.name.length,
        );
      }
    });
  }
}

class NoDirectStateProviderMutationInWidgets extends DartLintRule {
  const NoDirectStateProviderMutationInWidgets() : super(code: _code);

  static const _code = LintCode(
    name: 'forge_no_direct_state_provider_mutation_in_widgets',
    problemMessage:
        'Do not assign provider state directly from widgets. Call a notifier method.',
    correctionMessage:
        'Move the mutation behind a Notifier method and call that from the widget.',
    errorSeverity: ErrorSeverity.ERROR,
    url: _forgeRuleUrl,
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    if (_isGenerated(resolver.path) || !_isUiPath(resolver.path)) return;

    context.registry.addAssignmentExpression((node) {
      final leftHandSide = node.leftHandSide.toSource();
      if (leftHandSide.contains('.notifier).state')) {
        reporter.reportErrorForNode(code, node.leftHandSide);
      }
    });
  }
}
