# 📱 Flutter Notes App using SharedPreferences

## 📌 Project Overview

This project is a simple Flutter application that demonstrates **local data storage using SharedPreferences**. The app allows users to perform basic **CRUD operations (Create, Read, Update, Delete)** on notes.

All data is stored locally on the device using key-value storage without using any external database.

---

## 🎯 Objective

The objective of this project is to:

* Understand local data storage in Flutter
* Implement CRUD operations
* Use SharedPreferences for persistent storage
* Upload project on GitHub with proper documentation

---

## 🛠️ Technologies Used

* Flutter
* Dart
* SharedPreferences (Local Storage)

---

## 📲 Features

* ➕ Add new note
* 📋 View all notes
* ✏️ Update existing note
* ❌ Delete note
* 💾 Data stored locally using SharedPreferences

---

## ⚙️ How It Works

### 🔹 Data Storage Method

* Notes are stored as a **List of Map objects**
* The list is converted into a **JSON string**
* JSON string is saved using SharedPreferences

### 🔹 Workflow

1. User enters note title and content
2. Note is added to list
3. List is converted into JSON format
4. JSON string is stored locally
5. When app starts, data is loaded and displayed

---

## 📁 Project Structure

```
lib/
 └── main.dart
```

---

## 🚀 How to Run the Project

1. Install Flutter SDK
2. Clone the repository:

   ```bash
   git clone <your-repo-link>
   ```
3. Navigate to project folder:

   ```bash
   cd project-name
   ```
4. Get dependencies:

   ```bash
   flutter pub get
   ```
5. Run the app:

   ```bash
   flutter run
   ```

---

## 📦 Dependencies

```
shared_preferences: ^2.2.2
```

---

## 📸 Screenshots

<img width="1594" height="900" alt="image" src="https://github.com/user-attachments/assets/7ccf85c4-b75a-43ea-85e6-bf69e17634eb" />
<img width="1595" height="900" alt="image" src="https://github.com/user-attachments/assets/e0e86d66-be0f-447a-b496-2d1611e50be8" />
<img width="1600" height="893" alt="image" src="https://github.com/user-attachments/assets/68ca2324-dedf-4b2e-aba3-c4dbf11888db" />

<img width="1598" height="900" alt="image" src="https://github.com/user-attachments/assets/e22c6d03-451d-47ef-ba8a-efeac274cbc3" />





---

## 📚 Learning Outcomes

* Learned how to store data locally in Flutter
* Understood JSON encoding and decoding
* Implemented CRUD operations
* Learned GitHub project management

---

## ⚠️ Limitations

* Not suitable for large-scale data
* No advanced querying support
* Data stored in simple key-value format

---

## 🔮 Future Enhancements

* Add search functionality
* Add dark mode
* Add date & time for notes
* Improve UI design

---

## 👨‍💻 Author

* Shahid Ambaliya

---

## 📄 Submission Details

* GitHub Repository Link: (Add here)
* PDF Documentation: (Upload on GMIU Portal)

---

## ✅ Conclusion

This project successfully demonstrates how to use SharedPreferences in Flutter for local data storage and perform basic CRUD operations in a simple and efficient way.

---
