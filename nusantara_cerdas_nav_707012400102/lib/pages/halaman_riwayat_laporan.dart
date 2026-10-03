import 'package:flutter/material.dart';

import '../data/data_laporan.dart';
import '../app_theme.dart';

class HalamanRiwayatLaporan extends StatelessWidget {
  const HalamanRiwayatLaporan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RIWAYAT LAPORAN', style: AppTheme.gayaEyebrow),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        itemCount: DataLaporan.daftar.length,
        itemBuilder: (context, indeks) {
          final laporan = DataLaporan.daftar[indeks];
          final terakhir = indeks == DataLaporan.daftar.length - 1;

          return _BarisLaporan(
            laporan: laporan,
            nomor: indeks + 1,
            garisBawah: !terakhir,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Formulir laporan baru akan dibuka.')),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              tooltip: 'Cari laporan',
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Saring status',
              icon: const Icon(Icons.filter_list),
              onPressed: () {},
            ),
            const SizedBox(width: 40),
            IconButton(
              tooltip: 'Urutkan',
              icon: const Icon(Icons.sort),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Opsi lain',
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _BarisLaporan extends StatelessWidget {
  const _BarisLaporan({
    required this.laporan,
    required this.nomor,
    required this.garisBawah,
  });

  final LaporanWarga laporan;
  final int nomor;
  final bool garisBawah;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 34,
                child: Text(
                  '$nomor'.padLeft(2, '0'),
                  style: textTheme.titleMedium?.copyWith(
                    color: AppTheme.aksen,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(laporan.judul, style: textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(laporan.tanggal, style: textTheme.bodyMedium),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              _ChipStatus(status: laporan.status),
            ],
          ),
        ),
        if (garisBawah) const Divider(height: 1),
      ],
    );
  }
}

class _ChipStatus extends StatelessWidget {
  const _ChipStatus({required this.status});

  final StatusLaporan status;

  @override
  Widget build(BuildContext context) {
    late final Color warna;
    late final String label;

    switch (status) {
      case StatusLaporan.diajukan:
        warna = AppTheme.aksen;
        label = 'Diajukan';
        break;
      case StatusLaporan.diproses:
        warna = AppTheme.primer;
        label = 'Diproses';
        break;
      case StatusLaporan.selesai:
        warna = const Color(0xFF2E7D32);
        label = 'Selesai';
        break;
    }

    // Chip outline tipis dengan titik warna — lebih tenang daripada
    // pil berlatar penuh.
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: warna.withValues(alpha: 0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: warna, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: warna,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
