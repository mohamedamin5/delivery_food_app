import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final GlobalKey _buttonKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final renderbox =
                _buttonKey.currentContext!.findRenderObject() as RenderBox;
            final position = renderbox.localToGlobal(Offset.zero);
            final size = renderbox.size;
            final enter = OverlayEntry(
              builder: (contxt) {
                return Positioned(
                  height: 100,
                  width: 100,
                  top: position.dy,
                  left: position.dx + size.height + 5,
                  child: Material(
                    color: Colors.blue,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text('hiiiiii'),
                    ),
                  ),
                );
              },
            );
            Overlay.of(context).insert(enter);
            Future.delayed(Duration(seconds: 3), () {
              enter.remove();
            });
          },
          child: Text('data'),
        ),
      ),
    );
  }
}
