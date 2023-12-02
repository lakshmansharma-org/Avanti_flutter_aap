

import 'package:flutter/cupertino.dart';
import 'package:qsurvey_flutter/utils/app_theme.dart';
class BackgroundWidget extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return   Container(
      height: double.infinity,
      width: double.infinity,
      color: AppTheme.themeColor,

    );

  }

}