# Plagiarism Detector Frontend

This repository contains the frontend implementation of the Plagiarism Detector application. The frontend is built using Flutter and provides a user interface for students and teachers to interact with the plagiarism detection system. This project uses dummy data for demonstration purposes.

## Table of Contents

- [Features](#features)
- [Screens](#screens)
- [Installation](#installation)
- [Usage](#usage)
- [Folder Structure](#folder-structure)
- [Contributing](#contributing)
- [Screenshots](#screenshots)

## Features

- **Student Dashboard**: View courses, assignments, and upcoming tasks.
- **Profile Management**: View and update profile information.
- **Timeline**: View and manage tasks and assignments.
- **Assignment Upload**: Upload assignments for plagiarism detection.
- **Notifications**: Receive notifications about assignments and tasks.

## Screens

### Student Screens

- **Login Screen**: Allows students to log in to the application.
- **Dashboard**: Displays courses, assignments, and upcoming tasks.
- **Profile**: Displays student profile information.
- **Timeline**: Displays tasks and assignments in a timeline view.
- **Assignment Upload**: Allows students to upload assignments.
- **Notifications**: Displays notifications about assignments and tasks.

### Teacher Screens

- **Login Screen**: Allows teachers to log in to the application.
- **Dashboard**: Displays courses and assignments.
- **Profile**: Displays teacher profile information.

## Installation

To run this project locally, follow these steps:

1. **Clone the repository**:
    ```bash
    git clone https://github.com/your-username/plagiarism-detector-frontend.git
    cd plagiarism-detector-frontend
    ```

2. **Install dependencies**:
    ```bash
    flutter pub get
    ```

3. **Run the application**:
    ```bash
    flutter run
    ```

## Usage

1. **Login**: Use the following credentials to log in:
    - **Student**: 
        - Username: `2021-ARID-0000`
        - Password: `0000`
    - **Teacher**: 
        - Username: `Teacher0000`
        - Password: `0000`

2. **Navigate**: Use the bottom navigation bar to switch between different screens.

## Folder Structure

The project folder structure is as follows:

```
lib/
├── Screens/
│   ├── Student/
│   │   ├── Ass_Notify.dart
│   │   ├── Ass_upload.dart
│   │   ├── ButtomBar.dart
│   │   ├── Dashboard.dart
│   │   ├── Profile.dart
│   │   ├── Timeline.dart
│   ├── Teacher/
│   │   ├── ButtomBar.dart
│   │   ├── Dashboard.dart
│   │   ├── Profile.dart
│   ├── loginnnn.dart
│   ├── Testing/
│   │   ├── ButtomBar.dart
├── Widgets Reusable/
│   ├── Appbars/
│   │   ├── S_Appbar.dart
│   │   ├── T_Appbar.dart
│   │   ├── sliverAppbar.dart
│   ├── Assignment Card/
│   │   ├── AssignmentCard.dart
│   ├── Course Card/
│   │   ├── StudentCourseCard.dart
│   ├── File Display Card/
│   │   ├── FileDisplay.dart
│   │   ├── FileDownload.dart
│   ├── Scrollable Date/
│   │   ├── ScrollableDate.dart
│   ├── Timeline List/
│   │   ├── Timeline_List.dart
├── main.dart
```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## Screenshots 
![Untitled design](https://github.com/user-attachments/assets/2939de7b-b6b7-4eca-b310-199166838465)


 
