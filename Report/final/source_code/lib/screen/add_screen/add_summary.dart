import 'dart:ui';

import 'package:cooking/generated/l10n.dart';
import 'package:cooking/navigation/navigation.dart';
import 'package:cooking/screen/add_screen/manage_category.dart';
import 'package:cooking/store/filter_screen_store/filter_screen_store.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/dimens.dart';
import 'package:cooking/utils/ui_utils.dart';
import 'package:cooking/widget/custom_items/items_categories.dart';
import 'package:cooking/widget/custom_items/items_time.dart';
import 'package:cooking/widget/custom_text_app/cook_book_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_duration_picker/flutter_duration_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AddSummary extends StatefulWidget {
  final Function onNextButtonPressed;

  const AddSummary({Key key, this.onNextButtonPressed}) : super(key: key);

  @override
  _AddSummaryState createState() => _AddSummaryState();
}

class _AddSummaryState extends State<AddSummary> {
  String name;
  String descriptions;
  String note;
  FilterScreenStore filterScreenStore;
  String timeOne;
  String timeTwo;
  String unitOne;
  String unitTwo;
  bool checkOne = false;
  bool checkTwo = false;
  Duration durationLeft = const Duration();
  Duration durationRight = const Duration();
  final formKeyName = GlobalKey<FormState>();
  final formKeyDescriptions = GlobalKey<FormState>();

