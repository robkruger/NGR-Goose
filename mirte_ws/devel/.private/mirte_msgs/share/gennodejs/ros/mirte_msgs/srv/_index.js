
"use strict";

let SetSingleLEDValue = require('./SetSingleLEDValue.js')
let Move = require('./Move.js')
let GetIMU = require('./GetIMU.js')
let SetServoAngle = require('./SetServoAngle.js')
let SetMotorSpeed = require('./SetMotorSpeed.js')
let SetPinMode = require('./SetPinMode.js')
let SetOLEDImage = require('./SetOLEDImage.js')
let GetEncoder = require('./GetEncoder.js')
let SetPinValue = require('./SetPinValue.js')
let GetKeypad = require('./GetKeypad.js')
let Turn = require('./Turn.js')
let GetIntensityDigital = require('./GetIntensityDigital.js')
let GetPinValue = require('./GetPinValue.js')
let SetLEDValue = require('./SetLEDValue.js')
let get_virtual_color = require('./get_virtual_color.js')
let get_barcode = require('./get_barcode.js')
let GetIntensity = require('./GetIntensity.js')
let GetDistance = require('./GetDistance.js')
let GetRange = require('./GetRange.js')

module.exports = {
  SetSingleLEDValue: SetSingleLEDValue,
  Move: Move,
  GetIMU: GetIMU,
  SetServoAngle: SetServoAngle,
  SetMotorSpeed: SetMotorSpeed,
  SetPinMode: SetPinMode,
  SetOLEDImage: SetOLEDImage,
  GetEncoder: GetEncoder,
  SetPinValue: SetPinValue,
  GetKeypad: GetKeypad,
  Turn: Turn,
  GetIntensityDigital: GetIntensityDigital,
  GetPinValue: GetPinValue,
  SetLEDValue: SetLEDValue,
  get_virtual_color: get_virtual_color,
  get_barcode: get_barcode,
  GetIntensity: GetIntensity,
  GetDistance: GetDistance,
  GetRange: GetRange,
};
