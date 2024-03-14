import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/architecutre/cubits/messenger/messenger_cubit.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/architecutre/error_handler/global_error_handler.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/ext/ctx_ext.dart';

class GlobalErrorCatcher extends StatefulWidget {
  final Widget? child;
  final Function()? onSessionExpire;
  const GlobalErrorCatcher({
    super.key,
    required this.child,
    this.onSessionExpire,
  });

  @override
  State<GlobalErrorCatcher> createState() => _GlobalErrorCatcherState();
}

class _GlobalErrorCatcherState extends State<GlobalErrorCatcher> {
  final ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();
    IsolateNameServer.registerPortWithName(_port.sendPort, CBGlobalErrorHandler.sessionTimeoutPortName);
    _port.listen((message) {
      if (message) widget.onSessionExpire?.call();
    });
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping(CBGlobalErrorHandler.sessionTimeoutPortName);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}
