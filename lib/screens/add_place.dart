import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotspal/providers/user_places.dart';
import 'package:spotspal/widgets/image_input.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final titleController = TextEditingController();

  void savePlace() {
    final enteredTitle = titleController.text;

    if (enteredTitle == null || enteredTitle.isEmpty) {
      return;
    }
    ref.read(userPlacesProvider.notifier).addPlace(enteredTitle);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new place"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
                decoration: const InputDecoration(labelText: "Title"),
                controller: titleController,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                )),
            const ImageInput(),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
                onPressed: savePlace,
                icon: const Icon(Icons.add),
                label: const Text("Add Place"))
          ],
        ),
      ),
    );
  }
}
