import 'package:flutter/material.dart';

/// Versão genérica de utilitários que o FlutterFlow costuma disponibilizar.
/// Inclui `createModel` para compatibilidade com o seu SplashWidget.
class FlutterFlowUtil {
  FlutterFlowUtil._();

  // Navegação simples
  static Future<T?> push<T>(BuildContext context, Widget page) {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  static Future<T?> pushReplacement<T, TO>(BuildContext context, Widget page) {
    return Navigator.of(context).pushReplacement<T, TO>(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  static void pop<T>(BuildContext context, [T? result]) {
    Navigator.of(context).pop<T>(result);
  }
}

/// Replica mínima do helper `createModel` do FlutterFlow.
/// No FF real, isso integra com Provider/ChangeNotifier.
/// Aqui, apenas chama a factory; se o seu Model for um ChangeNotifier,
/// você pode evoluir isso para registrar no Provider, se quiser.
T createModel<T>(BuildContext context, T Function() modelBuilder) {
  return modelBuilder();
}
