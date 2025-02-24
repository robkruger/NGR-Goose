
"use strict";

let SetMotorSpeed = require('./SetMotorSpeed.js')
let get_barcode = require('./get_barcode.js')
let GetDistance = require('./GetDistance.js')
let GetKeypad = require('./GetKeypad.js')
let SetPinMode = require('./SetPinMode.js')
let GetEncoder = require('./GetEncoder.js')
let GetIntensity = require('./GetIntensity.js')
let GetIntensityDigital = require('./GetIntensityDigital.js')
let GetRange = require('./GetRange.js')
let get_virtual_color = require('./get_virtual_color.js')
let Turn = require('./Turn.js')
let SetOLEDImage = require('./SetOLEDImage.js')
let SetSingleLEDValue = require('./SetSingleLEDValue.js')
let SetServoAngle = require('./SetServoAngle.js')
let GetIMU = require('./GetIMU.js')
let SetLEDValue = require('./SetLEDValue.js')
let GetPinValue = require('./GetPinValue.js')
let Move = require('./Move.js')
let SetPinValue = require('./SetPinValue.js')

module.exports = {
  SetMotorSpeed: SetMotorSpeed,
  get_barcode: get_barcode,
  GetDistance: GetDistance,
  GetKeypad: GetKeypad,
  SetPinMode: SetPinMode,
  GetEncoder: GetEncoder,
  GetIntensity: GetIntensity,
  GetIntensityDigital: GetIntensityDigital,
  GetRange: GetRange,
  get_virtual_color: get_virtual_color,
  Turn: Turn,
  SetOLEDImage: SetOLEDImage,
  SetSingleLEDValue: SetSingleLEDValue,
  SetServoAngle: SetServoAngle,
  GetIMU: GetIMU,
  SetLEDValue: SetLEDValue,
  GetPinValue: GetPinValue,
  Move: Move,
  SetPinValue: SetPinValue,
};
