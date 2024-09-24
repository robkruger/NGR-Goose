
"use strict";

let Turn = require('./Turn.js')
let get_barcode = require('./get_barcode.js')
let GetIntensityDigital = require('./GetIntensityDigital.js')
let SetPinValue = require('./SetPinValue.js')
let SetMotorSpeed = require('./SetMotorSpeed.js')
let SetPinMode = require('./SetPinMode.js')
let SetServoAngle = require('./SetServoAngle.js')
let SetSingleLEDValue = require('./SetSingleLEDValue.js')
let GetRange = require('./GetRange.js')
let GetIntensity = require('./GetIntensity.js')
let SetOLEDImage = require('./SetOLEDImage.js')
let GetDistance = require('./GetDistance.js')
let GetEncoder = require('./GetEncoder.js')
let get_virtual_color = require('./get_virtual_color.js')
let Move = require('./Move.js')
let GetIMU = require('./GetIMU.js')
let GetKeypad = require('./GetKeypad.js')
let GetPinValue = require('./GetPinValue.js')
let SetLEDValue = require('./SetLEDValue.js')

module.exports = {
  Turn: Turn,
  get_barcode: get_barcode,
  GetIntensityDigital: GetIntensityDigital,
  SetPinValue: SetPinValue,
  SetMotorSpeed: SetMotorSpeed,
  SetPinMode: SetPinMode,
  SetServoAngle: SetServoAngle,
  SetSingleLEDValue: SetSingleLEDValue,
  GetRange: GetRange,
  GetIntensity: GetIntensity,
  SetOLEDImage: SetOLEDImage,
  GetDistance: GetDistance,
  GetEncoder: GetEncoder,
  get_virtual_color: get_virtual_color,
  Move: Move,
  GetIMU: GetIMU,
  GetKeypad: GetKeypad,
  GetPinValue: GetPinValue,
  SetLEDValue: SetLEDValue,
};
