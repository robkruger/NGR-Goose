// Generated by gencpp from file gazebo_sensor_collection_plugins/OrientationSensorData.msg
// DO NOT EDIT!


#ifndef GAZEBO_SENSOR_COLLECTION_PLUGINS_MESSAGE_ORIENTATIONSENSORDATA_H
#define GAZEBO_SENSOR_COLLECTION_PLUGINS_MESSAGE_ORIENTATIONSENSORDATA_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <gazebo_sensor_collection_plugins/EulerData.h>
#include <gazebo_sensor_collection_plugins/QuaternionData.h>

namespace gazebo_sensor_collection_plugins
{
template <class ContainerAllocator>
struct OrientationSensorData_
{
  typedef OrientationSensorData_<ContainerAllocator> Type;

  OrientationSensorData_()
    : x(0.0)
    , y(0.0)
    , z(0.0)
    , w(0.0)
    , covariance()
    , bias()  {
    }
  OrientationSensorData_(const ContainerAllocator& _alloc)
    : x(0.0)
    , y(0.0)
    , z(0.0)
    , w(0.0)
    , covariance(_alloc)
    , bias(_alloc)  {
  (void)_alloc;
    }



   typedef double _x_type;
  _x_type x;

   typedef double _y_type;
  _y_type y;

   typedef double _z_type;
  _z_type z;

   typedef double _w_type;
  _w_type w;

   typedef  ::gazebo_sensor_collection_plugins::EulerData_<ContainerAllocator>  _covariance_type;
  _covariance_type covariance;

   typedef  ::gazebo_sensor_collection_plugins::QuaternionData_<ContainerAllocator>  _bias_type;
  _bias_type bias;





  typedef boost::shared_ptr< ::gazebo_sensor_collection_plugins::OrientationSensorData_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::gazebo_sensor_collection_plugins::OrientationSensorData_<ContainerAllocator> const> ConstPtr;

}; // struct OrientationSensorData_

typedef ::gazebo_sensor_collection_plugins::OrientationSensorData_<std::allocator<void> > OrientationSensorData;

typedef boost::shared_ptr< ::gazebo_sensor_collection_plugins::OrientationSensorData > OrientationSensorDataPtr;
typedef boost::shared_ptr< ::gazebo_sensor_collection_plugins::OrientationSensorData const> OrientationSensorDataConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::gazebo_sensor_collection_plugins::OrientationSensorData_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::gazebo_sensor_collection_plugins::OrientationSensorData_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::gazebo_sensor_collection_plugins::OrientationSensorData_<ContainerAllocator1> & lhs, const ::gazebo_sensor_collection_plugins::OrientationSensorData_<ContainerAllocator2> & rhs)
{
  return lhs.x == rhs.x &&
    lhs.y == rhs.y &&
    lhs.z == rhs.z &&
    lhs.w == rhs.w &&
    lhs.covariance == rhs.covariance &&
    lhs.bias == rhs.bias;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::gazebo_sensor_collection_plugins::OrientationSensorData_<ContainerAllocator1> & lhs, const ::gazebo_sensor_collection_plugins::OrientationSensorData_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace gazebo_sensor_collection_plugins

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::gazebo_sensor_collection_plugins::OrientationSensorData_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::gazebo_sensor_collection_plugins::OrientationSensorData_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::gazebo_sensor_collection_plugins::OrientationSensorData_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::gazebo_sensor_collection_plugins::OrientationSensorData_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::gazebo_sensor_collection_plugins::OrientationSensorData_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::gazebo_sensor_collection_plugins::OrientationSensorData_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::gazebo_sensor_collection_plugins::OrientationSensorData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e34d80bf8481ce2ab0668f1f26f72964";
  }

  static const char* value(const ::gazebo_sensor_collection_plugins::OrientationSensorData_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe34d80bf8481ce2aULL;
  static const uint64_t static_value2 = 0xb0668f1f26f72964ULL;
};

template<class ContainerAllocator>
struct DataType< ::gazebo_sensor_collection_plugins::OrientationSensorData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "gazebo_sensor_collection_plugins/OrientationSensorData";
  }

  static const char* value(const ::gazebo_sensor_collection_plugins::OrientationSensorData_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::gazebo_sensor_collection_plugins::OrientationSensorData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 x\n"
"float64 y\n"
"float64 z\n"
"float64 w\n"
"EulerData covariance\n"
"QuaternionData bias\n"
"\n"
"================================================================================\n"
"MSG: gazebo_sensor_collection_plugins/EulerData\n"
"float64 roll\n"
"float64 pitch\n"
"float64 yaw\n"
"\n"
"================================================================================\n"
"MSG: gazebo_sensor_collection_plugins/QuaternionData\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"float64 w\n"
;
  }

  static const char* value(const ::gazebo_sensor_collection_plugins::OrientationSensorData_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::gazebo_sensor_collection_plugins::OrientationSensorData_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.z);
      stream.next(m.w);
      stream.next(m.covariance);
      stream.next(m.bias);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct OrientationSensorData_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::gazebo_sensor_collection_plugins::OrientationSensorData_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::gazebo_sensor_collection_plugins::OrientationSensorData_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<double>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<double>::stream(s, indent + "  ", v.y);
    s << indent << "z: ";
    Printer<double>::stream(s, indent + "  ", v.z);
    s << indent << "w: ";
    Printer<double>::stream(s, indent + "  ", v.w);
    s << indent << "covariance: ";
    s << std::endl;
    Printer< ::gazebo_sensor_collection_plugins::EulerData_<ContainerAllocator> >::stream(s, indent + "  ", v.covariance);
    s << indent << "bias: ";
    s << std::endl;
    Printer< ::gazebo_sensor_collection_plugins::QuaternionData_<ContainerAllocator> >::stream(s, indent + "  ", v.bias);
  }
};

} // namespace message_operations
} // namespace ros

#endif // GAZEBO_SENSOR_COLLECTION_PLUGINS_MESSAGE_ORIENTATIONSENSORDATA_H
