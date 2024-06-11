// Generated by gencpp from file mirte_msgs/GetKeypadResponse.msg
// DO NOT EDIT!


#ifndef MIRTE_MSGS_MESSAGE_GETKEYPADRESPONSE_H
#define MIRTE_MSGS_MESSAGE_GETKEYPADRESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace mirte_msgs
{
template <class ContainerAllocator>
struct GetKeypadResponse_
{
  typedef GetKeypadResponse_<ContainerAllocator> Type;

  GetKeypadResponse_()
    : data()  {
    }
  GetKeypadResponse_(const ContainerAllocator& _alloc)
    : data(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _data_type;
  _data_type data;





  typedef boost::shared_ptr< ::mirte_msgs::GetKeypadResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mirte_msgs::GetKeypadResponse_<ContainerAllocator> const> ConstPtr;

}; // struct GetKeypadResponse_

typedef ::mirte_msgs::GetKeypadResponse_<std::allocator<void> > GetKeypadResponse;

typedef boost::shared_ptr< ::mirte_msgs::GetKeypadResponse > GetKeypadResponsePtr;
typedef boost::shared_ptr< ::mirte_msgs::GetKeypadResponse const> GetKeypadResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mirte_msgs::GetKeypadResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mirte_msgs::GetKeypadResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::mirte_msgs::GetKeypadResponse_<ContainerAllocator1> & lhs, const ::mirte_msgs::GetKeypadResponse_<ContainerAllocator2> & rhs)
{
  return lhs.data == rhs.data;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::mirte_msgs::GetKeypadResponse_<ContainerAllocator1> & lhs, const ::mirte_msgs::GetKeypadResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace mirte_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::mirte_msgs::GetKeypadResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mirte_msgs::GetKeypadResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mirte_msgs::GetKeypadResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mirte_msgs::GetKeypadResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mirte_msgs::GetKeypadResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mirte_msgs::GetKeypadResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mirte_msgs::GetKeypadResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "992ce8a1687cec8c8bd883ec73ca41d1";
  }

  static const char* value(const ::mirte_msgs::GetKeypadResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x992ce8a1687cec8cULL;
  static const uint64_t static_value2 = 0x8bd883ec73ca41d1ULL;
};

template<class ContainerAllocator>
struct DataType< ::mirte_msgs::GetKeypadResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mirte_msgs/GetKeypadResponse";
  }

  static const char* value(const ::mirte_msgs::GetKeypadResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mirte_msgs::GetKeypadResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string data\n"
"\n"
;
  }

  static const char* value(const ::mirte_msgs::GetKeypadResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mirte_msgs::GetKeypadResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.data);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GetKeypadResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mirte_msgs::GetKeypadResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mirte_msgs::GetKeypadResponse_<ContainerAllocator>& v)
  {
    s << indent << "data: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.data);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MIRTE_MSGS_MESSAGE_GETKEYPADRESPONSE_H
