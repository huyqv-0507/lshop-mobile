import 'package:flutter/material.dart';
import 'package:laptop_mobile/blocs/order_bloc/order_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'color.dart';

class FloatButtonHandler {
  static final FloatingActionButton floatPrimaryButton = FloatingActionButton(
    backgroundColor: kFloatButtonCart,
    onPressed: null,
    child: Icon(
      MdiIcons.cartOutline,
      color: kFloatButtonIconCart,
    ),
  );
}
