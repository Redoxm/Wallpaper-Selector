import 'package:flutter_riverpod/legacy.dart';

class SettingsState {
  final String imageQuality;
  final bool notificationsEnabled;
  final bool isConnectedToDevice;

  SettingsState({
    required this.imageQuality,
    required this.notificationsEnabled,
    required this.isConnectedToDevice,
  });

  SettingsState copyWith({
    String? imageQuality,
    bool? notificationsEnabled,
    bool? isConnectedToDevice,
  }) {
    return SettingsState(
      imageQuality: imageQuality ?? this.imageQuality,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      isConnectedToDevice: isConnectedToDevice ?? this.isConnectedToDevice,
    );
  }
}

class SettingsNotifier extends StateNotifier<SettingsState> {
  SettingsNotifier()
    : super(
        SettingsState(
          imageQuality: 'High ( Best Quality )',
          notificationsEnabled: true,
          isConnectedToDevice: true,
        ),
      );

  void setImageQuality(String quality) {
    state = state.copyWith(imageQuality: quality);
  }

  void toggleNotifications(bool value) {
    state = state.copyWith(notificationsEnabled: value);
  }

  void toggleDeviceConnection() {
    state = state.copyWith(isConnectedToDevice: !state.isConnectedToDevice);
  }

  void resetSettings() {
    state = SettingsState(
      imageQuality: 'High ( Best Quality )',
      notificationsEnabled: true,
      isConnectedToDevice: true,
    );
  }
}

final settingsProvider = StateNotifierProvider<SettingsNotifier, SettingsState>(
  (ref) {
    return SettingsNotifier();
  },
);
