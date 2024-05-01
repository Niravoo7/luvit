import 'package:luvit/core/shared/domain/usecases/usecase.dart';
import 'package:luvit/core/utils/generic_typedefs.dart';
import 'package:luvit/feature/home/data/model/card_model.dart';
import 'package:luvit/feature/home/domain/entity/card.dart';
import 'package:luvit/feature/home/domain/repositories/home_repository.dart';

class GetCardUC implements UseCase<Stream<List<CardData>>, NoParams> {
  GetCardUC({required this.homeRepository});

  final HomeRepository homeRepository;

  @override
  EitherDynamic<Stream<List<CardData>>> call(NoParams noParams) =>
      homeRepository.getCardList();
}
