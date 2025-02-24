// Auto-generated. Do not edit!

// (in-package mirte_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class GetRangeRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetRangeRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetRangeRequest
    let len;
    let data = new GetRangeRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'mirte_msgs/GetRangeRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetRangeRequest(null);
    return resolved;
    }
};

class GetRangeResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.min = null;
      this.max = null;
    }
    else {
      if (initObj.hasOwnProperty('min')) {
        this.min = initObj.min
      }
      else {
        this.min = 0.0;
      }
      if (initObj.hasOwnProperty('max')) {
        this.max = initObj.max
      }
      else {
        this.max = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetRangeResponse
    // Serialize message field [min]
    bufferOffset = _serializer.float32(obj.min, buffer, bufferOffset);
    // Serialize message field [max]
    bufferOffset = _serializer.float32(obj.max, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetRangeResponse
    let len;
    let data = new GetRangeResponse(null);
    // Deserialize message field [min]
    data.min = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [max]
    data.max = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'mirte_msgs/GetRangeResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b3ee9ed25575b46bb47c7673ad202faa';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 min
    float32 max
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetRangeResponse(null);
    if (msg.min !== undefined) {
      resolved.min = msg.min;
    }
    else {
      resolved.min = 0.0
    }

    if (msg.max !== undefined) {
      resolved.max = msg.max;
    }
    else {
      resolved.max = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: GetRangeRequest,
  Response: GetRangeResponse,
  md5sum() { return 'b3ee9ed25575b46bb47c7673ad202faa'; },
  datatype() { return 'mirte_msgs/GetRange'; }
};
