# flutter_template

My Flutter project template. Pre-loaded with my regularly used packages:

- provider
- font_awesome_flutter
- version
- json_annotation

All platform subfolders have been removed, except for `web`. 

## Getting Started

Clone this repo as an alternative to using `flutter create`:

```
git clone git@github.com:eggzotic/flutter_template.git my_new_project
cd my_new_project
flutter pub get
flutter run -d chrome
git remote remove origin
```

If your intended platform is not `web`, then re-create it, e.g.

```
flutter create . --platforms android
```

Then get coding to make it your *own* project!

Richard Shepherd
2024-03-08
