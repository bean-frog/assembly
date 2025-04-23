# assembly

This repo holds stuff I make while learning assembly.<br/>
`asmbuild.sh some-file.asm` builds, links, and runs an assembly file with the following commands:
```
$ nasm -f elf64 -o filename.o filename.asm
$ ld -o filename filename.o
$ ./filename
```
If you use it, change the flags to match your architecture

`hello-world` - the name says it all<br/>
`copycat` - reads stdin and prints that to stdout<br/>
`addtofile` - copycat but appends to a file instead of writing to stdout<br/>
`lowleveltv-rosettastone` - LowLevelTV's rosetta stone C snippet
`strcmp` - read stdin twice and determine if the strings are the same <br/>
