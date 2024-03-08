# flutter_template

My Flutter project template. Pre-loaded with my regularly used packages:

- provider
- font_awesome_flutter
- version
- json_annotation

All platform subfolders have been removed, except for `web`. 

## Getting Started

Clone this repo as an alternative to using `flutter create`. Then rename the folder to your intended new project name. Then

```
cd <project-name>
flutter pub get
flutter run -d chrome
```

If your intended platform is not `web`, then re-create it, e.g.

```
flutter create . --platforms android
```

Then get coding to make it your own project!

Richard Shepherd
2024-03-08
