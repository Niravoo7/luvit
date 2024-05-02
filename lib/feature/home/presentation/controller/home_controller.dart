import 'package:get/get.dart';
import 'package:luvit/feature/home/data/model/card_model.dart';
import 'package:luvit/feature/home/domain/entity/card.dart';
import 'package:luvit/feature/home/domain/usecases/get_card_data.dart';

class HomeController extends GetxController {
  HomeController({required this.getCardUC});

  final GetCardUC getCardUC;

  RxList<CardData> cardDataList = <CardData>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCardData();
  }

  void getCardData() {
    cardDataList
      ..add(
        CardDataModel.fromJson(const {
          "images": [
            "https://domf5oio6qrcr.cloudfront.net/medialibrary/6372/202ebeef-6657-44ec-8fff-28352e1f5999.jpg",
            "https://cdn.britannica.com/92/13192-050-6644F8C3/bananas-bunch.jpg?w=400&h=300&c=crop",
            "https://res.cloudinary.com/roundglass/image/upload/v1653327652/rg/collective/media/Banana%20KP_yg3asc.png",
            "https://www.thedailymeal.com/img/gallery/13-delicious-things-you-can-make-with-bananas/intro-1673458653.sm.webp",
          ],
          "name": "changedBanana",
          "description": "Hi this is fruit. I like you",
          "likeCount": 40,
          "location": "busan",
          "age": 27,
          "tags": ["nonSmocking", "INTP", "goodSmile", "goodFace"],
        }),
      )
      ..add(
        CardDataModel.fromJson(const {
          "images": [
            "https://images.pexels.com/photos/326055/pexels-photo-326055.jpeg?auto=compress&cs=tinysrgb&w=600",
            "https://images.pexels.com/photos/757889/pexels-photo-757889.jpeg?auto=compress&cs=tinysrgb&w=600",
          ],
          "name": "changedBanana",
          "description": "Hi this is fruit. I like you",
          "likeCount": 40,
          "location": "busan",
          "age": 27,
          "tags": ["nonSmocking", "INTP", "goodSmile", "goodFace"],
        }),
      )
      ..add(
        CardDataModel.fromJson(const {
          "images": [
            "https://images.pexels.com/photos/1386604/pexels-photo-1386604.jpeg?auto=compress&cs=tinysrgb&w=600",
            "https://images.pexels.com/photos/1308881/pexels-photo-1308881.jpeg?auto=compress&cs=tinysrgb&w=600",
            "https://images.pexels.com/photos/906052/pexels-photo-906052.jpeg?auto=compress&cs=tinysrgb&w=600",
          ],
          "name": "changedBanana",
          "description": "Hi this is fruit. I like you",
          "likeCount": 40,
          "location": "busan",
          "age": 27,
          "tags": ["nonSmocking", "INTP", "goodSmile", "goodFace"],
        }),
      )
      ..add(
        CardDataModel.fromJson(const {
          "images": [
            "https://images.pexels.com/photos/931007/pexels-photo-931007.jpeg?auto=compress&cs=tinysrgb&w=600",
            "https://images.pexels.com/photos/1391499/pexels-photo-1391499.jpeg?auto=compress&cs=tinysrgb&w=600",
            "https://images.pexels.com/photos/3230267/pexels-photo-3230267.jpeg?auto=compress&cs=tinysrgb&w=600",
          ],
          "name": "changedBanana",
          "description": "Hi this is fruit. I like you",
          "likeCount": 40,
          "location": "busan",
          "age": 27,
          "tags": ["nonSmocking", "INTP", "goodSmile", "goodFace"],
        }),
      );
  }

/*Future<void> getCardData() async {
    final getCardFailedOrSuccess = await getCardUC(NoParams());
    getCardFailedOrSuccess.fold(
      (left) {
        var error = "";
        if (left is GeneralFailure) {
          error = left.error;
        }
        if (left is ServerFailure) {
          error = left.error;
        }
        debugPrint("Error $error");
        cardDataList.clear();
      },
      (right) {
        debugPrint("cardDataList 1 -> ${right.length}");
        cardDataList
          ..clear()
          ..bindStream(right);
        debugPrint("cardDataList -> ${cardDataList.length}");
      },
    );
  }*/
}
