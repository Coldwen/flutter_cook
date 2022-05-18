import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cook/app/application.dart';
import 'package:flutter_cook/caipu/pages/home/recipes_intro.dart';
import 'package:flutter_cook/caipu/pages/home/sort.dart';
import 'package:flutter_cook/caipu/pages/home/step.dart';
import 'package:flutter_cook/caipu/pages/home/tips.dart';
import 'package:flutter_cook/model/cook_book.dart';
import 'package:flutter_cook/services/cook_book_service.dart';

import '../../model/models.dart';
import '../../util/toast.dart';
import '../../widget/text_widget.dart';
import 'duration.dart';
import 'materials_used.dart';
import 'nandu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Cook cook;

  late List<Steps> steps;

  late List<Useds> useds;

  @override
  void initState() {
    super.initState();
    steps = [];
    useds = [];
    cook = Cook();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '创建菜谱',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RecipesIntro(cook: cook), //菜谱介绍
            const SizedBox(height: 10),
            MaterialsUsed(useds: useds), //用料
            const SizedBox(height: 10),
            StepView(steps: steps), //步骤
            const SizedBox(height: 10),
            Tips(cook: cook), //贴士
            const SizedBox(height: 10),
            DurationView(cook: cook), //烹饪时长
            const SizedBox(height: 10),
            NanduView(cook: cook), //难度
            const SizedBox(height: 10),
            SortView(cook: cook), //分类
            const SizedBox(height: 20),
            _buildSeedButton(cook),
          ],
        ),
      ),
    );
  }

  Widget _buildSeedButton(Cook cook) {
    return GestureDetector(
      onTap: () => _seed(),
      child: Container(
        width: double.infinity,
        color: Colors.red,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: const TextWidget(
          '发布这个菜谱',
          fontSize: 12,
          textColor: Colors.white,
        ),
      ),
    );
  }

  _seed() async {
    if (cook.recipeImage == null && cook.recipeVideo == null) {
      showToast('封面不能为空');
    } else if (cook.name == null) {
      showToast('菜谱名称不能为空');
    } else if (_yongliaoIsEmpty()) {
      showToast('食材或用料不能为空');
    } else if (_stepIsEmpty()) {
      showToast('步骤图或说明不能为空');
    } else if (cook.duration == null) {
      showToast('烹饪时长不能为空');
    } else if (cook.difficulty == null) {
      showToast('烹饪难度不能为空');
    } else if (cook.sort == null) {
      showToast('分类不能为空');
    } else {
      bool isUsedEmpty = _yongliaoIsEmpty();
      bool idStepEmpty = _stepIsEmpty();
      if (!isUsedEmpty && !idStepEmpty) {
        logger.v(cook.toJson());
        cook.steps = jsonEncode(steps);
        cook.useds = jsonEncode(useds);
        CookBookService.addCookBook(cook);
        showToast('保存成功');
      } else {
        showToast('用料或步骤不可为空');
      }
    }
  }

  ///用料是否有空
  bool _yongliaoIsEmpty() {
    bool isEmpty = false;
    for (Useds item in useds) {
      if ((item.shicai ?? '').trim().isEmpty || (item.count ?? '').isEmpty) {
        isEmpty = true;
        break;
      } else {
        isEmpty = false;
      }
    }
    return isEmpty;
  }

  ///步骤是否有空
  bool _stepIsEmpty() {
    bool isEmpty = false;
    for (Steps item in steps) {
      if ((item.image ?? '').isEmpty || (item.intro ?? '').isEmpty) {
        isEmpty = true;
        break;
      } else {
        isEmpty = false;
      }
    }
    return isEmpty;
  }
}
