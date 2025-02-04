# book_app

This is a simple Flutter project that displays a list of books. The app fetches book data from a local or remote source and presents it in a user-friendly list view.

- 🎨 [Architecture Design](#architecture-design)

  
![Screenshot 2025-02-05 000218](https://github.com/user-attachments/assets/e4d07286-ba06-47c0-92e1-f0a78b8e2463)


## Features

Every feature mainly contains of 3 basic layers `data` , `logic` and `ui`

- **Splash screen** before loading the main app.
- **Onboarding screen** for first-time users.
- **Home screen** displaying a list of books with titles, authors, and covers.
- **Search** functionality to filter books.
- **Book** details screen with extended information.
- **Add** books to a favorites list.

## Tools

- **flutter_bloc**: For state management using Cubit.
- **dio**: For handling network requests.
- **hive**: hive: A lightweight and fast database.
- **shared_preferences**: For simple local storage

## Screens
- **HomeScreen**
  
![Screenshot_1738698085](https://github.com/user-attachments/assets/030e0d25-4dc8-4f5e-9189-753ce69c603d=250x250)

- **DetailsScreen**

![Screenshot_1738698100](https://github.com/user-attachments/assets/e43d0601-74ea-4720-8e97-33def91b3f86)
- **FavoriteScreen**

![Screenshot_1738698109](https://github.com/user-attachments/assets/230942d0-e3fa-4f1a-9178-4500a4911d8c)
- **SearchScreen**

![Screenshot_1738698122](https://github.com/user-attachments/assets/a90e74ca-cf88-4bcd-8804-bb7e355ec490)



