# SparkVend
This is a collection of bits that allows a device to communicate with a vending machine that
implements the MDB/ICP standard.

## Ok, what?
At [SparkCC][https://sparkcc.org] we have a bunch of vending machines. Of these, at least one
talks MDB/ICP, which is a protocol that connects a VMC (vending machine controller) to a number
of devices, like coin mechs, bill acceptors, and cashless (credit card etc) devices. There's been
a long-standing project idea to actually *use* this vending machine, probably for common components
for projects, but managing money is a lot of effort and we could do it another way if we had the
interface.

So. I'm building one.

There's a lot of info floating around about how these things work, but I wanted to learn how to do
a heap of things, so I'm building it from scratch instead.

The biggest complication for this interface is the electronic interface - an opto-isolated
multidrop serial bus isn't a big deal on its own, but finding a UART that supports 9-bit
communications is a little less straightforward. A lot of microcontrollers have these, but then we
want to hook the vending machine to more powerful systems so we don't have to deal with low-level
considerations when we eventually build something way more complex than it needs to be.

Many of the design decisions for this project come from the contents of my gadget bin, as well as
my own abilities:
- MDB/ICP protocol implemented on a Teensy 3.x because I have spares
- Host system is (going to be) a Raspberry Pi because they're everywhere
- PCB design is mostly through-hole because I can just about manage to solder well enough for that

## Setup
This project has a bunch of filters defined to keep the KiCad files as git-friendly as possible. To
set this up correctly, run this:

    git config include.path ../extra.gitconfig

For more info about the filters, see [here][https://jnavila.github.io/plotkicadsch/].

## Repo Layout
### /
Contains project global stuff:
- This README
- Licensing info
- Additional git configuration

### /hardware
Schematics and PCB layouts for the board that connects all of the pieces together. Uses KiCad v5.

### /teensy
MDB/ICP interface firmware for the Teensy. This acts as MDB Cashless Device 1 (0x10). Uses
Teensyduino via PlatformIO, because the Arduino IDE is... weird.

