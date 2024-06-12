import 'dart:math';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clearmind_widget/widgets/color/colors.dart';
import 'package:flutter_clearmind_widget_external/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resources/resources.dart';

/// 航班搜索区域
class FlightSearchCard extends StatefulWidget {
  const FlightSearchCard({super.key, required this.itemSearchFunction});

  // 用于搜索项的回调函数
  final ItemSearchFunction<FlightSearchCity> itemSearchFunction;

  @override
  State<FlightSearchCard> createState() => _FlightSearchCardState();
}

class _FlightSearchCardState extends State<FlightSearchCard>
    with TickerProviderStateMixin {
  late Animation _arrowAnimation;

  late AnimationController _arrowAnimationController;

  @override
  void initState() {
    super.initState();
    _arrowAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _arrowAnimation =
        Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 140,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // 左侧图标部分
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.spMin),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        size: 25,
                        FontAwesomeIcons.locationDot,
                        color: ColorStyle.kGrey400,
                      ),
                      Assets.icons.line.image(),
                      Transform.rotate(
                        angle: pi / 2,
                        child: const Icon(
                          size: 25,
                          Icons.flight,
                          color: ColorStyle.kGrey400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // 中间城市输入部分
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: SizedBox(
                        width: 200,
                        child: SearchItemPicker<FlightSearchCity>(
                          itemSearchFunction: widget.itemSearchFunction,
                          onSelectCallback: (city) {
                            return city.city;
                          },
                          suggestionsItemBuilder: (city) {
                            return ListTile(
                              title: Text(city.city ?? ''),
                              subtitle: Text('${city.region}-${city.province}'),
                            );
                          },
                        ),
                      ),
                    ),
                    FittedBox(
                      child: SizedBox(
                        width: 200,
                        child: SearchItemPicker<FlightSearchCity>(
                          itemSearchFunction: widget.itemSearchFunction,
                          onSelectCallback: (city) {
                            return city.city;
                          },
                          suggestionsItemBuilder: (city) {
                            return ListTile(
                              title: Text(city.city ?? ''),
                              subtitle: Text('${city.region}-${city.province}'),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(flex: 1),
              Expanded(
                flex: 1,
                child: InkWell(
                  child: AnimatedBuilder(
                    animation: _arrowAnimation,
                    builder: (context, child) => Transform.rotate(
                      angle: _arrowAnimation.value,
                      child: const Icon(
                        Icons.autorenew_rounded,
                        color: ColorStyle.kBlue,
                        size: 30,
                      ),
                    ),
                  ),
                  onTap: () {
                    /// 旋转动画
                    _arrowAnimationController.isCompleted
                        ? _arrowAnimationController.reverse()
                        : _arrowAnimationController.forward();
                    // logic.swapCity();
                  },
                ),
              )
              // 旋转按钮部分
            ],
          ),
        ),
        SizedBox(height: 15.spMin,),
        DatePickerButton(datePickerSelected: (value) {
          debugPrint(
              'select value: ${CalenderHelper.getRangeDateWithSeparator(value)}');
        }),
      ],
    );
  }
}
