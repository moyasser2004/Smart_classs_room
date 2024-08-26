IoT Classroom

A smart classroom project developed using Flutter, Clean Architecture, and IoT technologies. This project integrates various IoT devices, such as light sensors and ESP32 modules, with a Flutter app to monitor and control the classroom environment. Firebase is used for backend services, including real-time database and authentication.

Overview
The IoT Classroom project aims to create a connected classroom environment where teachers and students can interact with devices such as lights, fans, projectors, and more, all through a mobile app. The project showcases the use of MQTT for real-time communication between the app and IoT devices, along with a robust architecture using Clean Architecture principles.

Features
Real-time Monitoring: Monitor classroom conditions like light intensity, temperature, and humidity.
Device Control: Control various classroom devices such as lights and fans directly from the app.
MQTT Integration: Seamless communication with IoT devices using MQTT.
Firebase Integration: Use Firebase Realtime Database for storing and syncing data, and Firebase Authentication for user management.
Clean Architecture: Well-organized codebase following Clean Architecture principles, ensuring separation of concerns and maintainability.
Responsive UI: A user-friendly and responsive interface designed using Flutter.
Getting Started
Prerequisites
Before you begin, ensure you have met the following requirements:

Flutter SDK installed on your machine. Get Flutter
Dart installed. Get Dart
Firebase project setup with Realtime Database and Authentication enabled. Firebase Console
An MQTT broker setup (e.g., Mosquitto or HiveMQ)



├── lib
│   ├── main.dart                # Entry point of the application
│   ├── mqtt_service.dart        # MQTT service for handling communication with IoT devices
│   ├── firebase_service.dart    # Firebase service for handling Firebase operations
│   ├── core                     # Core module containing shared code (e.g., error handling)
│   ├── features
│   │   ├── home                 # Feature module for the Home functionality
│   │   │   ├── data             # Data layer (repositories, data sources)
│   │   │   ├── domain           # Domain layer (entities, use cases)
│   │   │   ├── presentation     # Presentation layer (UI, widgets, state management)
│   └── shared                   # Shared module containing common widgets, utilities, etc.
└── pubspec.yaml                 # Project dependencies and metadata


Contributing
Contributions are always welcome! Please follow these steps:

Fork the repository.
Create a new branch (git checkout -b feature-branch).
Make your changes and commit (git commit -m 'Add some feature').
Push to the branch (git push origin feature-branch).
Open a Pull Request.
License
This project is licensed under the MIT License - see the LICENSE file for details.

Contact
Name: Mohamed Yasser
Email: your-email@example.com
LinkedIn: Your LinkedIn Profile
Acknowledgements
Flutter
MQTT
..........................................................................................

![one](https://github.com/user-attachments/assets/fbf21002-76bd-46ce-aeed-d69daed62c48)
![two](https://github.com/user-attachments/assets/e1720aab-0587-40a3-926b-e5fed442675a)
![three](https://github.com/user-attachments/assets/1ea72912-7750-4d09-ac1d-cfb69554341b)
![four](https://github.com/user-attachments/assets/3dc24dc7-eced-4292-b893-07f94d9a1dfa)
![five](https://github.com/user-attachments/assets/414d086a-cb9b-4a3a-9500-07e9b9fcd7ff)
![sixjpg](https://github.com/user-attachments/assets/de1b0020-a294-44a4-b28a-432edc99a4ec)
![seven](https://github.com/user-attachments/assets/314c2666-bd93-4c80-8290-aa0a831509b6)
![nine](https://github.com/user-attachments/assets/b14cbd40-9b56-4bac-91fa-5d18e8ecedd5)

