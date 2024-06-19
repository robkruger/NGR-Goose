// Generated by gencpp from file mirte_msgs_2/SetMotorSpeedRequest.msg
// DO NOT EDIT!


#ifndef MIRTE_MSGS_2_MESSAGE_SETMOTORSPEEDREQUEST_H
#define MIRTE_MSGS_2_MESSAGE_SETMOTORSPEEDREQUEST_H


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
struct SetMotorSpeedRequest_
{
  typedef SetMotorSpeedRequest_<ContainerAllocator> Type;

  SetMotorSpeedRequest_()
    : speed(0)  {
    }
  SetMotorSpeedRequest_(const ContainerAllocator& _alloc)
    : speed(0)  {
  (void)_alloc;
    }



   typedef int32_t _speed_type;
  _speed_type speed;





  typedef boost::shared_ptr< ::mirte_msgs_2::SetMotorSpeedRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mirte_msgs_2::SetMotorSpeedRequest_<ContainerAllocator> const> ConstPtr;

}; // struct SetMotorSpeedRequest_

typedef ::mirte_msgs_2::SetMotorSpeedRequest_<std::allocator<void> > SetMotorSpeedRequest;

typedef boost::shared_ptr< ::mirte_msgs_2::SetMotorSpeedRequest > SetMotorSpeedRequestPtr;
typedef boost::shared_ptr< ::mirte_msgs_2::SetMotorSpeedRequest const> SetMotorSpeedRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mirte_msgs_2::SetMotorSpeedRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mirte_msgs_2::SetMotorSpeedRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::mirte_msgs_2::SetMotorSpeedRequest_<ContainerAllocator1> & lhs, const ::mirte_msgs_2::SetMotorSpeedRequest_<ContainerAllocator2> & rhs)
{
  return lhs.speed == rhs.speed;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::mirte_msgs_2::SetMotorSpeedRequest_<ContainerAllocator1> & lhs, const ::mirte_msgs_2::SetMotorSpeedRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace mirte_msgs_2

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::mirte_msgs_2::SetMotorSpeedRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mirte_msgs_2::SetMotorSpeedRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mirte_msgs_2::SetMotorSpeedRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mirte_msgs_2::SetMotorSpeedRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mirte_msgs_2::SetMotorSpeedRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mirte_msgs_2::SetMotorSpeedRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mirte_msgs_2::SetMotorSpeedRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "9f7a812be2def1e9db804a7fbea8c3a5";
  }

  static const char* value(const ::mirte_msgs_2::SetMotorSpeedRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x9f7a812be2def1e9ULL;
  static const uint64_t static_value2 = 0xdb804a7fbea8c3a5ULL;
};

template<class ContainerAllocator>
struct DataType< ::mirte_msgs_2::SetMotorSpeedRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mirte_msgs_2/SetMotorSpeedRequest";
  }

  static const char* value(const ::mirte_msgs_2::SetMotorSpeedRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mirte_msgs_2::SetMotorSpeedRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 speed\n"
;
  }

  static const char* value(const ::mirte_msgs_2::SetMotorSpeedRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mirte_msgs_2::SetMotorSpeedRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.speed);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SetMotorSpeedRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mirte_msgs_2::SetMotorSpeedRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mirte_msgs_2::SetMotorSpeedRequest_<ContainerAllocator>& v)
  {
    s << indent << "speed: ";
    Printer<int32_t>::stream(s, indent + "  ", v.speed);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MIRTE_MSGS_2_MESSAGE_SETMOTORSPEEDREQUEST_H