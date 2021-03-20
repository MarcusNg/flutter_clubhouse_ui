import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/data.dart';
import 'package:flutter_clubhouse_ui/widgets/widgets.dart';

class RoomScreen extends StatelessWidget {
  final Room room;

  const RoomScreen({
    Key? key,
    required this.room,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 120.0,
        leading: TextButton.icon(
          style: TextButton.styleFrom(primary: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(CupertinoIcons.chevron_down),
          label: const Text(
            'All rooms',
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.doc, size: 28.0),
            onPressed: () {},
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 10.0, 20.0, 10.0),
              child:
                  UserProfileImage(imageUrl: currentUser.imageUrl, size: 36.0),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${room.club} 🏠'.toUpperCase(),
                        style: Theme.of(context).textTheme.overline!.copyWith(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.0,
                            ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(CupertinoIcons.ellipsis),
                      ),
                    ],
                  ),
                  Text(
                    room.name,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20.0),
              sliver: SliverGrid.count(
                mainAxisSpacing: 20.0,
                crossAxisCount: 3,
                children: room.speakers
                    .map(
                      (e) => RoomUserProfile(
                        imageUrl: e.imageUrl,
                        size: 66.0,
                        name: e.givenName,
                        isNew: Random().nextBool(),
                        isMuted: Random().nextBool(),
                      ),
                    )
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Followed by speakers',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20.0),
              sliver: SliverGrid.count(
                mainAxisSpacing: 20.0,
                crossAxisCount: 4,
                childAspectRatio: 0.7,
                children: room.followedBySpeakers
                    .map(
                      (e) => RoomUserProfile(
                        imageUrl: e.imageUrl,
                        size: 66.0,
                        name: e.givenName,
                        isNew: Random().nextBool(),
                      ),
                    )
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Others in room',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20.0),
              sliver: SliverGrid.count(
                mainAxisSpacing: 20.0,
                crossAxisCount: 4,
                childAspectRatio: 0.7,
                children: room.others
                    .map(
                      (e) => RoomUserProfile(
                        imageUrl: e.imageUrl,
                        size: 66.0,
                        name: e.givenName,
                        isNew: Random().nextBool(),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 100.0)),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 12.0,
        ),
        height: 110.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 16.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '✌🏾',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      TextSpan(
                        text: 'Leave quietly',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    child: const Icon(CupertinoIcons.add, size: 30.0),
                  ),
                ),
                const SizedBox(width: 16.0),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    child: const Icon(CupertinoIcons.hand_raised, size: 30.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
