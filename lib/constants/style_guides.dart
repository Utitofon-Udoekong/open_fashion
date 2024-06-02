import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0XFFA8715A);
  static const secondary = Color(0XFFDD8560);
  static const background = Color(0XFFF8F0E7);
  static const inputBg = Color(0XFFD9DBE9);
  static const border = Color(0XFFDEDEDE);
  static const offWhite = Color.fromRGBO(240, 239, 223, 1);
  static const black = Color(0XFF000000);
  static const body = Color(0XFF333333);
  static const label = Color(0xFF555555);
  static const placeholder = Color(0XFF888888);
  static const beige = Color(0XFFE0CFBA);
  static const white = Color(0XFFFFFFFFF);
  static const navBg = Color(0XFFE6E9EE);
  static const iconBg = Color(0XFFC4C4C4);
  static const ringBg = Color(0XFFE1E0DB);
}

class AppStrings {
  static const cartBox = 'cart_table_box';
}

class AppImages {
  static const backward = "assets/images/icons/backward.png";
  static const bleach = "assets/images/icons/bleach.png";
  static const call = "assets/images/icons/call.png";
  static const cart = "assets/images/icons/cart.png";
  static const close = "assets/images/icons/close.png";
  static const divider = "assets/images/icons/divider.png";
  static const dividerPlain = "assets/images/icons/dividerPlain.png";
  static const door = "assets/images/icons/door.png";
  static const down = "assets/images/icons/down.png";
  static const dry = "assets/images/icons/dry.png";
  static const export = "assets/images/icons/export.png";
  static const filter = "assets/images/icons/filter.png";
  static const forward = "assets/images/icons/forward.png";
  static const gallery = "assets/images/icons/gallery.png";
  static const grid = "assets/images/icons/grid.png";
  static const heart = "assets/images/icons/heart.png";
  static const instagram = "assets/images/icons/instagram.png";
  static const iron = "assets/images/icons/iron.png";
  static const listview = "assets/images/icons/listview.png";
  static const location = "assets/images/icons/location.png";
  static const menu = "assets/images/icons/menu.png";
  static const minus = "assets/images/icons/minus.png";
  static const plus = "assets/images/icons/plus.png";
  static const refresh = "assets/images/icons/refresh.png";
  static const resize = "assets/images/icons/resize.png";
  static const search = "assets/images/icons/search.png";
  static const shipping = "assets/images/icons/shipping.png";
  static const sign = "assets/images/icons/sign.png";
  static const tag = "assets/images/icons/tag.png";
  static const twitter = "assets/images/icons/twitter.png";
  static const up = "assets/images/icons/up.png";
  static const voucher = "assets/images/icons/voucher.png";
  static const wash = "assets/images/icons/wash.png";
  static const youtube = "assets/images/icons/youtube.png";

  static const boss = "assets/images/logo/boss.png";
  static const burberry = "assets/images/logo/burberry.png";
  static const catier = "assets/images/logo/catier.png";
  static const gucci = "assets/images/logo/gucci.png";
  static const prada = "assets/images/logo/prada.png";
  static const tiffany = "assets/images/logo/tiffany.png";

  static const item1 = "assets/images/items/item1.png";
  static const item2 = "assets/images/items/item2.png";
  static const item3 = "assets/images/items/item3.png";
  static const item4 = "assets/images/items/item4.png";
  static const item5 = "assets/images/items/item5.png";
  static const item6 = "assets/images/items/item6.png";
  static const item7 = "assets/images/items/item7.png";
  static const item8 = "assets/images/items/item8.png";
  static const item9 = "assets/images/items/item9.png";
  static const item10 = "assets/images/items/item10.png";
  static const item11 = "assets/images/items/item11.png";
  static const item12 = "assets/images/items/item12.png";
  static const item13 = "assets/images/items/item13.png";
  static const item14 = "assets/images/items/item14.png";
  static const item15 = "assets/images/items/item15.png";
  static const item16 = "assets/images/items/item16.png";
  static const item17 = "assets/images/items/item17.png";
  static const item18 = "assets/images/items/item18.png";
  static const item19 = "assets/images/items/item19.png";
  static const item20 = "assets/images/items/item20.png";
  static const item21 = "assets/images/items/item21.png";
  static const item22 = "assets/images/items/item22.png";
  static const item23 = "assets/images/items/item23.png";

