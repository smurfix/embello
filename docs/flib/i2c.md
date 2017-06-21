# I2C communication driver

## Bit-banged driver

[code]: any/i2c-bb.fs (io)
* Code: <a href="https://github.com/jeelabs/embello/tree/master/explore/1608-forth/flib/any/i2c-bb.fs">any/i2c-bb.fs</a>
* Needs: io

This describes the portable _bit-banged_ version of the I2C driver.

Each I2C transaction consists of the following steps:

* start the transaction by calling `i2c-addr`
* send all the bytes out with repeated calls to `>i2c` (or none at all)
* give the number of expected bytes read back to `i2c-xfer` (can be 0)
* check the result to verify that the device responded (false means ok)
* read the reply bytes with repeated calls to `i2c>` (or none at all)
* the transaction will be closed by the driver when the count is reaced

### API

[defs]: <> (i2c-init i2c-addr i2c-xfer >i2c i2c> i2c.)
```
: i2c-init ( -- )  \ initialise bit-banged I2C
: i2c-addr ( u -- )  \ start a new I2C transaction
: i2c-xfer ( u -- nak )  \ prepare for the reply
: >i2c ( u -- )  \ send one byte out to the I2C bus
: i2c> ( -- u )  \ read one byte back from the I2C bus
: i2c. ( -- )  \ scan and report all I2C devices on the bus
```

### Limitations

The bit-banged driver does not support slave mode.

It must not be used in a multiple-master environment.

### Constants

The `SCL` and `SDA` constants should be defined _before_ including this driver,
if you want to use I2C on other pins than the default `PB6` and `PB7`,
respectively.

## Hardware driver (master only)

[code]: stm32f1/i2c.fs (io)
* Code: <a href="https://github.com/jeelabs/embello/tree/master/explore/1608-forth/flib/stm32f1/i2c.fs">stm32f1/i2c.fs</a>
* Needs: io

This describes the master-only version of the I2C driver. It uses the built-in I2C channel 1.

### API

See above; unchanged.

### Limitations

This driver does not support slave mode, but it may be used in a multi-master environment.

The hardware I2C implementation is somewhat buggy; not all workaounds have been implemented.

## Hardware driver (master/slave mode)

[code]: stm32f1/i2c-task.fs (io)
* Code: <a href="https://github.com/jeelabs/embello/tree/master/explore/1608-forth/flib/stm32f1/i2c-task.fs">stm32f1/i2c-task.fs</a>
* Needs: io, multi

This describes the master/slave version of the I2C driver. It uses the built-in I2C channel 1.

The master operates as above.

The slave listener is started by setting the address(es) and the initial write state machine,
then calling `i2c-loop`.

When the driver is addressed with a write request, i2c-recv-hook is called with the transmitted byte.
It is expected to leave the address of the handler for the next byte on the stack. A zero address
causes additional incoming bytes to be NACKed.

For read requests, i2c-xmit-hook is called. Bytes can be written to the bus by calling `>i2c`.
Your code may be aborted if the master ends the transfer. If you return early, $FF will be sent
until the master stops reading.

The receive state machine sets up the xmit hook by replacing its address on the stack,
just below the received byte.
Writing to `i2c-xmit-hook` has no effect.

### API

Master: as above.

Slave:
[defs]: <> (i2c-init i2c-addr i2c-xfer >i2c i2c> i2c.)
```
: i2c-slave ( addr -- ) \ set 7bit addr as (single) slave
: +i2c-slave ( addr2 f -- ) \ set addr2 as additional slave, flag to (dis) allow broadcast
task: i2c1-task \ slave process
0 variable i2c.state \ 0 idle, -1 master, 1-3 adr1/adr2/gen.call
' no-recv variable i2c-recv-hook ( xmit-exec byte -- xmit-exec new-exec ) \ receive state machine
' nop variable i2c-xmit-hook ( -- ) \ sender
: i2c-loop ( -- ) \ start slave task

```

### Limitations

You must periodically call `pause`, as the slave runs in a separate task.

There is no interrupt handler to wake up the slave.

The master code may call `throw` , so you need to run it via `catch`.
The main loop may be augmented thus:
```
\ interpreter loop that catches exceptions
: (quit) [: begin query interpret ." ok." cr again ;] catch ." ERROR:" . quit ;
: init \ allow "throw" to be used in interactive code
  init
  ['] (quit) hook-quit !
  ;
' (quit) hook-quit !

```
