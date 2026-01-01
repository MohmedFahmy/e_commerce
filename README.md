# 🛒 E-Commerce Mobile Application (Flutter & Supabase)

A modern and fully-featured **E-Commerce mobile application** built using **Flutter** and **Supabase**, designed to deliver a smooth, secure, and scalable shopping experience with clean UI/UX and production-ready architecture.

---

## 📌 Project Overview
This project is a complete mobile e-commerce solution that allows users to browse products, search and filter items, manage favorites, handle authentication, and manage their profile securely.  
The backend is powered by **Supabase**, providing authentication, database, and storage services.

---

## 🚀 Features

### 🔐 Authentication & Security
- User Registration (Sign Up)
- User Login (Sign In)
- Secure Logout
- Change Password
- Reset Password
- Authentication powered by Supabase
- Secure user sessions and protected routes

---

### 🛍️ Products
- View all available products
- Category-based browsing
- Product details with images, price, and description
- Data stored and fetched from Supabase PostgreSQL

---

### 🔍 Search & Filtering
- Search products by name
- Filter products by:
  - Category
  - Price range
  - Availability
- Optimized filtering logic for better performance

---

### ❤️ Favorites / Wishlist
- Add products to favorites
- Remove products from favorites
- Wishlist linked to the user account
- Persistent data storage

---

### 🛒 Cart (Expandable)
- Add products to cart
- Update product quantities
- Ready for checkout and payment integration

---

### 👤 Profile Management
- View user profile information
- Update profile data
- Change account password securely
- User data managed using Supabase Database

---

## 🧩 Technologies Used
- **Flutter** – Cross-platform mobile development
- **Supabase**
  - Authentication
  - PostgreSQL Database
  - Storage (Images)
- **RESTful APIs**
- **Clean Architecture**
- **State Management** (Bloc / Cubit / Provider)

---

## 🔐 Security & Performance
- Secure authentication flow
- Row Level Security (RLS)
- Optimized API calls
- Scalable and maintainable architecture

---

## 🖼️ Screenshots
> *(Add your application screenshots here)*

| Screen | Preview |
|------|--------|
| Home Screen | ![Home](screenshots/home.png) |
| Product Details | ![Details](screenshots/details.png) |
| Search & Filters | ![Search](screenshots/search.png) |
| Authentication | ![Auth](screenshots/auth.png) |
| Profile | ![Profile](screenshots/profile.png) |

---

## 📂 Project Structure
```text
lib/
 ├── core/
 ├── features/
 │    ├── auth/
 │    ├── home/
 │    ├── products/
 │    ├── cart/
 │    ├── profile/
 ├── shared/
 └── main.dart
---
---

## ⚙️ Installation & Setup
1/ Clone the repository
git clone https://github.com/MohmedFahmy/e_commerce.git

2/ Install dependencies
flutter pub get

- Supabase Configuration
- Create a Supabase project
- Enable Authentication and Database
- Add your credentials:
- SUPABASE_URL
- SUPABASE_ANON_KEY

3/ Run the application
flutter run


