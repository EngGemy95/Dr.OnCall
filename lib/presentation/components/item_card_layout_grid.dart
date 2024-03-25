import 'package:dr_on_call/domain/models/doctors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class ItemCardLayoutGrid extends StatelessWidget {
  const ItemCardLayoutGrid({
    super.key,
    required this.crossAxisCount,
    required this.items,
  })
  // we only plan to use this with 1 or 2 columns
  : assert(crossAxisCount == 1 || crossAxisCount == 2);
  final int crossAxisCount;
  final List<DoctorModel> items;

  @override
  Widget build(BuildContext context) {
    final rowSizes = List.generate(items.length ~/ crossAxisCount, (_) => auto);
    return LayoutGrid(
      // set some flexible track sizes based on the crossAxisCount
      columnSizes: crossAxisCount == 2 ? [1.fr, 1.fr] : [1.fr],
      // set all the row sizes to auto (self-sizing height)
      rowSizes: rowSizes,
      rowGap: 20, // equivalent to mainAxisSpacing
      columnGap: 20, // equivalent to crossAxisSpacing
      // note: there's no childAspectRatio
      children: [
        // render all the cards with *automatic child placement*
        //for (var i = 0; i < items.length; i++) ItemCard(data: items[i]),
      ],
    );
  }
}
