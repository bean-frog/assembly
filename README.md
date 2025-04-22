# assembly

This repo holds stuff I make while learning assembly.<br/>
`asmbuild.sh some-file.asm` builds, links, and runs an assembly file with the following commands:
```
$ nasm -f elf64 -o filename.o filename.asm
$ ld -o filename filename.o
$ ./filename

```
If you use it, change the flags to match your architecture
