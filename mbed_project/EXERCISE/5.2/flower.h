#ifndef flower_H
#define flower_H

#include "C12832.h"

static char Flower[] = {

0x01, 0xE0, // ____ XX__ ____ ___X XXX_ ____ ____ XX__
0x07, 0xF8, // ____ _XX_ ____ _XXX XXXX X___ ____ XX__
0x1C, 0x0E, // ____ __X_ ___X XX__ ____ XXX_ ___X XX__
0x70, 0x03, // ___X XXXX _XXX ____ ____ __XX __XX X___              adjust flower, that there is just the smiley left as a symbol
0xEC, 0x63, // _XXX X___ XXX_ XX__ _XX_ __XX _XXX XX__
0xCC, 0x63, // XXX_ ____ XX__ XX__ _XX_ __XX ____ _XX_
0xCC, 0x61, // XX__ ____ XX__ XX__ _XX_ ___X X___ __XX
0x80, 0x01, // XX__ ___X X___ ____ ____ ___X X___ __XX
0x88, 0x11, // XXX_ ___X X___ X___ ___X ___X X___ __XX
0x98, 0x19, // _XXX XX_X X__X X___ ___X X__X X___ _XXX
0x8C, 0x31, // ____ XX_X X___ XX__ __XX ___X X_XX XXX_
0xC7, 0xE3, // ___X X___ XX__ _XXX XXX_ __XX ____ XX__
0xE0, 0x03, // __XX ____ XXX_ ____ ____ __XX ____ _XX_
0x78, 0x0E, // __XX ____ _XXX X___ ____ XXX_ ____ _XX_
0x1F, 0xFC, // __XX ____ ___X XXXX XXXX XX__ _X__ XXX_
0x07, 0xF0, // __XX ____ __XX _XXX XXXX ____ _XXX XX__

};

Bitmap bitmFlower = {
  16,               // XSize
  16,               // YSize
  2,                // Bytes in each line
  Flower,           // Pointer to picture data
};

#endif

