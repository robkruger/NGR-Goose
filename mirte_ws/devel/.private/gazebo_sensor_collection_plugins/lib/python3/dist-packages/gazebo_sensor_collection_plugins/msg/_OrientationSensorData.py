# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from gazebo_sensor_collection_plugins/OrientationSensorData.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import gazebo_sensor_collection_plugins.msg

class OrientationSensorData(genpy.Message):
  _md5sum = "e34d80bf8481ce2ab0668f1f26f72964"
  _type = "gazebo_sensor_collection_plugins/OrientationSensorData"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """float64 x
float64 y
float64 z
float64 w
EulerData covariance
QuaternionData bias

================================================================================
MSG: gazebo_sensor_collection_plugins/EulerData
float64 roll
float64 pitch
float64 yaw

================================================================================
MSG: gazebo_sensor_collection_plugins/QuaternionData
float64 x
float64 y
float64 z
float64 w
"""
  __slots__ = ['x','y','z','w','covariance','bias']
  _slot_types = ['float64','float64','float64','float64','gazebo_sensor_collection_plugins/EulerData','gazebo_sensor_collection_plugins/QuaternionData']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       x,y,z,w,covariance,bias

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(OrientationSensorData, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.x is None:
        self.x = 0.
      if self.y is None:
        self.y = 0.
      if self.z is None:
        self.z = 0.
      if self.w is None:
        self.w = 0.
      if self.covariance is None:
        self.covariance = gazebo_sensor_collection_plugins.msg.EulerData()
      if self.bias is None:
        self.bias = gazebo_sensor_collection_plugins.msg.QuaternionData()
    else:
      self.x = 0.
      self.y = 0.
      self.z = 0.
      self.w = 0.
      self.covariance = gazebo_sensor_collection_plugins.msg.EulerData()
      self.bias = gazebo_sensor_collection_plugins.msg.QuaternionData()

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_11d().pack(_x.x, _x.y, _x.z, _x.w, _x.covariance.roll, _x.covariance.pitch, _x.covariance.yaw, _x.bias.x, _x.bias.y, _x.bias.z, _x.bias.w))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.covariance is None:
        self.covariance = gazebo_sensor_collection_plugins.msg.EulerData()
      if self.bias is None:
        self.bias = gazebo_sensor_collection_plugins.msg.QuaternionData()
      end = 0
      _x = self
      start = end
      end += 88
      (_x.x, _x.y, _x.z, _x.w, _x.covariance.roll, _x.covariance.pitch, _x.covariance.yaw, _x.bias.x, _x.bias.y, _x.bias.z, _x.bias.w,) = _get_struct_11d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_11d().pack(_x.x, _x.y, _x.z, _x.w, _x.covariance.roll, _x.covariance.pitch, _x.covariance.yaw, _x.bias.x, _x.bias.y, _x.bias.z, _x.bias.w))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.covariance is None:
        self.covariance = gazebo_sensor_collection_plugins.msg.EulerData()
      if self.bias is None:
        self.bias = gazebo_sensor_collection_plugins.msg.QuaternionData()
      end = 0
      _x = self
      start = end
      end += 88
      (_x.x, _x.y, _x.z, _x.w, _x.covariance.roll, _x.covariance.pitch, _x.covariance.yaw, _x.bias.x, _x.bias.y, _x.bias.z, _x.bias.w,) = _get_struct_11d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_11d = None
def _get_struct_11d():
    global _struct_11d
    if _struct_11d is None:
        _struct_11d = struct.Struct("<11d")
    return _struct_11d
