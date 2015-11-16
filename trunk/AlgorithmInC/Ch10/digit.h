#ifndef digit_h__
#define digit_h__

const int bitsword = 32;
#define digit(num, i) ((num >> (bitsword - 1 - i)) & 0x01)

const int bytesword = 4;
const int byte_radix = 1 << (bitsword / bytesword);
#define get_byte(num, i) ((num >> (bytesword - i) * bitsword / bytesword) & 0xFF)

#endif // digit_h__
