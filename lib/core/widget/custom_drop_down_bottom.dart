import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_2/features/Home/providers/categorie_selected.dart';

class CustomDropDownBottom extends ConsumerStatefulWidget {
  const CustomDropDownBottom({super.key, required this.allcategorie});
  final List<String> allcategorie;

  @override
  ConsumerState<CustomDropDownBottom> createState() =>
      _CustomDropDownBottomState();
}

class _CustomDropDownBottomState extends ConsumerState<CustomDropDownBottom> {
  OverlayEntry? overlayEntry;
  final LayerLink layerLink = LayerLink();

  void toggleDropdown() {
    if (overlayEntry == null) {
      overlayEntry = _createOverlay();
      Overlay.of(context).insert(overlayEntry!);
    } else {
      _removeOverlay();
    }
  }

  void _removeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  OverlayEntry _createOverlay() {
    final size = MediaQuery.of(context).size;

    final renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    final isRTL = Directionality.of(context) == TextDirection.rtl;

    final dropdownWidth = size.width * 0.4;
    final dropdownHeight = size.height * 0.35;

    double dx;

    // ================= Horizontal =================
    if (isRTL) {
      dx = -(dropdownWidth - renderBox.size.width);
    } else {
      dx = 0;
    }

    // منع الخروج يمين/شمال
    if (position.dx + dx + dropdownWidth > size.width) {
      dx = size.width - position.dx - dropdownWidth - 8;
    }

    if (position.dx + dx < 0) {
      dx = -position.dx + 8;
    }

    // ================= Vertical =================
    final spaceBelow = size.height - position.dy;
    final showAbove = spaceBelow < dropdownHeight;

    final dy = showAbove ? -dropdownHeight : renderBox.size.height;

    return OverlayEntry(
      builder: (context) {
        return GestureDetector(
          onTap: _removeOverlay,
          behavior: HitTestBehavior.translucent,
          child: Stack(
            children: [
              CompositedTransformFollower(
                link: layerLink,
                offset: Offset(dx, dy),
                child: _AnimatedDropdownOverlay(
                  allcategorie: widget.allcategorie,
                  width: dropdownWidth,
                  maxHeight: dropdownHeight,
                  onSelect: (item) {
                    ref.read(categorySelectedProvider.notifier).state = item;
                    _removeOverlay();
                  },
                  onDismiss: _removeOverlay,
                  isAbove: showAbove,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final selected = ref.watch(categorySelectedProvider);

    return NotificationListener<ScrollNotification>(
      onNotification: (_) {
        if (overlayEntry != null) {
          _removeOverlay();
        }
        return false;
      },
      child: CompositedTransformTarget(
        link: layerLink,
        child: GestureDetector(
          onTap: toggleDropdown,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.arrow_drop_down, color: Color(0xFFFF7622)),
                const SizedBox(width: 4),
                Text(
                  selected.isEmpty ? "Select" : selected,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedDropdownOverlay extends StatefulWidget {
  const _AnimatedDropdownOverlay({
    required this.allcategorie,
    required this.width,
    required this.maxHeight,
    required this.onSelect,
    required this.onDismiss,
    required this.isAbove,
  });

  final List<String> allcategorie;
  final double width;
  final double maxHeight;
  final Function(String) onSelect;
  final VoidCallback onDismiss;
  final bool isAbove;

  @override
  State<_AnimatedDropdownOverlay> createState() =>
      _AnimatedDropdownOverlayState();
}

class _AnimatedDropdownOverlayState extends State<_AnimatedDropdownOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> close() async {
    await controller.reverse();
    widget.onDismiss();
  }

  @override
  Widget build(BuildContext context) {
    final fade = Tween(begin: 0.0, end: 1.0).animate(controller);

    final scale = Tween(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    final slide = Tween<Offset>(
      begin: Offset(0, widget.isAbove ? -0.1 : 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    return GestureDetector(
      onTap: close,
      behavior: HitTestBehavior.translucent,
      child: FadeTransition(
        opacity: fade,
        child: SlideTransition(
          position: slide,
          child: ScaleTransition(
            scale: scale,
            child: Material(
              elevation: 12,
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: widget.width,
                constraints: BoxConstraints(maxHeight: widget.maxHeight),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: widget.allcategorie.map((item) {
                    return ListTile(
                      title: Text(item),
                      onTap: () async {
                        await controller.reverse();
                        widget.onSelect(item);
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
