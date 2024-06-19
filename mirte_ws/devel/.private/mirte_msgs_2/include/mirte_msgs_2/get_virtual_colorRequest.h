// Generated by gencpp from file mirte_msgs_2/get_virtual_colorRequest.msg
// DO NOT EDIT!


#ifndef MIRTE_MSGS_2_MESSAGE_GET_VIRTUAL_COLORREQUEST_H
#define MIRTE_MSGS_2_MESSAGE_GET_VIRTUAL_COLORREQUEST_H


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
struct get_virtual_colorRequest_
{
  typedef get_virtual_colorRequest_<ContainerAllocator> Type;

  get_virtual_colorRequest_()
    : direction()  {
    }
  get_virtual_colorRequest_(const ContainerAllocator& _alloc)
    : direction(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _direction_type;
  _direction_type direction;





  typedef boost::shared_ptr< ::mirte_msgs_2::get_virtual_colorRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mirte_msgs_2::get_virtual_colorRequest_<ContainerAllocator> const> ConstPtr;

}; // struct get_virtual_colorRequest_

typedef ::mirte_msgs_2::get_virtual_colorRequest_<std::allocator<void> > get_virtual_colorRequest;

typedef boost::shared_ptr< ::mirte_msgs_2::get_virtual_colorRequest > get_virtual_colorRequestPtr;
typedef boost::shared_ptr< ::mirte_msgs_2::get_virtual_colorRequest const> get_virtual_colorRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mirte_msgs_2::get_virtual_colorRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mirte_msgs_2::get_virtual_colorRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::mirte_msgs_2::get_virtual_colorRequest_<ContainerAllocator1> & lhs, const ::mirte_msgs_2::get_virtual_colorRequest_<ContainerAllocator2> & rhs)
{
  return lhs.direction == rhs.direction;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::mirte_msgs_2::get_virtual_colorRequest_<ContainerAllocator1> & lhs, const ::mirte_msgs_2::get_virtual_colorRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace mirte_msgs_2

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::mirte_msgs_2::get_virtual_colorRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mirte_msgs_2::get_virtual_colorRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mirte_msgs_2::get_virtual_colorRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mirte_msgs_2::get_virtual_colorRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mirte_msgs_2::get_virtual_colorRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mirte_msgs_2::get_virtual_colorRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mirte_msgs_2::get_virtual_colorRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "326e9417def5db9a05a2704a4d8de15e";
  }

  static const char* value(const ::mirte_msgs_2::get_virtual_colorRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x326e9417def5db9aULL;
  static const uint64_t static_value2 = 0x05a2704a4d8de15eULL;
};

template<class ContainerAllocator>
struct DataType< ::mirte_msgs_2::get_virtual_colorRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mirte_msgs_2/get_virtual_colorRequest";
  }

  static const char* value(const ::mirte_msgs_2::get_virtual_colorRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mirte_msgs_2::get_virtual_colorRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string direction\n"
;
  }

  static const char* value(const ::mirte_msgs_2::get_virtual_colorRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mirte_msgs_2::get_virtual_colorRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.direction);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct get_virtual_colorRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mirte_msgs_2::get_virtual_colorRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mirte_msgs_2::get_virtual_colorRequest_<ContainerAllocator>& v)
  {
    s << indent << "direction: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.direction);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MIRTE_MSGS_2_MESSAGE_GET_VIRTUAL_COLORREQUEST_H