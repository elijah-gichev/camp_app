import 'package:flutter/material.dart';

import '../main/ui/kid_main_page.dart';
import '../widgets/kid_achivments.dart';
import '../widgets/kid_current_activity.dart';
import '../widgets/shift.dart';
import 'achivments_controller.dart';
import 'treusure_card.dart';

class KidAchivmentsPage extends StatefulWidget {
  const KidAchivmentsPage({Key? key}) : super(key: key);

  @override
  State<KidAchivmentsPage> createState() => _KidAchivmentsPageState();
}

class _KidAchivmentsPageState extends State<KidAchivmentsPage> {
  late final AchivmentController achivmentController;

  void showShowDilog() {
    showDialog(
      context: context,
      builder: (context) {
        return ShowDialog();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    achivmentController = AchivmentController();
    achivmentController.init();
    achivmentController.startShow.stream.listen((event) {
      if (event) {
        showDialog(
          context: context,
          builder: (context) {
            return ShowDialog();
          },
        );
      } else {
        Navigator.of(context, rootNavigator: true).pop();
      }
    });
    achivmentController.openCloseDialogController.stream.listen(
      (event) {
        if (event) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: KidTheme.of(context).backgorundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: Text(
                  'Подсказка',
                  style: TextStyle(
                    color: KidTheme.of(context).cardTextColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: Text(
                  'Нужно ещё 2 друга',
                  style: TextStyle(
                    color: KidTheme.of(context).cardTextColor,
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            },
          );
        } else {
          Navigator.of(context, rootNavigator: true).pop();
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    achivmentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'achivments',
      createRectTween: createRectTween,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: KidTheme.of(context).backgorundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: MyBackButton(),
              ),
              SizedBox(
                height: 24,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(
                    left: 19,
                    bottom: 19,
                  ),
                  child: GestureDetector(
                    onTap: showShowDilog,
                    child: Text(
                      'Ежедневное\nзадание:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: KidTheme.of(context).cardTextColor,
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              StreamBuilder(
                stream: achivmentController.isEventExistController.stream,
                initialData: true,
                builder: (context, snapshot) {
                  if (snapshot.data == true) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 19,
                      ),
                      child: TreasureCard(
                        achivmentController: achivmentController,
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
