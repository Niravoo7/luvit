import 'package:luvit/core/utils/generic_typedefs.dart';
import 'package:luvit/feature/home/data/model/card_model.dart';

abstract class HomeRepository {
  EitherDynamic<Stream<List<CardModel>>> getCardList();
}
