import 'package:flutter/material.dart';
import 'package:socialife/locator.dart';
import 'package:socialife/services/event/entity/event.entity.dart';
import 'package:socialife/services/user/entity/user.entity.dart';
import 'package:socialife/store/like_event.model.dart';
import 'package:socialife/store/unlike_event.model.dart';
import 'package:socialife/store/user_model.dart';
import 'package:socialife/styles/colors.dart';
import 'package:socialife/widgets/providers/event_provider.dart';

class LikeEventIcon extends StatelessWidget {
  final int eventId;
  const LikeEventIcon({Key? key, required this.eventId}) : super(key: key);

  bool checkIfLiked(Event? event) {
    final isLiked = event?.likes.where(
        (element) => element.user.email == UserModel.user?.profile?.email);

    return isLiked != null && isLiked.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    if (UserModel.user?.role == UserRole.organization) {
      return Container();
    }
    return EventProvider(
        isItemProvider: true,
        itemId: eventId,
        showLoader: false,
        loadingWidget: Container(),
        key: Key('$eventId-like-provider'),
        builder: (context, model, _) =>
            model.items[eventId] != null && UserModel.user != null
                ? IconButton(
                    icon: Icon(
                      checkIfLiked(model.items[eventId])
                          ? Icons.star
                          : Icons.star_border_outlined,
                      size: 32,
                      color: Colors.yellow.shade300.withOpacity(0.8),
                    ),
                    onPressed: () {
                      final isLiked = checkIfLiked(model.items[eventId]);
                      if (!isLiked) {
                        locator<LikeEventModelSingleton>().mutate(eventId);
                      } else {
                        locator<UnlikeEventModelSingleton>().mutate(eventId);
                      }
                    },
                    splashRadius: 20,
                  )
                : IconButton(
                    icon: Icon(
                      checkIfLiked(model.items[eventId])
                          ? Icons.star
                          : Icons.star_border_outlined,
                      size: 32,
                      color: Colors.yellow.shade300.withOpacity(0.8),
                    ),
                    onPressed: () {},
                    splashRadius: 20,
                  ));
  }
}
