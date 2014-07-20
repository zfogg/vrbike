#!/usr/bin/env coffee


serialPort = do ->
  port = "/dev/#{process.env.SERIAL_PORT or "cu.usbmodem1411"}"
  serialPort = new (require "serialport").SerialPort port,
    baudrate: 9600


io = (require "socket.io") 9600


movingAverage = new (require "./movingAverage") 70


printf = require "printf"


serialPort.on "open", ->
  serialPort.on "data", (buf) ->
    for x in buf.toString().split ""
      x = parseInt x, 10
      movingAverage.push x if isInt x
      console.log "arduino:magnet", (printf "%010f", movingAverage.current)
    io.sockets.emit "arduino:magnet", movingAverage.current


`function isInt(n) {
  return typeof n== "number" && isFinite(n) && n%1===0;
}`

