import 'package:cooking/generated/l10n.dart';
import 'package:cooking/store/filter_screen_store/filter_screen_store.dart';
import 'package:cooking/theme/colors.dart';
import 'package:cooking/theme/dimens.dart';
import 'package:cooking/theme/images.dart';
import 'package:cooking/widget/clipper/app_bar_clipper.dart';
import 'package:cooking/widget/custom_items/items_categories.dart';
import 'package:cooking/widget/custom_text_app/cook_book_text.dart';
import 'package:cooking/widget/loading_container/loading_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../utils/ui_utils.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  FilterScreenStore filterScreenStore;

  @override
  void initState() {
    onWidgetBuildDone(createListCategories);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    filterScreenStore = Provider.of<FilterScreenStore>(context);
    return Scaffold(
      body: buildContent(),
    );
  }

  Widget buildContent() {
    return Column(
      children: <Widget>[
        buildItemsTop(),
        buildTextCenter(),
        buildItemsBottom(),
      ],
    );
  }

  Widget buildItemsTop() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        buildContainerBackground(),
        buildIconOnBackground(),
      ],
    );
  }

  Widget buildItemsBottom() {
    return Expanded(
      child: Stack(
        children: <Widget>[
          buildContainer(),
          buildBottomDone(),
        ],
      ),
    );
  }

  Widget buildTextCenter() {
    return Padding(
        padding: EdgeInsets.only(bottom: Dimens.padding['largePadding']),
        child: CookBookText(
          text: S.of(context).textFilterScreenSelect,
          textColor: AppColors.selected,
          textSize: Dimens.texts['veryLargeText'],
          fontWeight: FontWeight.bold,
        ));
  }

  Widget buildContainerBackground() {
    return ClipPath(
      clipper: AppBarClipper(),
      child: Container(
        alignment: Alignment.bottomCenter,
        color: AppColors.primary,
        height: getScreenWidth(context) * 0.50,
        child: Padding(
          padding: EdgeInsets.all(Dimens.padding['largePadding']),
          child: Align(
              alignment: Alignment.topCenter,
              child: Image(
                image: const AssetImage(Images.icCarrot),
                height: getScreenWidth(context) * 0.18,
                width: getScreenWidth(context) * 0.18,
              )),
        ),
      ),
    );
  }

  Widget buildIconOnBackground() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: Dimens.padding['smallPadding']),
          child: Icon(
            Icons.filter_list,
            size: Dimens.icons['veryLargestIcon'],
            color: AppColors.selected,
          ),
        ),
      ],
    );
  }

  void createListCategories() {
    filterScreenStore.createListCategories(context);
  }

  Widget buildList() {
    return ListView.builder(
      itemCount: filterScreenStore.listDataCategories.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemsCategories(
          filterScreenStore: filterScreenStore,
          index: index,
        );
      },
    );
  }

  Widget buildBottomDone() {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          setState(() {});
        },
        child: Container(
            padding: EdgeInsets.all(Dimens.padding['largePadding']),
            child: CookBookText(
                text: S.of(context).done,
                textColor: AppColors.selected,
                textSize: Dimens.texts['veryLargeText'],
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget buildContainer() {
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
      child: Observer(builder: (_) {
        return LoadingContainer(
          isLoading: filterScreenStore.isShowLoading,
          child: buildList(),
        );
      }),
    );
  }
}
