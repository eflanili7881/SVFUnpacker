# SVFUnpacker - Windows
It lets you unpack multiple SVFs in one go. Currently, it doesn't have directory recursion.

## Credits
- [Me](https://github.com/eflanili7881) for writing script.
- [Gilles Vollant](https://github.com/gvollant) for [SmartVersion](https://github.com/gvollant/smartversion)'s smv.exe binary.

## What does this script do?
This script expands all of your SVF files in one go. I primarily developed this script for unpacking SVF patches for MSDN ISO files. That's why script says SourceISO in itself. But you can use this script in multiple areas.

## Instruction
- Fill required areas.
- See the script does it's magic. Here's an example when I'm unpacking Windows 7 Ultimate build 7600 patches:

  ![image](https://github.com/osmankovan123/SVFUnpacker/assets/44976117/78fbb519-2759-48e9-8ec5-d249b8650f81)

## What is SVF?
You can think SVF is small patch for a get another file that has very similar content compared to source file, but that file has some differences against source file. This file contains differences between source file against target file and target file's metadata. Source file **MUST** have correct checksum for get correct target file via SVF.

In example, you may have Vista's RTM 6000 x64 English ISO (3.53GB). But you may want to download Turkish variant of this ISO (3.18GB). You may have slow internet, but if you download small patch for that file (164.09MB on https://ow.owowo.workers.dev/dl?id=7vRrvWlkXTC%2Flp06S6hZcp5YHVSm7bHT6Jr8QNzxKJppWBvpc3eB5M2dKcW6yB5lqGVNINZI4ytdZnDu4Yth7Fw%3D&iv=XeMflxaVIZJ%2FSS0r), you can get Turkish variant with that small patch. Just downloading 2 files (3.7GB), you'll get content worth of 6.71GB with saving ~%45 bandwidth.

So, equation is like this:
| Source file | Patch file | Target file |
| :-: | :-: | :-: |
| en_windows_vista_x64_dvd_x12-40712.iso (3.53GB) | [tr-tr]_tr_windows_vista_x64_dvd_x12-61213.svf (164.09MB) | tr_windows_vista_x64_dvd_x12-61213.iso (3.18GB) |

## Troubleshooting
### Some files say "bad checksum" after expansion
This may indicate that your downloaded source image is incorrect/corrupt or worse thing is your RAM/(-s) is/(are) defective. On that situation, find broken addresses via Memtest 86 or another software, add these addresses to BCD on Windows to prevent that addresses used by your system.
