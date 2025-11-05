# 🖼️ Wallpaper Selector - Desktop Application

A beautiful and intuitive desktop wallpaper browsing application built with Flutter, featuring clean architecture, GoRouter navigation, and Riverpod state management. This Windows desktop application provides an elegant interface for discovering and managing wallpaper collections.

## 📱 App Preview

[<img width="1602" height="995" alt="Screenshot 2025-11-05 125908" src="https://github.com/user-attachments/assets/f9d461a6-290b-41f9-b080-9570e523dab6" />
<img width="1597" height="1000" alt="image" src="https://github.com/user-attachments/assets/773dac2c-22b5-4470-aa10-ffb8d662e692" />
<img width="1610" height="1022" alt="image" src="https://github.com/user-attachments/assets/47ad63f3-48a3-439f-ab6d-513083a3a006" />
<img width="1618" height="1003" alt="image" src="https://github.com/user-attachments/assets/6966e2e3-b6be-4659-b7ef-e39c0b86ce14" />
<img width="1605" height="993" alt="image" src="https://github.com/user-attachments/assets/28c0550c-a8be-458c-bd5b-59d527cf5404" />
]

## 🔗 Important Links

> **Please update these links before submission!**

- **📦 GitHub Repository**: [https://github.com/Redoxm/Wallpaper-Selector.git]
- **🎥 Demo Video (2-4 minutes)**: [https://drive.google.com/drive/folders/1ptQqTnobeVMfMMssQZps8UokMnxVwU6r]
- **🎨 Figma Design**: [https://www.figma.com/design/WnHFPfZ7uW2vxy4sHqtb12/MOBILE-WALLPAPER-SELECTOR?node-id=1-5&t=MwCzlddVkxiXo0fW-0]
- **💾 Windows Release Build (.zip)**: [Google Drive Link to complete zipped build folder]

## 🏗️ Architecture & Tech Stack

- **Framework**: Flutter 3.9.2+
- **Platform**: Windows Desktop
- **State Management**: Riverpod 3.0.3
- **Navigation**: GoRouter 16.3.0
- **Architecture**: Feature-based Clean Architecture
- **UI**: Flutter ScreenUtil for responsive design
- **Typography**: Google Fonts
- **Window Management**: Window Manager (Desktop optimization)

## ✨ Features Implemented

- ✅ **Home Dashboard**: Featured wallpapers and quick category access
- ✅ **Browse Categories**: Organized wallpaper collections by theme
- ✅ **Favorites Management**: Save and organize favorite wallpapers
- ✅ **Wallpaper Detail View**: Full-screen wallpaper preview with interactions
- ✅ **Settings Panel**: App customization options
- ✅ **Responsive UI**: Adapts to different window sizes (1280x800 minimum)
- ✅ **Clean Architecture**: Proper separation of concerns with feature-based structure
- ✅ **Type-safe Routing**: GoRouter with declarative navigation
- ✅ **State Management**: Reactive UI with Riverpod providers
- ✅ **Desktop Optimized**: Custom window sizing and management

## �️ Local Development Setup

### Prerequisites

Before running this project locally, ensure you have:

- **Flutter SDK**: Version 3.9.2 or higher
- **Dart SDK**: Version 3.9.2 or higher
- **Git**: For version control
- **Visual Studio 2022** (for Windows development):
  - Desktop development with C++ workload
  - Windows 10 SDK
- **Code Editor**: VS Code or Android Studio

### Installation Steps

1. **Clone the Repository**

   ```bash
   git clone [your-repo-url]
   cd wallpaper_selector
   ```

2. **Verify Flutter Installation**

   ```bash
   flutter doctor
   ```

   Ensure all checks pass for Windows desktop development.

3. **Install Dependencies**

   ```bash
   flutter pub get
   ```

4. **Run the Application**

   ```bash
   flutter run -d windows
   ```

   Or use VS Code/Android Studio:

   - Open the project
   - Select Windows as target device
   - Press F5 or click Run

### System Requirements

- **Operating System**: Windows 10 (64-bit) or later
- **RAM**: 4GB minimum, 8GB recommended
- **Storage**: 500MB free space
- **Display**: 1280x800 minimum resolution
- **Architecture**: x64

## 🎨 Design & UI

This desktop application features:

- **Modern Interface**: Clean, intuitive design optimized for desktop
- **Responsive Layout**: Adapts to window resizing (minimum 1280x800)
- **Smooth Animations**: Polished transitions and interactions
- **Custom Typography**: Google Fonts integration
- **Consistent Theme**: Unified color palette and design system
- **Desktop-First**: Optimized for keyboard and mouse interactions

## 📁 Project Structure

```
wallpaper_selector/
├── lib/
│   ├── main.dart                    # App entry point
│   ├── core/
│   │   ├── constants/              # App-wide constants (colors, etc.)
│   │   └── router/                 # GoRouter configuration
│   └── features/
│       ├── home/                   # Home screen
│       │   ├── data/
│       │   ├── domain/
│       │   └── presentation/
│       ├── browse/                 # Browse wallpapers
│       │   ├── data/
│       │   ├── domain/
│       │   └── presentation/
│       ├── favourites/             # Favorites management
│       │   ├── data/
│       │   ├── domain/
│       │   └── presentation/
│       ├── settings/               # App settings
│       │   └── presentation/
│       └── wallpaper_detail/       # Wallpaper detail view
│           └── presentation/
├── assets/
│   └── images/                     # Image assets
├── windows/                        # Windows platform code
├── pubspec.yaml                    # Dependencies
└── README.md
```

## 🔧 Dependencies

Key packages used in this project:

```yaml
dependencies:
  flutter_riverpod: ^3.0.3 # State management
  go_router: ^16.3.0 # Navigation & routing
  flutter_screenutil: ^5.9.3 # Responsive UI scaling
  google_fonts: ^6.3.2 # Custom typography
  window_manager: ^0.5.1 # Desktop window control
```

## 🧪 Testing

Run unit and widget tests:

```bash
flutter test
```

## 🚀 Building from Source

### Build Windows Release

1. **Build the release version**:

   ```bash
   flutter build windows --release
   ```

2. **Locate the build**:
   The complete application folder will be at:

   ```
   build/windows/x64/runner/Release/
   ```

## �👨‍💻 Developer

**[Your Name]**

- GitHub: [@yourusername](https://github.com/Redoxm)
- Email: Luqmanadebayoaremu@gmail.com

## 📄 License

This project was created for educational purposes.

## 🙏 Acknowledgments

- Flutter Team for the amazing framework
- Riverpod for state management
- HNG Internship Program

---

## 🚀 Quick Start Summary

**For Users:**

1. Download .zip from Google Drive
2. Extract all files
3. Run wallpaper_selector.exe

**For Developers:**

1. Clone repository
2. Run `flutter pub get`
3. Run `flutter run -d windows`

---

**Built with ❤️ using Flutter**  
**Version**: 1.0.0  
**Platform**: Windows Desktop  
**Submission Date**: November 5, 2025
