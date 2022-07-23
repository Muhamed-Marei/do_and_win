import 'package:do_and_win/features/user_balance/view/widgets/cards/view_balance_card_widget.dart';
import 'package:flutter/material.dart';
import '../../model/user_model_balance.dart';

class ViewBalanceWidget extends StatelessWidget {
  late UserModelBalance userModelBalance;
  ViewBalanceWidget({Key? key, required this.userModelBalance})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ViewBalanceCard(
              title: 'النقاط المشحونه',
              subTitle: userModelBalance.chargingPoints.toString(),
              icon: Icons.monetization_on),
          ViewBalanceCard(
              title: 'الهدايا',
              subTitle: userModelBalance.givenPoint.toString(),
              icon: Icons.monetization_on),
          ViewBalanceCard(
              title: 'نقاط من دعوة الاصدقاء',
              subTitle: userModelBalance.inviteUsersPoint.toString(),
              icon: Icons.monetization_on),
          ViewBalanceCard(
              title: 'نقاط تنفيذ المهام ',
              subTitle: userModelBalance.taskPoint.toString(),
              icon: Icons.monetization_on),
          ViewBalanceCard(
              title: 'نقاط من مشاهدة الفديوهات',
              subTitle: userModelBalance.watchVideoPoint.toString(),
              icon: Icons.monetization_on),
          ViewBalanceCard(
              title: 'جميع النقاط التى حصلت عليها',
              subTitle: userModelBalance.totalPoint.toString(),
              icon: Icons.monetization_on),
          SizedBox(height: 100,)
        ],
      ),
    );
  }
}
