import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';
import '../app_theme.dart';

class HalamanWarga extends StatelessWidget {
  const HalamanWarga({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('PROFIL', style: AppTheme.gayaEyebrow),
            const SizedBox(height: 8),
            Row(
              children: [
                // Avatar outline dengan inisial, bukan lingkaran penuh.
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppTheme.primer.withValues(alpha: 0.45),
                      width: 1.5,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'MS',
                    style: textTheme.titleLarge?.copyWith(
                      color: AppTheme.primer,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mimkayel Sitempu', style: textTheme.headlineSmall),
                      const SizedBox(height: 4),
                      Text('NIK 1116052001', style: textTheme.bodyMedium),
                      Text('Kelurahan Sukabirus', style: textTheme.bodyMedium),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),

            const Text('AKTIVITAS', style: AppTheme.gayaEyebrow),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: AppTheme.permukaan,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppTheme.garis),
              ),
              clipBehavior: Clip.antiAlias,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                leading: const Icon(
                  Icons.history,
                  size: 22,
                  color: AppTheme.primer,
                ),
                title: const Text('Riwayat Laporan'),
                subtitle: const Text(
                  'Lihat status laporan yang pernah diajukan',
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  size: 20,
                  color: AppTheme.tekstSekunder,
                ),
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.riwayatLaporan),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