  static const logo = "assets/images/logo.png";
}

const defaultPadding = EdgeInsets.symmetric(horizontal: 15, vertical: 20);

enum AppTextStyleEnum {
  title,
  subTitleM,
  subTitleS,
  bodyL,
  bodyM,
  bodyS,
  price
}

class AppTextStyle {
  static TextStyle from(AppTextStyleEnum style,
      {Color? color,
      FontWeight? weight,
      TextOverflow? overflow,
      TextDecoration? decoration}) {
    switch (style) {
      case AppTextStyleEnum.title:
        return TextStyle(
          fontSize: 18.0,
          fontWeight: weight ?? FontWeight.w400,
          color: color,
          overflow: overflow,
          decoration: decoration,
        );
      case AppTextStyleEnum.subTitleM:
        return TextStyle(
          fontSize: 16.0,
          fontWeight: weight ?? FontWeight.w400,
          color: color,
          overflow: overflow,
          decoration: decoration,
        );
      case AppTextStyleEnum.subTitleS:
        return TextStyle(
          fontSize: 14.0,
          fontWeight: weight ?? FontWeight.w400,
          color: color,
          overflow: overflow,
          decoration: decoration,
        );
      case AppTextStyleEnum.bodyL:
        return TextStyle(
          fontSize: 16.0,
          fontWeight: weight ?? FontWeight.w400,
          color: color,
          overflow: overflow,
          decoration: decoration,
        );
      case AppTextStyleEnum.bodyM:
        return TextStyle(
          fontSize: 14.0,
          fontWeight: weight ?? FontWeight.w400,
          color: color,
          overflow: overflow,
          decoration: decoration,
        );
      case AppTextStyleEnum.bodyS:
        return TextStyle(
          fontSize: 12.0,
          fontWeight: weight ?? FontWeight.w400,
          color: color,
          overflow: overflow,
          decoration: decoration,
        );
      case AppTextStyleEnum.price:
        return TextStyle(
          fontSize: 15.0,
          fontWeight: weight ?? FontWeight.w400,
          color: color,
          overflow: overflow,
          decoration: decoration,
        );
    }
  }

  static TextStyle title(
          {Color color = AppColors.black,
          FontWeight? weight,
          TextOverflow? overflow,
          TextDecoration? decoration}) =>
      from(AppTextStyleEnum.title,
          color: color,
          weight: weight,
          overflow: overflow,
          decoration: decoration);
  static TextStyle subTitleM(
          {Color color = AppColors.black,
          FontWeight? weight,
          TextOverflow? overflow,
          TextDecoration? decoration}) =>
      from(AppTextStyleEnum.subTitleM,
          color: color,
          weight: weight,
          overflow: overflow,
          decoration: decoration);
  static TextStyle subTitleS(
          {Color color = AppColors.black,
          FontWeight? weight,
          TextOverflow? overflow,
          TextDecoration? decoration}) =>
      from(AppTextStyleEnum.subTitleS,
          color: color,
          weight: weight,
          overflow: overflow,
          decoration: decoration);
  static TextStyle bodyL(
          {Color color = AppColors.black,
          FontWeight? weight,
          TextOverflow? overflow,
          TextDecoration? decoration}) =>
      from(AppTextStyleEnum.bodyL,
          color: color,
          weight: weight,
          overflow: overflow,
          decoration: decoration);
  static TextStyle bodyM(
          {Color color = AppColors.black,
          FontWeight? weight,
          TextOverflow? overflow,
          TextDecoration? decoration}) =>
      from(AppTextStyleEnum.bodyM,
          color: color,
          weight: weight,
          overflow: overflow,
          decoration: decoration);
  static TextStyle bodyS(
          {Color color = AppColors.black,
          FontWeight? weight,
          TextOverflow? overflow,
          TextDecoration? decoration}) =>
      from(AppTextStyleEnum.bodyS,
          color: color,
          weight: weight,
          overflow: overflow,
          decoration: decoration);
  static TextStyle price(
          {Color color = AppColors.black,
          FontWeight? weight,
          TextOverflow? overflow,
          TextDecoration? decoration}) =>
      from(AppTextStyleEnum.price,
          color: color,
          weight: weight,
          overflow: overflow,
          decoration: decoration);
}
