import 'dart:convert';

import 'package:health/models/health_care_model.dart';
import 'package:flutter/material.dart';

class PregnancyCareHandler {
  static Future<List<PregnancyCareModel>> getAllAfterBabyBornTips(
      BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    var babyBornTips = <PregnancyCareModel>[];
    // accessing the json file
    var assetsBundle = DefaultAssetBundle.of(context);
    var data = await assetsBundle.loadString('assets/data/pregnancy_care.json');
    var jsonData = json.decode(data);
    var babyBornJson = jsonData['after_your_baby_born'];
    for (var babybornData in babyBornJson) {
      PregnancyCareModel pregnancyCareModel =
          PregnancyCareModel.fromJSON(babybornData);
      babyBornTips.add(pregnancyCareModel);
    }
    return babyBornTips;
  }
  // ***************** handler for Your Pregnancy ***********//

  static Future<List<PregnancyCareModel>> getAllYourPregnancy(
      BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    var pregnancyTips = <PregnancyCareModel>[];
    var assetsBundle = DefaultAssetBundle.of(context);
    var data = await assetsBundle.loadString('assets/data/pregnancy_care.json');
    var jsonData = json.decode(data);
    var pregnancyTipsJson = jsonData['yourPregnancy'];
    for (var pregnancytipsData in pregnancyTipsJson) {
      PregnancyCareModel pregnancyCareModel =
          PregnancyCareModel.fromJSON(pregnancytipsData);
      pregnancyTips.add(pregnancyCareModel);
    }
    return pregnancyTips;
  }

  // ***************** handler for Labour and Birth ***********//

  static Future<List<PregnancyCareModel>> getAllLabourAndBirth(
      BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    var pregnancyTips = <PregnancyCareModel>[];
    var assetsBundle = DefaultAssetBundle.of(context);
    var data = await assetsBundle.loadString('assets/data/pregnancy_care.json');
    var jsonData = json.decode(data);
    var pregnancyTipsJson = jsonData['labour_and_birth'];
    for (var pregnancytipsData in pregnancyTipsJson) {
      PregnancyCareModel pregnancyCareModel =
          PregnancyCareModel.fromJSON(pregnancytipsData);
      pregnancyTips.add(pregnancyCareModel);
    }
    return pregnancyTips;
  }

  // ***************** handler for Labour and Birth ***********//

  static Future<List<PregnancyCareModel>> getAllGettingReadyForBirth(
      BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    var pregnancyTips = <PregnancyCareModel>[];
    var assetsBundle = DefaultAssetBundle.of(context);
    var data = await assetsBundle.loadString('assets/data/pregnancy_care.json');
    var jsonData = json.decode(data);
    var pregnancyTipsJson = jsonData['getting_ready_for_birth'];
    for (var pregnancytipsData in pregnancyTipsJson) {
      PregnancyCareModel pregnancyCareModel =
          PregnancyCareModel.fromJSON(pregnancytipsData);
      pregnancyTips.add(pregnancyCareModel);
    }
    return pregnancyTips;
  }
}
