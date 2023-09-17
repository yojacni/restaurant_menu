import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:restaurant_menu/core/network/internet_checker.dart';

abstract class ConnectivityService {
  Future<void> initialize();
  bool get hasInternet;
  Stream<bool> get onInternetChanged;
}

class ConnectivityServiceImpl implements ConnectivityService {
  ConnectivityServiceImpl(
    this._connectivity,
    this._internetChecker,
  );
  final Connectivity _connectivity;
  final InternetChecker _internetChecker;
  final _controller = StreamController<bool>.broadcast();

  late bool _hasInternet;
  StreamSubscription<bool>? _subscription;
  bool _initialized = false;

  @override
  Future<void> initialize() async {
    Future<bool> hasInternet(ConnectivityResult result) async {
      if (result == ConnectivityResult.none) {
        return false;
      }
      return _internetChecker.hasInternet();
    }

    _hasInternet = await hasInternet(
      await _connectivity.checkConnectivity(),
    );
    _initialized = true;

    _connectivity.onConnectivityChanged.skip(Platform.isIOS ? 1 : 0).listen(
      (event) async {
        await _subscription?.cancel();
        _subscription = hasInternet(event).asStream().listen(
          (value) {
            _hasInternet = value;

            if (_controller.hasListener && !_controller.isClosed) {
              _controller.add(_hasInternet);
            }
          },
        );
      },
    );
  }

  @override
  bool get hasInternet {
    assert(_initialized, 'initialize must be called first');
    return _hasInternet;
  }

  @override
  Stream<bool> get onInternetChanged => _controller.stream;
}
