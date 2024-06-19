// Generated by gencpp from file mirte_msgs_2/GetPinValueResponse.msg
// DO NOT EDIT!


#ifndef MIRTE_MSGS_2_MESSAGE_GETPINVALUERESPONSE_H
#define MIRTE_MSGS_2_MESSAGE_GETPINVALUERESPONSE_H


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
struct GetPinValueResponse_
{
  typedef GetPinValueResponse_<ContainerAllocator> Type;

  GetPinValueResponse_()
    : data(0)  {
    }
  GetPinValueResponse_(const ContainerAllocator& _alloc)
    : data(0)  {
  (void)_alloc;
    }



   typedef int32_t _data_type;
  _data_type data;





  typedef boost::shared_ptr< ::mirte_msgs_2::GetPinValueResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mirte_msgs_2::GetPinValueResponse_<ContainerAllocator> const> ConstPtr;

}; // struct GetPinValueResponse_

typedef ::mirte_msgs_2::GetPinValueResponse_<std::allocator<void> > GetPinValueResponse;

typedef boost::shared_ptr< ::mirte_msgs_2::GetPinValueResponse > GetPinValueResponsePtr;
typedef boost::shared_ptr< ::mirte_msgs_2::GetPinValueResponse const> GetPinValueResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mirte_msgs_2::GetPinValueResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mirte_msgs_2::GetPinValueResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::mirte_msgs_2::GetPinValueResponse_<ContainerAllocator1> & lhs, const ::mirte_msgs_2::GetPinValueResponse_<ContainerAllocator2> & rhs)
{
  return lhs.data == rhs.data;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::mirte_msgs_2::GetPinValueResponse_<ContainerAllocator1> & lhs, const ::mirte_msgs_2::GetPinValueResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace mirte_msgs_2

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::mirte_msgs_2::GetPinValueResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mirte_msgs_2::GetPinValueResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mirte_msgs_2::GetPinValueResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mirte_msgs_2::GetPinValueResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mirte_msgs_2::GetPinValueResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mirte_msgs_2::GetPinValueResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mirte_msgs_2::GetPinValueResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "da5909fbe378aeaf85e547e830cc1bb7";
  }

  static const char* value(const ::mirte_msgs_2::GetPinValueResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xda5909fbe378aeafULL;
  static const uint64_t static_value2 = 0x85e547e830cc1bb7ULL;
};

template<class ContainerAllocator>
struct DataType< ::mirte_msgs_2::GetPinValueResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mirte_msgs_2/GetPinValueResponse";
  }

  static const char* value(const ::mirte_msgs_2::GetPinValueResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mirte_msgs_2::GetPinValueResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 data\n"
"\n"
;
  }

  static const char* value(const ::mirte_msgs_2::GetPinValueResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mirte_msgs_2::GetPinValueResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.data);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GetPinValueResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mirte_msgs_2::GetPinValueResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mirte_msgs_2::GetPinValueResponse_<ContainerAllocator>& v)
  {
    s << indent << "data: ";
    Printer<int32_t>::stream(s, indent + "  ", v.data);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MIRTE_MSGS_2_MESSAGE_GETPINVALUERESPONSE_H
