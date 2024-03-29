# dragndrop_list_demo

Demonstrating how to use Flutter's ReorderableListView widget (for drag-n-drop)
along with my standard ChangeNotifierProvider state management. Most notable
learning here is that state-update needs to be synchronous for correct / smooth
end-to-end animation of the drag-n-drop.

## Getting Started

Clone this repo:

```
git clone git@github.com:eggzotic/dragndrop_list_demo.git
cd dragndrop_list_demo
flutter pub get
flutter run -d chrome
git remote remove origin
```

Richard Shepherd
2024-03-29
