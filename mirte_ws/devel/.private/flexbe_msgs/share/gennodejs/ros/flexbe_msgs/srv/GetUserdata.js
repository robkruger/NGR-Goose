// Auto-generated. Do not edit!

// (in-package flexbe_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let UserdataInfo = require('../msg/UserdataInfo.js');

//-----------------------------------------------------------

class GetUserdataRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.userdata_key = null;
    }
    else {
      if (initObj.hasOwnProperty('userdata_key')) {
        this.userdata_key = initObj.userdata_key
      }
      else {
        this.userdata_key = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetUserdataRequest
    // Serialize message field [userdata_key]
    bufferOffset = _serializer.string(obj.userdata_key, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetUserdataRequest
    let len;
    let data = new GetUserdataRequest(null);
    // Deserialize message field [userdata_key]
    data.userdata_key = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.userdata_key);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'flexbe_msgs/GetUserdataRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7cdb08bd760006001b7e7e1ce021b490';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # specify key to filter userdata, leave empty to get all userdata
    string userdata_key
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetUserdataRequest(null);
    if (msg.userdata_key !== undefined) {
      resolved.userdata_key = msg.userdata_key;
    }
    else {
      resolved.userdata_key = ''
    }

    return resolved;
    }
};

class GetUserdataResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.message = null;
      this.userdata = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('message')) {
        this.message = initObj.message
      }
      else {
        this.message = '';
      }
      if (initObj.hasOwnProperty('userdata')) {
        this.userdata = initObj.userdata
      }
      else {
        this.userdata = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetUserdataResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    // Serialize message field [userdata]
    // Serialize the length for message field [userdata]
    bufferOffset = _serializer.uint32(obj.userdata.length, buffer, bufferOffset);
    obj.userdata.forEach((val) => {
      bufferOffset = UserdataInfo.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetUserdataResponse
    let len;
    let data = new GetUserdataResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [userdata]
    // Deserialize array length for message field [userdata]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.userdata = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.userdata[i] = UserdataInfo.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.message);
    object.userdata.forEach((val) => {
      length += UserdataInfo.getMessageSize(val);
    });
    return length + 9;
  }

  static datatype() {
    // Returns string type for a service object
    return 'flexbe_msgs/GetUserdataResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9fe01c8c705cb717d6bd6a64a500fdeb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    string message
    flexbe_msgs/UserdataInfo[] userdata
    
    
    ================================================================================
    MSG: flexbe_msgs/UserdataInfo
    string state
    string key
    string type
    string data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetUserdataResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.message !== undefined) {
      resolved.message = msg.message;
    }
    else {
      resolved.message = ''
    }

    if (msg.userdata !== undefined) {
      resolved.userdata = new Array(msg.userdata.length);
      for (let i = 0; i < resolved.userdata.length; ++i) {
        resolved.userdata[i] = UserdataInfo.Resolve(msg.userdata[i]);
      }
    }
    else {
      resolved.userdata = []
    }

    return resolved;
    }
};

module.exports = {
  Request: GetUserdataRequest,
  Response: GetUserdataResponse,
  md5sum() { return 'cf480fa533a0ed079b4f74ca618d3d84'; },
  datatype() { return 'flexbe_msgs/GetUserdata'; }
};
