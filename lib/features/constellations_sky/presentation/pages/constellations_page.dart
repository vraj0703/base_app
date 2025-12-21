import 'package:base_app/features/constellations_sky/domain/entities/star_chart_params.dart';
import 'package:base_app/features/constellations_sky/presentation/states/constellations_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core/core/extensions/datetime_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

// Creative Themes
enum ConstellationTheme { classic, cyberpunk, gold, matrix, mystic }

extension ConstellationThemeExtension on ConstellationTheme {
  String get displayName {
    switch (this) {
      case ConstellationTheme.classic:
        return 'Classic B/W';
      case ConstellationTheme.cyberpunk:
        return 'Cyberpunk Neon';
      case ConstellationTheme.gold:
        return 'Golden Age';
      case ConstellationTheme.matrix:
        return 'Matrix Code';
      case ConstellationTheme.mystic:
        return 'Mystic Purple';
    }
  }

  ColorFilter? get colorFilter {
    switch (this) {
      case ConstellationTheme.classic:
        return null; // Original
      case ConstellationTheme.cyberpunk:
        return const ColorFilter.matrix([
          // Magenta/Cyan tint
          0.5, 0, 1, 0, 0,
          0, 1, 0.5, 0, 0,
          1, 0, 1.5, 0, 0,
          0, 0, 0, 1, 0,
        ]);
      case ConstellationTheme.gold:
        return const ColorFilter.mode(Color(0xFFFFD700), BlendMode.modulate);
      case ConstellationTheme.matrix:
        return const ColorFilter.matrix([
          0,
          0,
          0,
          0,
          0,
          0,
          1.2,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          1,
          0,
        ]);
      case ConstellationTheme.mystic:
        return const ColorFilter.matrix([
          0.5,
          0,
          0.5,
          0,
          0,
          0,
          0,
          0.5,
          0,
          0,
          1,
          0,
          1,
          0,
          0,
          0,
          0,
          0,
          1,
          0,
        ]);
    }
  }
}

class ConstellationsPage extends StatefulWidget {
  const ConstellationsPage({super.key});

  @override
  State<ConstellationsPage> createState() => _ConstellationsPageState();
}

class _ConstellationsPageState extends State<ConstellationsPage> {
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  ConstellationTheme _selectedTheme = ConstellationTheme.classic;

  @override
  void dispose() {
    _latitudeController.dispose();
    _longitudeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<ConstellationsCubit>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Constellations Sky')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Theme Selector
              DropdownButtonFormField<ConstellationTheme>(
                value: _selectedTheme,
                decoration: const InputDecoration(labelText: 'Chart Style'),
                items: ConstellationTheme.values.map((theme) {
                  return DropdownMenuItem(
                    value: theme,
                    child: Text(theme.displayName),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedTheme = value);
                  }
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _latitudeController,
                decoration: const InputDecoration(labelText: 'Latitude'),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _longitudeController,
                decoration: const InputDecoration(labelText: 'Longitude'),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: Text('Date: ${_selectedDate.apiFormattedString}'),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    final pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(_selectedDate),
                    );

                    if (pickedTime != null) {
                      setState(() {
                        _selectedDate = DateTime(
                          pickedDate.year,
                          pickedDate.month,
                          pickedDate.day,
                          pickedTime.hour,
                          pickedTime.minute,
                        );
                      });
                    }
                  }
                },
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: Builder(
                  builder: (context) {
                    return ElevatedButton(
                      onPressed: () {
                        final lat = double.tryParse(_latitudeController.text);
                        final lon = double.tryParse(_longitudeController.text);

                        if (lat == null || lon == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Invalid coordinates'),
                            ),
                          );
                          return;
                        }

                        context.read<ConstellationsCubit>().generateStarChart(
                          StarChartParams(
                            latitude: lat,
                            longitude: lon,
                            date: _selectedDate,
                            constellationId: 'ori', // Default to Orion for now
                          ),
                        );
                      },
                      child: const Text('Generate Star Chart'),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              BlocBuilder<ConstellationsCubit, ConstellationsState>(
                builder: (context, state) {
                  return state.when(
                    initial: () =>
                        const Center(child: Text('Enter details and generate')),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (msg) => Center(
                      child: Text(
                        'Error: $msg',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                    success: (url) => Column(
                      children: [
                        if (_selectedTheme.colorFilter != null)
                          ColorFiltered(
                            colorFilter: _selectedTheme.colorFilter!,
                            child: Image.network(
                              url,
                              loadingBuilder: (ctx, child, progress) {
                                if (progress == null) return child;
                                return const CircularProgressIndicator();
                              },
                            ),
                          )
                        else
                          Image.network(
                            url,
                            loadingBuilder: (ctx, child, progress) {
                              if (progress == null) return child;
                              return const CircularProgressIndicator();
                            },
                          ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: () => launchUrl(Uri.parse(url)),
                          icon: const Icon(Icons.download),
                          label: const Text('Download Image'),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Note: Downloaded image will be original style.',
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
