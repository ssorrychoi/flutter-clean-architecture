# practice_clean_architecture

`Freezed` library를 이용한 clean architecture

## Getting Started

`flutter packages pub run build_runner build --delete-conflicting-outputs` 명령어로 code generate를 생성한다

## Architecture


├─lib
│  ├─data           // Service Layor
│  │  ├─core
│  │  ├─country
│  │  ├─long_weekend
│  │  ├─version
│  │
│  ├─domain         // Domain Layor
│  │    ├─model     // Object
│  │        ├─country
│  │        ├─long_weekend
│  │        ├─version
│  │
│  ├─use_case       // UseCase
│  │    ├─country
│  │    ├─long_weekend
│  │    ├─version
│  │
│  ├─screen         // User Interface
│  │   ├─calculated_holidays
│  │        ├─screen.dart               // User Interface
│  │        ├─screen_view_model.dart    // View Model Controller
│  │        ├─screen_binding.dart       // Dependency Injection