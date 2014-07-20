#!/usr/bin/env coffee


SerialPort = require("serialport").SerialPort
serialPort = new SerialPort "/dev/cu.usbmodem1411",
  baudrate: 9600


io = (require "socket.io") 9600


introspect = require "introspect"


serialPort.on "open", ->
  serialPort.on "data", (data) ->
    console.log "data", data
    io.sockets.emit "arduino:magnet", data

