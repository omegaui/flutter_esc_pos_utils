enum PosAlign { left, center, right }

enum PosCutMode { full, partial }

enum PosFontType { fontA, fontB }

enum PosDrawer { pin2, pin5 }

/// Choose image printing function
/// bitImageRaster: GS v 0 (obsolete)
/// graphics: GS ( L
enum PosImageFn { bitImageRaster, graphics }

class PosTextSize {
  const PosTextSize._internal(this.value);
  final int value;
  static const size1 = PosTextSize._internal(1);
  static const size2 = PosTextSize._internal(2);
  static const size3 = PosTextSize._internal(3);
  static const size4 = PosTextSize._internal(4);
  static const size5 = PosTextSize._internal(5);
  static const size6 = PosTextSize._internal(6);
  static const size7 = PosTextSize._internal(7);
  static const size8 = PosTextSize._internal(8);

  static int decSize(PosTextSize height, PosTextSize width) =>
      16 * (width.value - 1) + (height.value - 1);
}

class PaperSize {
  const PaperSize._internal(this.value);
  final int value;
  static const mm58 = PaperSize._internal(1);
  static const mm80 = PaperSize._internal(2);
  static const mm72 = PaperSize._internal(3);

  /// 4 inch printers: 112 mm paper roll, 104 mm (832 dots) printable area.
  static const mm112 = PaperSize._internal(4);

  /// Alias of [mm112], for printers advertised as "4 inch".
  static const inch4 = mm112;

  /// Printable width, in dots (203 dpi).
  int get width {
    switch (value) {
      case 1:
        return 372;
      case 3:
        return 503;
      case 4:
        // 69 chars * 12 dots (font A) == 92 chars * 9 dots (font B).
        return 828;
      default:
        return 558;
    }
  }

  /// Maximum number of characters per line for the given [font].
  int maxCharsPerLine(PosFontType? font) {
    final bool isFontA = font == null || font == PosFontType.fontA;
    switch (value) {
      case 1:
        return isFontA ? 32 : 42;
      case 3:
        return isFontA ? 42 : 56;
      case 4:
        return isFontA ? 69 : 92;
      default:
        return isFontA ? 48 : 64;
    }
  }
}

class PosBeepDuration {
  const PosBeepDuration._internal(this.value);
  final int value;
  static const beep50ms = PosBeepDuration._internal(1);
  static const beep100ms = PosBeepDuration._internal(2);
  static const beep150ms = PosBeepDuration._internal(3);
  static const beep200ms = PosBeepDuration._internal(4);
  static const beep250ms = PosBeepDuration._internal(5);
  static const beep300ms = PosBeepDuration._internal(6);
  static const beep350ms = PosBeepDuration._internal(7);
  static const beep400ms = PosBeepDuration._internal(8);
  static const beep450ms = PosBeepDuration._internal(9);
}
