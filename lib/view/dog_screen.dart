import 'package:fininfocom/viewModel/dog_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DogScreen extends StatefulWidget {
  const DogScreen({super.key});

  @override
  State<DogScreen> createState() => _DogScreenState();
}

class _DogScreenState extends State<DogScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<DogViewModel>(context, listen: false).fetchRandomDog();
  }

  @override
  Widget build(BuildContext context) {
    final dogViewModel = Provider.of<DogViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Dog Images'),
      ),
      body: Visibility(
        visible: dogViewModel.currentDog != null,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (dogViewModel.currentDog != null)
                Visibility(
                  visible: dogViewModel.currentDog != null,
                  replacement: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: Image.network(
                    context.watch<DogViewModel>().currentDog!.imageUrl,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => dogViewModel.fetchRandomDog(),
                child: const Text('Refresh'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
