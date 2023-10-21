import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/cases/chat/otomo_avatar.dart';
import 'package:otomo/views/cases/settings/app_settings_list.dart';
import 'package:otomo/views/cases/settings/app_settings_section.dart';
import 'package:otomo/views/cases/settings/app_settings_tile.dart';

class OtomoProfilePage extends ConsumerWidget {
  const OtomoProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Otomo Profile'),
        actions: const [CloseButton()],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: OtomoAvatar(radius: 80),
          ),
          SliverToBoxAdapter(
            child: Spaces.h40,
          ),
          SliverToBoxAdapter(
            child: AppSettingsList(
              sections: [
                AppSettingsSection(
                  title: const Text('Profile'),
                  tiles: [
                    AppSettingsTile(
                      title: const Text('Name'),
                      value: const Text('Otomo'),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
