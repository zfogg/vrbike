#!/usr/bin/env coffee


serialPort = do ->
  port = "/dev/#{process.env.SERIAL_PORT or "cu.usbmodem1411"}"
  serialPort = require "serialport"
  serialPort = new serialPort.SerialPort port,
    baudrate: 9600
    parser: serialPort.parsers.readline ""

io = (require "socket.io") 9600

movingAverage = new (require "./movingAverage") 55

printf = require "printf"

ansi = require "ansi"
cursor = ansi process.stdout


serialPort.on "open", ->
  lastVal = null
  serialPort.on "data", (buf) ->
    x = parseInt buf.toString(), 10
    movingAverage.push x
    c = movingAverage.current
    if lastVal isnt c
      process.stdout.write "arduino:magnet: "
      v = Math.floor c * 255
      cursor.rgb 255 - v, v, 0
      process.stdout.write (printf "%010f\n", c)
      cursor.rgb 255, 255, 255
      io.sockets.emit "arduino:magnet", c
    lastVal = c


`function isInt(n) {
  return typeof n== "number" && isFinite(n) && n%1===0;
}`

