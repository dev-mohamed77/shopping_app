import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/model/carts_model/add_carts.dart';
import 'package:shoppingapp/model/carts_model/get_carts.dart';
import 'package:shoppingapp/model/category_model/category_model.dart';
import 'package:shoppingapp/model/favorite_model/add_favorite_model.dart';
import 'package:shoppingapp/model/favorite_model/get_favorite_model.dart';
import 'package:shoppingapp/model/home_model/home_model.dart';
import 'package:shoppingapp/screen/category/category_screen.dart';
import 'package:shoppingapp/screen/favorite/favorite_screen.dart';
import 'package:shoppingapp/screen/home/home_screen.dart';
import 'package:shoppingapp/screen/settings/settings_screen.dart';
import 'package:shoppingapp/shared/constant/widget/constant.dart';
import 'package:shoppingapp/shared/cubit/states.dart';
import 'package:shoppingapp/shared/network/remote/dio_helper/dio_helper.dart';

class ShoppingCubit extends Cubit<ShoppingStates> {
  ShoppingCubit() : super(InitialShoppingState());

  static ShoppingCubit of(context) => BlocProvider.of(context);

  int navBarCount = 0;
  void navBarChangeItem(int index) {
    navBarCount = index;
    emit(NavBarChageItemShoppingState());
  }

  List navBarPages = [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    SettingsScreen(),
  ];

  List<BottomNavigationBarItem> bottomNavBarItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.category),
      label: "Categry",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: "Favorite",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "Settings",
    ),
  ];

  HomeModel? homeModel;
  Map<int, bool> favorite = {};
  Map<int, bool> carts = {};

  void getDataHome() {
    emit(LoadingGetDataHomeShoppingState());

    DioHelper.getData(
      url: "home",
      lang: "en",
      token: token,
    ).then((value) {
      homeModel = HomeModel.formJson(value.data);

      homeModel!.data!.products.forEach((element) {
        favorite.addAll({element.id!: element.inFavorites!});
      });

      homeModel!.data!.products.forEach((element) {
        carts.addAll({element.id!: element.inCart!});
      });

      emit(SuccessGetDataHomeShoppingState());
    }).catchError((error) {
      print(error);

      emit(ErrorGetDataHomeShoppingState());
    });
  }

  // Category

  CategoryModel? categoryModel;

  void getCategory() {
    emit(LoadingGetGategoryShoppingState());

    DioHelper.getData(
      url: "categories",
      lang: "en",
      token: token,
    ).then((value) {
      categoryModel = CategoryModel.fromJson(value.data);

      emit(SuccessGetCategoryShoppingState());
    }).catchError((error) {
      print(error);
      emit(ErrorGetCategoryShoppingState());
    });
  }

  // Add and remove favorite

  FavoriteModel? favoriteModel;

  void changeFavorites({
    required int productId,
  }) {
    favorite[productId] = !favorite[productId]!;
    emit(ChangeFavoritesShoppingState());
    DioHelper.postData(
      url: "favorites",
      lang: "en",
      token: token,
      query: {
        "product_id": productId,
      },
    ).then(
      (value) {
        favoriteModel = FavoriteModel.fromJson(value.data);
        if (!favoriteModel!.status!) {
          favorite[productId] = !favorite[productId]!;
        } else {
          getFavorite();
        }
        emit(SuccessChangeFavoritesShoppingState());
      },
    ).catchError((error) {
      favorite[productId] = !favorite[productId]!;
      print(error);
      emit(ErrorChangeFavoritesShoppingState());
    });
  }

  // Get Favorite

  GetFavoriteModel? getFavoriteModel;

  void getFavorite() {
    emit(LoadingGetFavoriteShoppingState());
    DioHelper.getData(
      url: "favorites",
      lang: "en",
      token: token,
    ).then(
      (value) {
        getFavoriteModel = GetFavoriteModel.fromJson(value.data!);
        // print(getFavoriteModel!.data!.listData[1].product!.image!);
        emit(SuccessGetFavoriteShoppingState());
      },
    ).catchError(
      (error) {
        print(error);
        emit(ErrorGetFavoriteShoppingState());
      },
    );
  }

  // Add Carts

  AddCartsModel? addCartsModel;

  void addCarts({
    required int productId,
  }) {
    carts[productId] = !carts[productId]!;
    emit(LoadingAddCartsShoppingState());

    DioHelper.postData(
      url: "carts",
      query: {
        "product_id": productId,
      },
      lang: "en",
      token: token,
    ).then((value) {
      addCartsModel = AddCartsModel.fromJson(value.data);
      print(addCartsModel!.message);
      if (!addCartsModel!.status!) {
        carts[productId] = !carts[productId]!;
      } else {
        getCarts();
      }

      emit(SuccessAddCartsShoppingState());
    }).catchError((error) {
      print(error);
      carts[productId] = !carts[productId]!;
      emit(ErrorAddCartsShoppingState());
    });
  }

  // Get Carts

  GetCartsModel? getCartsModel;

  void getCarts() {
    emit(LoadingGetCartsShoppingState());

    DioHelper.getData(
      url: "carts",
      lang: "en",
      token: token,
    ).then((value) {
      getCartsModel = GetCartsModel.fromJson(value.data);
      print(getCartsModel!.data!.cartsItem[1].product!.name!);

      emit(SuccessGetCartsShoppingState());
    }).catchError((error) {
      print(error);

      emit(ErrorGetCartsShoppingState());
    });
  }
}
