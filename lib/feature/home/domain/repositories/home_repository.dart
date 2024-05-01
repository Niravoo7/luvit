import 'package:luvit/core/utils/generic_typedefs.dart';
import 'package:luvit/feature/home/data/model/card_model.dart';
import 'package:luvit/feature/home/domain/entity/card.dart';

abstract class HomeRepository {
  EitherDynamic<Stream<List<CardData>>> getCardList();
}
