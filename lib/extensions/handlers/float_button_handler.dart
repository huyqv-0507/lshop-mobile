import 'package:flutter/material.dart';
import 'package:laptop_mobile/ui/pages/cart_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'color.dart';

class FloatButtonHandler {
  static BuildContext context;
  static final Widget floatPrimaryButton = FloatingActionButton(
    backgroundColor: kFloatButtonCart,
    onPressed: () => Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CardPage())),
    child: Icon(
      MdiIcons.cartOutline,
      color: kFloatButtonIconCart,
    ),
  );
}
