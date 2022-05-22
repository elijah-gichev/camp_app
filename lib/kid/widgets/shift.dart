import 'package:camp_app/core/constants/routes.dart';
import 'package:camp_app/core/models/operation.dart';
import 'package:camp_app/core/router.dart';
import 'package:camp_app/core/widgets/animated_icon.dart';
import 'package:camp_app/kid/main/ui/kid_main_page.dart';
import 'package:camp_app/kid/widgets/kid_current_activity.dart';
import 'package:camp_app/money/widgets/operation_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'kid_card.dart';
import 'kid_card_active_status.dart';
import 'kid_card_button.dart';

class Shift extends StatelessWidget {
  const Shift({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transformer = KidCardTransformer(
      angle: -0.05,
    );
    return Row(
      children: [
        Expanded(
          child: Hero(
            tag: 'shift',
            flightShuttleBuilder: (
              _,
              __,
              ___,
              ____,
              ______,
            ) =>
                FlightShuttleBuilder(
              kidCardTransformer: transformer,
            ),
            child: KidCard(
              kidCardTransformer: transformer,
              title: "1 смена 2022",
              status: const KidCardActiveStatus(
                activeStatus: ActiveStatus.active,
              ),
              subtitle: "Корпус №3 Отряд №2",
              onTap: () {
                Navigator.pushNamed(context, Routes.shift);
              },
              action: const KidCardButton(
                title: "Смотреть активность",
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class KidShiftPage extends StatelessWidget {
  const KidShiftPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'shift',
      createRectTween: createRectTween,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: KidTheme.of(context).backgorundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyBackButton(),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  children: [
                    ShiftDay(
                      title: 'сегодня, 22 мая',
                      events: _events,
                    ),
                    ShiftDay(
                      title: 'вчера, 21 мая',
                      events: _events,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Event> get _events {
    return [
      Event(
        title: 'Бани',
        category: 'Процедуры',
        when: DateTime.now(),
        raiting: 4,
      ),
      Event(
        title: 'Магазин (Денис)',
        category: 'Покупки',
        when: DateTime.now(),
        cost: 100,
      ),
      Event(
        title: 'Экскурсия',
        category: 'Развлечения',
        when: DateTime.now(),
      ),
    ];
  }
}

class MyBackButton extends StatelessWidget {
  const MyBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: EdgeInsets.only(
            left: 19,
            top: 19,
          ),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: KidTheme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: KidTheme.of(context).eventCategory.withOpacity(0.5),
              width: 0.5,
            ),
          ),
          child: Center(
            child: Icon(
              Icons.keyboard_arrow_left,
            ),
          ),
        ),
      ),
    );
  }
}

class ShiftDay extends StatelessWidget {
  final String title;
  final List<Event> events;

  const ShiftDay({
    Key? key,
    required this.title,
    required this.events,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: KidTheme.of(context).cardColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      margin: EdgeInsets.only(
        bottom: 14,
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: KidTheme.of(context).cardTextColor,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Column(
            children: events
                .map(
                  (e) => Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: EventView(event: e),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class EventView extends StatelessWidget {
  final Event event;

  const EventView({
    Key? key,
    required this.event,
  }) : super(key: key);

  Color color(BuildContext context) {
    if (event.category == 'Покупки') {
      return KidTheme.of(context).eventRedColor;
    } else if (event.raiting == null) {
      return KidTheme.of(context).buttonColor;
    } else {
      return KidTheme.of(context).eventGreenColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (color(context) == KidTheme.of(context).buttonColor) {
          Navigator.pushNamed(context, Routes.rating);
        }
      },
      child: Container(
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: color(context),
          borderRadius: BorderRadius.circular(
            15.0,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: KidTheme.of(context).eventIconBackground,
                borderRadius: BorderRadius.circular(
                  6.0,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.check,
                  color: KidTheme.of(context).eventDarkBlue,
                ),
              ),
            ),
            SizedBox(
              width: 7,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: KidTheme.of(context).eventDarkBlue,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  event.category,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: KidTheme.of(context).eventCategory,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  extra(context),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    DateFormat('Hm').format(event.when),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget extra(context) {
    if (event.cost != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '- ${event.cost!.toStringAsFixed(2)} ₽',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: KidTheme.of(context).eventDarkRedColor,
            ),
          ),
        ],
      );
    } else if (event.raiting != null) {
      return RaitingIcon(
        size: 25,
        raiting: event.raiting!,
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.question_mark,
            color: Colors.red,
            size: 20,
          ),
          Text(
            '(+10 ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: KidTheme.of(context).eventDarkRedColor,
            ),
          ),
          BrilliantIcon(
            size: 20,
          ),
          Text(
            ' )',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: KidTheme.of(context).eventDarkRedColor,
            ),
          ),
        ],
      );
    }
  }
}

class Event {
  final String title;
  final String category;
  final DateTime when;
  final int? raiting;
  final double? cost;

  Event({
    required this.title,
    required this.category,
    required this.when,
    this.raiting,
    this.cost,
  });
}
