// Generated by gencpp from file mirte_msgs_2/GetIntensityRequest.msg
// DO NOT EDIT!


#ifndef MIRTE_MSGS_2_MESSAGE_GETINTENSITYREQUEST_H
#define MIRTE_MSGS_2_MESSAGE_GETINTENSITYREQUEST_H


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
struct GetIntensityRequest_
{
  typedef GetIntensityRequest_<ContainerAllocator> Type;

  GetIntensityRequest_()
    {
    }
  GetIntensityRequest_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::mirte_msgs_2::GetIntensityRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mirte_msgs_2::GetIntensityRequest_<ContainerAllocator> const> ConstPtr;

}; // struct GetIntensityRequest_

typedef ::mirte_msgs_2::GetIntensityRequest_<std::allocator<void> > GetIntensityRequest;

typedef boost::shared_ptr< ::mirte_msgs_2::GetIntensityRequest > GetIntensityRequestPtr;
typedef boost::shared_ptr< ::mirte_msgs_2::GetIntensityRequest const> GetIntensityRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mirte_msgs_2::GetIntensityRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mirte_msgs_2::GetIntensityRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


} // namespace mirte_msgs_2

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::mirte_msgs_2::GetIntensityRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mirte_msgs_2::GetIntensityRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mirte_msgs_2::GetIntensityRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mirte_msgs_2::GetIntensityRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mirte_msgs_2::GetIntensityRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mirte_msgs_2::GetIntensityRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mirte_msgs_2::GetIntensityRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::mirte_msgs_2::GetIntensityRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::mirte_msgs_2::GetIntensityRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mirte_msgs_2/GetIntensityRequest";
  }

  static const char* value(const ::mirte_msgs_2::GetIntensityRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mirte_msgs_2::GetIntensityRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
;
  }

  static const char* value(const ::mirte_msgs_2::GetIntensityRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mirte_msgs_2::GetIntensityRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GetIntensityRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mirte_msgs_2::GetIntensityRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::mirte_msgs_2::GetIntensityRequest_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // MIRTE_MSGS_2_MESSAGE_GETINTENSITYREQUEST_H
