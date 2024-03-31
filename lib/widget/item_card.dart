import 'package:flutter/material.dart';
import 'package:flutter_template/event/delete_item_event.dart';
import 'package:flutter_template/model/item.dart';
import 'package:flutter_template/state/app_state.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    required this.item,
    required super.key,
    required this.position,
  });

  final Item item;
  final int position;

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    // to demonstrate that animated move *&* delete can co-exist
    return Dismissible(
      // unique ValueKeys do not seem to be enough here - so UniqueKey it is...
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        appState.sendEventSync(DeleteItemEvent(index: item.index));
      },
      background: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Text("Delete this!", style: TextStyle(color: Colors.red)),
          Padding(
            padding: EdgeInsets.only(right: 32),
            child: Icon(Icons.delete_forever, color: Colors.red),
          ),
        ],
      ),
      child: Card(
        child: ListTile(
          title: Text(item.name),
          subtitle: Text(item.description),
          // To do custom drag-handle, use this - but must also pass in the
          //  current position in the list
          trailing: ReorderableDragStartListener(
            index: position,
            child: const FaIcon(FontAwesomeIcons.hand),
          ),
        ),
      ),
    );
  }
}
