import 'package:flutter/material.dart';
import '../models/cat_model.dart';
import '../repositories/cat_repository.dart';
import '../widgets/reaction_button.dart';
import '../widgets/cat_swipe_animation.dart';
import 'cat_details_screen.dart';

class CatExplorerScreen extends StatefulWidget {
  const CatExplorerScreen({super.key});

  @override
  State<CatExplorerScreen> createState() => _CatExplorerScreenState();
}

class _CatExplorerScreenState extends State<CatExplorerScreen> {
  int likedCatsCount = 0;
  Cat? currentCat;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchRandomCat();
  }

  Future<void> _fetchRandomCat() async {
    setState(() => isLoading = true);
    try {
      final cat = await CatRepository().fetchRandomCat();
      setState(() {
        currentCat = cat;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  void _handleSwipe(bool isLike) {
    if (isLike) {
      setState(() => likedCatsCount++);
    }
    _fetchRandomCat();
  }

  void _navigateToDetails() {
    if (currentCat != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CatDetailsScreen(cat: currentCat!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F1EC),
      appBar: AppBar(
        title: const Text('Cat Breed Explorer'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                const Icon(Icons.favorite, color: Colors.red),
                const SizedBox(width: 4),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
                  child: Text(
                    '$likedCatsCount',
                    key: ValueKey(likedCatsCount),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : currentCat == null
                ? const Text('No cat available')
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentCat!.breedName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GestureDetector(
                            onTap: _navigateToDetails,
                            child: CatSwipeAnimation(
                              onSwipe: _handleSwipe,
                              child: Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                clipBehavior: Clip.hardEdge,
                                child: Hero(
                                  tag: 'cat-image-${currentCat!.id}',
                                  child: Image.network(
                                    currentCat!.imageUrl,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    loadingBuilder: (context, child, loadingProgress) {
                                      return loadingProgress == null
                                          ? child
                                          : const Center(child: CircularProgressIndicator());
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ReactionButton(
                            isLike: false,
                            onPressed: () => _handleSwipe(false),
                            size: 70,
                          ),
                          ReactionButton(
                            isLike: true,
                            onPressed: () => _handleSwipe(true),
                            size: 70,
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
      ),
    );
  }
}