// Generated by gencpp from file mirte_msgs_2/SetMotorSpeedResponse.msg
// DO NOT EDIT!


#ifndef MIRTE_MSGS_2_MESSAGE_SETMOTORSPEEDRESPONSE_H
#define MIRTE_MSGS_2_MESSAGE_SETMOTORSPEEDRESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace mirte_msgs_2
{
template <class ContainerAllocator>
struct SetMotorSpeedResponse_
{
  typedef SetMotorSpeedResponse_<ContainerAllocator> Type;

  SetMotorSpeedResponse_()
    : status(false)  {
    }
  SetMotorSpeedResponse_(const ContainerAllocator& _alloc)
    : status(false)  {
  (void)_alloc;
    }



   typedef uint8_t _status_type;
  _status_type status;





  typedef boost::shared_ptr< ::mirte_msgs_2::SetMotorSpeedResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mirte_msgs_2::SetMotorSpeedResponse_<ContainerAllocator> const> ConstPtr;

}; // struct SetMotorSpeedResponse_

typedef ::mirte_msgs_2::SetMotorSpeedResponse_<std::allocator<void> > SetMotorSpeedResponse;

typedef boost::shared_ptr< ::mirte_msgs_2::SetMotorSpeedResponse > SetMotorSpeedResponsePtr;
typedef boost::shared_ptr< ::mirte_msgs_2::SetMotorSpeedResponse const> SetMotorSpeedResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mirte_msgs_2::SetMotorSpeedResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mirte_msgs_2::SetMotorSpeedResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::mirte_msgs_2::SetMotorSpeedResponse_<ContainerAllocator1> & lhs, const ::mirte_msgs_2::SetMotorSpeedResponse_<ContainerAllocator2> & rhs)
{
  return lhs.status == rhs.status;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::mirte_msgs_2::SetMotorSpeedResponse_<ContainerAllocator1> & lhs, const ::mirte_msgs_2::SetMotorSpeedResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace mirte_msgs_2

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::mirte_msgs_2::SetMotorSpeedResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mirte_msgs_2::SetMotorSpeedResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mirte_msgs_2::SetMotorSpeedResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mirte_msgs_2::SetMotorSpeedResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mirte_msgs_2::SetMotorSpeedResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mirte_msgs_2::SetMotorSpeedResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mirte_msgs_2::SetMotorSpeedResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "3a1255d4d998bd4d6585c64639b5ee9a";
  }

  static const char* value(const ::mirte_msgs_2::SetMotorSpeedResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x3a1255d4d998bd4dULL;
  static const uint64_t static_value2 = 0x6585c64639b5ee9aULL;
};

template<class ContainerAllocator>
struct DataType< ::mirte_msgs_2::SetMotorSpeedResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mirte_msgs_2/SetMotorSpeedResponse";
  }

  static const char* value(const ::mirte_msgs_2::SetMotorSpeedResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mirte_msgs_2::SetMotorSpeedResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool status\n"
"\n"
;
  }

  static const char* value(const ::mirte_msgs_2::SetMotorSpeedResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mirte_msgs_2::SetMotorSpeedResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.status);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SetMotorSpeedResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mirte_msgs_2::SetMotorSpeedResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mirte_msgs_2::SetMotorSpeedResponse_<ContainerAllocator>& v)
  {
    s << indent << "status: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.status);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MIRTE_MSGS_2_MESSAGE_SETMOTORSPEEDRESPONSE_H
