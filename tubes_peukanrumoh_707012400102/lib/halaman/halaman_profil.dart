import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';
import '../theme/theme_controller.dart';
import 'data/data_contoh.dart';
import 'widget_desain.dart';

class HalamanProfil extends StatelessWidget {
  const HalamanProfil({super.key});

  int get _totalPesanan => daftarPesananContoh.length;

  int get _totalBelanja =>
      daftarPesananContoh.fold(0, (total, p) => total + p.total);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Warna.tealTua, Warna.teal],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white24,
                child: Text(
                  'BA',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profilContoh.nama,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      profilContoh.email,
                      style: const TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            _StatistikBox(
              label: 'Pesanan',
              nilai: '$_totalPesanan',
            ),
            const SizedBox(width: 12),
            _StatistikBox(
              label: 'Total belanja',
              nilai: rupiah(_totalBelanja),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const _KartuModeGelap(),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: Theme.of(context).dividerColor.withValues(alpha: 0.4),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, color: Warna.teal),
                  const SizedBox(width: 10),
                  const Text(
                    'Alamat pengiriman',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(profilContoh.alamat),
              const SizedBox(height: 4),
              Text(
                profilContoh.telepon,
                style: TextStyle(
                  fontSize: 13,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: Theme.of(context).dividerColor.withValues(alpha: 0.4),
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: ListTile(
              leading: const Icon(Icons.info_outline, color: Warna.teal),
              title: const Text('Tentang aplikasi'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.tentang);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _KartuModeGelap extends StatelessWidget {
  const _KartuModeGelap();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ThemeController.instance,
      builder: (context, _) {
        final gelap = ThemeController.instance.isDark;

        return Container(
          clipBehavior: Clip.antiAlias,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: Theme.of(context).dividerColor.withValues(alpha: 0.4),
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: SwitchListTile(
            contentPadding: EdgeInsets.zero,
            secondary: Icon(
              gelap ? Icons.dark_mode : Icons.light_mode,
              color: gelap ? Warna.aksen : Warna.teal,
            ),
            title: const Text(
              'Mode gelap',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            subtitle: Text(
              gelap ? 'Nyaman dipakai malam hari' : 'Tampilan cerah siang hari',
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).hintColor,
              ),
            ),
            value: gelap,
            onChanged: ThemeController.instance.setDark,
            ),
          ),
        );
      },
    );
  }
}

class _StatistikBox extends StatelessWidget {
  const _StatistikBox({required this.label, required this.nilai});

  final String label;
  final String nilai;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Warna.tealMuda.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: Warna.tealTua),
            ),
            const SizedBox(height: 2),
            Text(
              nilai,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 16,
                color: Warna.tealTua,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
