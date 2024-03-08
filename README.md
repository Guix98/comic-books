## ComicBook App

### Description

**ComicBook** is a web application developed with Flutter that allows you to explore the world of comics. The application connects to the ComicVine API to get information about the latest published comics. You can see the list of comics in two formats: as an ordered list or as a grid of images.

**Features:**

- **View the latest comics:** The application shows a list of the latest published comics, with information such as the title, cover, publication date, and publisher.
- **Two display formats:** You can choose to view the list of comics in two different formats: as an ordered list or as a grid of images.
- **Google and Firebase Authentication:** The application allows you to sign in with your Google or Firebase account this is necessary to see a Comic Credit details .

**Requirements:**

- A modern web browser
- A Google account (optional)

**How to run the application locally:**

1.  Clone the application repository:

```
git clone https://github.com/Guix98/comic-books.git

```

2.  Install the dependencies:

```
flutter pub get

```

3.  Run the application with the following command:

```
flutter run -d chrome --web-browser-flag "--disable-web-security"

```

**Note:** It is important to run the application with the command `flutter run -d chrome --web-browser-flag "--disable-web-security"` to avoid CORS issues. Otherwise you can look for [flutter_cors package](https://pub.dev/packages/flutter_cors) (I used it to develop this app).

**Upcoming features:**

- **Comic search:** The application will allow you to search for comics by title, publisher, character, etc.
- **Favorites lists:** Users will be able to create lists of their favorite comics.

**Contact:**

If you have any questions or suggestions, you can contact me at the following email address:

```
guimega.gh@gmail.com

```
