import 'package:divan_test_task_rshb/bloc/favorites_bloc.dart';
import 'package:divan_test_task_rshb/bloc/states/favorites_buffer.dart';
import 'package:divan_test_task_rshb/models/product.dart';
import 'package:divan_test_task_rshb/screens/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteBadge extends StatefulWidget {
  final Product product;

  const FavoriteBadge({Key key, this.product}) : super(key: key);

  @override
  _FavoriteBadgeState createState() => _FavoriteBadgeState();
}

class _FavoriteBadgeState extends State<FavoriteBadge> {
  @override
  Widget build(BuildContext context) {
    FavoritesCubit favoritesCubit = BlocProvider.of<FavoritesCubit>(context);
    return BlocBuilder<FavoritesCubit, FavoritesBuffer>(
        buildWhen: (oldState, newState) =>
            oldState.isProductInFavorite(widget.product) != newState.isProductInFavorite(widget.product),
        cubit: favoritesCubit,
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              if (state.isProductInFavorite(widget.product))
                favoritesCubit.removeFromFavorites(widget.product);
              else
                favoritesCubit.addToFavorites(widget.product);
            },
            child: Container(
              height: 40,
              width: 40,
              child: Center(
                  child: SvgPicture.asset(
                state.isProductInFavorite(widget.product)
                    ? "assets/icons/favorite_full.svg"
                    : "assets/icons/favorite_empty.svg",
                width: 16,
                height: 16,
              )),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: RshbColors.greyE0, width: 1),
              ),
            ),
          );
        });
  }
}
