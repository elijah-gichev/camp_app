import 'package:camp_app/core/constants/app_colors.dart';
import 'package:camp_app/core/utils/date.dart';
import 'package:camp_app/money/bloc/day_expenses.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ExpensesChart extends StatelessWidget {
  final List<DayExpenses> expenses;

  const ExpensesChart({Key? key, required this.expenses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      legend: Legend(isVisible: false),
      primaryXAxis: CategoryAxis(
        axisLabelFormatter: (AxisLabelRenderDetails details) {
          return ChartAxisLabel(_formatDate(details.text), null);
        },
        majorGridLines: const MajorGridLines(width: 0),
        labelPlacement: LabelPlacement.onTicks,
      ),
      primaryYAxis: NumericAxis(
        axisLine: const AxisLine(width: 0),
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        labelFormat: '{value}₽',
        majorTickLines: const MajorTickLines(size: 0),
      ),
      enableAxisAnimation: true,
      trackballBehavior: TrackballBehavior(
        enable: true,
        activationMode: ActivationMode.singleTap,
      ),
      series: _getDefaultSplineSeries(),
      tooltipBehavior: TooltipBehavior(enable: false),
    );
  }

  String _formatDate(String unix) {
    var date = DateTime.fromMillisecondsSinceEpoch(int.parse(unix));
    return date.formatDM();
  }
  List<SplineSeries<DayExpenses, String>> _getDefaultSplineSeries() {
    return <SplineSeries<DayExpenses, String>>[
      SplineSeries<DayExpenses, String>(
        dataSource: expenses,
        xValueMapper: (DayExpenses price, _) =>
            (price.date.millisecondsSinceEpoch).toString(),
        yValueMapper: (DayExpenses price, _) => price.expenses,
        markerSettings: const MarkerSettings(isVisible: false),
        color: AppColors.mainColor,
      ),
    ];
  }
}