  @override
  void initState() {
    onWidgetBuildDone(createListCategories);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    filterScreenStore = Provider.of<FilterScreenStore>(context);
    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.only(bottom: Dimens.padding['largePadding']),
          children: <Widget>[
            buildContent(),
          ],
        ),
        buildButtonNext(),
      ],
    );
  }

  Widget buildContent() {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimens.padding['screenPadding'],
        right: Dimens.padding['screenPadding'],
        bottom: Dimens.padding['screenPadding'],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CookBookText(
            text: S.of(context).summary,
            textColor: AppColors.selected,
            textSize: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          buildTextFiled(),
          buildCategories(),
          buildItemsTime(),
          TextFormField(
            onChanged: (value) => note = value,
            decoration: InputDecoration(
              hintText: S.of(context).note,
            ),
          ),
        ],
      ),
    );
  }

  void showBottomSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Stack(
            children: <Widget>[
              buildListCategory(),
              buildButtonDone(),
              buildButtonManageCategories(),
            ],
          );
        });
  }

  void createListCategories() {
    filterScreenStore.createListCategories(context);
  }

  Widget buildListCategory() {
    return Container(
      padding: EdgeInsets.only(
          top: Dimens.padding['smallPadding'],
          bottom: Dimens.padding['smallPadding']),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimens.radius['radiusBorderSearch']),
          topRight: Radius.circular(Dimens.radius['radiusBorderSearch']),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: Dimens.padding['largestPadding']),
        child: Observer(builder: (_) {
          return ListView.builder(
            itemCount: filterScreenStore.listDataCategories.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemsCategories(
                filterScreenStore: filterScreenStore,
                index: index,
              );
            },
          );
        }),
      ),
    );
  }

  Widget buildButtonDone() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.all(Dimens.padding['mediumPadding']),
        child: Align(
            alignment: Alignment.topRight,
            child: CookBookText(
              text: S.of(context).done,
              textColor: AppColors.selected,
              fontWeight: FontWeight.bold,
              textSize: Dimens.texts['veryLargeText'],
            )),
      ),
    );
  }

  Widget buildButtonManageCategories() {
    return GestureDetector(
      onTap: () {
        navigateTo(ManageCategory());
      },
      child: Container(
        padding: EdgeInsets.all(Dimens.padding['smallPadding']),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: CookBookText(
              text: S.of(context).manageCategories,
              textSize: Dimens.texts['veryLargeText'],
              fontWeight: FontWeight.bold,
              textColor: AppColors.selected,
            )),
      ),
    );
  }

  Widget buildTextFiled() {
    return Padding(
        padding: EdgeInsets.only(
          left: Dimens.padding['smallPadding'],
          bottom: Dimens.padding['smallPadding'],
        ),
        child: Column(
          children: <Widget>[
            Form(
              key: formKeyName,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: S.of(context).recipeName,
                ),
                onChanged: (value) => name = value,
                validator: (name) {
                  if (name.isEmpty) {
                    return 'Error';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Form(
              key: formKeyDescriptions,
              child: TextFormField(
                onChanged: (value) => descriptions = value,
                decoration:
                    InputDecoration(labelText: S.of(context).description),
                validator: (description) {
                  if (description.isEmpty) {
                    return 'Error';
                  } else {
                    return null;
                  }
                },
              ),
            )
          ],
        ));
  }

  Widget buildItemsTime() {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimens.padding['largePadding']),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: () async {
              final resultingDuration = await showDurationPicker(
                context: context,
                initialTime: durationLeft,
              );
              if (resultingDuration != null) {
                setState(() {
                  durationLeft = resultingDuration;
                });
              }
            },
            child: Container(
              color: Colors.transparent,
              child: ItemTime(
                  text: S.of(context).preparation,
                  check: !(durationLeft.inMinutes == 0),
                  unit:
                      (durationLeft.inMinutes == 0) ? null : S.of(context).mins,
                  time: (durationLeft.inMinutes == 0)
                      ? null
                      : '${durationLeft.inMinutes}'),
            ),
          ),
          GestureDetector(
            onTap: () async {
              final resultingDuration = await showDurationPicker(
                context: context,
                initialTime: durationRight,
              );
              if (resultingDuration != null) {
                setState(() {
                  durationRight = resultingDuration;
                });
              }
            },
            child: Container(
              color: Colors.transparent,
              child: ItemTime(
                  text: S.of(context).cooking,
                  check: !(durationRight.inMinutes == 0),
                  unit: (durationRight.inMinutes == 0)
                      ? null
                      : S.of(context).mins,
                  time: (durationRight.inMinutes == 0)
                      ? null
                      : '${durationRight.inMinutes}'),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategories() {
    return Padding(
        padding: EdgeInsets.only(
          left: Dimens.padding['smallPadding'],
          bottom: Dimens.padding['smallPadding'],
        ),
        child: Column(
          children: <Widget>[
            buildButtonAddCategories(),
            Padding(
              padding: EdgeInsets.only(top: Dimens.padding['smallPadding']),
              child: Container(
                height: 30,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filterScreenStore.listDataCategories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return (filterScreenStore
                                  .listDataCategories[index].isSelected ==
                              false)
                          ? Container()
                          : buildItemText(
                              filterScreenStore.listDataCategories[index].name);
                    }),
              ),
            )
          ],
        ));
  }

  Widget buildItemText(String text) {
    return Padding(
      padding: EdgeInsets.only(left: Dimens.padding['tinyPadding']),
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(Dimens.padding['tinyPadding']),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
              color: AppColors.selected,
            ),
            borderRadius: BorderRadius.circular(
              Dimens.radius['radiusBorderBack'],
            ),
          ),
          child: CookBookText(
            text: text,
            textSize: Dimens.texts['smallText'],
            textColor: AppColors.selected,
          )),
    );
  }

  Widget buildButtonAddCategories() {
    return GestureDetector(
      onTap: () {
        showBottomSheet();
      },
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: <Widget>[
            const Icon(
              Icons.add_circle_outline,
              color: AppColors.bgGreyAppBar,
            ),
            Padding(
              padding: EdgeInsets.only(left: Dimens.padding['smallPadding']),
              child: CookBookText(
                text: S.of(context).addCategory,
                textColor: AppColors.bgGreyAppBar,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildButtonNext() {
    return GestureDetector(
      onTap: () {
        if (formKeyName.currentState.validate() &&
            formKeyDescriptions.currentState.validate() &&
            durationLeft.inMinutes != 0 &&
            durationRight.inMinutes != 0) {
          final categoryId = getSelectedCategoryId();
          widget.onNextButtonPressed(name, descriptions, durationLeft.inMinutes,
              durationRight.inMinutes, note, categoryId);
        }
        if (durationLeft.inMinutes == 0 && durationRight.inMinutes == 0) {
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(S.of(context).msgPleaseEnterTime)));
        }
        setState(() {});
      },
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: EdgeInsets.only(
              right: Dimens.padding['screenPadding'],
              bottom: Dimens.padding['tinyPadding']),
          child: Container(
            padding: EdgeInsets.all(Dimens.padding['tinyPadding']),
            child: CookBookText(
              text: S.of(context).next,
              fontWeight: FontWeight.bold,
              textSize: Dimens.texts['veryLargeText'],
              textColor: AppColors.selected,
            ),
          ),
        ),
      ),
    );
  }

  int getSelectedCategoryId() {
    for (var i = 0; i < filterScreenStore.listDataCategories.length; i++) {
      if (filterScreenStore.listDataCategories[i].isSelected) {
        return filterScreenStore.listDataCategories[i].id;
      }
    }

    return -1;
  }
}
