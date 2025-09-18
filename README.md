### BeITE – Faculty of Information Engineering LMS

BeITE is a learning management system designed for the Faculty of Information Engineering.
It streamlines communication and academic management for students, professors, and practical-department supervisors, providing secure, role-based access to all educational resources.

## 📝 Overview

# BeITE delivers:

Centralized access to lectures, documents, tests, and announcements.

Clear role separation (Student, Doctor/Professor, Practical-Department Supervisor) with tailored permissions.

A modern, scalable architecture and high-level security for faculty members only.

## ✨ Key Features
# 🎓 Student

Academic Year & Materials: Browse school years, add/remove courses, and view the latest shared files.

Course Resources: Download and view documents, attachments, images, and announcements for each course.

Extra Courses: Access supplementary courses that aid learning.

Study Later: Save any file (theoretical or practical) for later study with full details.

Offline Downloads: Browse previously downloaded files without internet access.

Tests & Quizzes: View and attempt tests related to added courses—track solved/unsolved quizzes and time limits.

Notifications: Receive updates only for courses added to the personal “Materials” section.

ChatBot: Ask questions or retrieve information instantly within the app.

# 👨‍🏫 Doctor / Practical Supervisor

View all assigned courses per semester.

Upload or delete course materials (files, attachments, images) and send announcements to enrolled students.

Create and publish tests (True/False or Multiple Choice) with adjustable difficulty and duration.

Use the integrated ChatBot for quick information or assistance.

# 🔒 Security & Scalability

Restricted access: only faculty members (students, professors, supervisors) can log in.

Built with scalability in mind to handle future growth and new features.

# 🏗️ Tech Stack

Frontend: Flutter (Android / iOS / Web / Desktop)

Backend: Laravel (PHP) with RESTful API and Sanctum authentication

Database: MySQL

State Management (Frontend): Riverpod/Bloc (if applicable)

Authentication & Authorization: Laravel Sanctum tokens, role-based policies

# 🚀 Local Development Setup
Prerequisites

Backend: PHP 8+, Composer, MySQL 8+

Frontend: Flutter SDK (latest stable), Dart, Android/iOS build tools

Backend (Laravel)
git clone https://github.com/yourusername/beite.git
cd beite/backend
composer install
cp .env.example .env
php artisan key:generate
php artisan migrate --seed
php artisan serve

Frontend (Flutter)
cd ../frontend
flutter pub get
flutter run

# 📚 Future Enhancements

Advanced analytics for student performance.

Push notifications for real-time updates.

Integration with university-wide authentication systems.

# 👥 Contributors

Add the team members and their roles here
