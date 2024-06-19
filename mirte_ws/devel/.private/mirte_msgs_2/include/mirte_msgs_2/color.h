// Generated by gencpp from file mirte_msgs_2/color.msg
// DO NOT EDIT!


#ifndef MIRTE_MSGS_2_MESSAGE_COLOR_H
#define MIRTE_MSGS_2_MESSAGE_COLOR_H


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
struct color_
{
  typedef color_<ContainerAllocator> Type;

  color_()
    : red(0)
    , green(0)
    , blue(0)  {
    }
  color_(const ContainerAllocator& _alloc)
    : red(0)
    , green(0)
    , blue(0)  {
  (void)_alloc;
    }



   typedef int32_t _red_type;
  _red_type red;

   typedef int32_t _green_type;
  _green_type green;

   typedef int32_t _blue_type;
  _blue_type blue;





  typedef boost::shared_ptr< ::mirte_msgs_2::color_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mirte_msgs_2::color_<ContainerAllocator> const> ConstPtr;

}; // struct color_

typedef ::mirte_msgs_2::color_<std::allocator<void> > color;

typedef boost::shared_ptr< ::mirte_msgs_2::color > colorPtr;
typedef boost::shared_ptr< ::mirte_msgs_2::color const> colorConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mirte_msgs_2::color_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mirte_msgs_2::color_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::mirte_msgs_2::color_<ContainerAllocator1> & lhs, const ::mirte_msgs_2::color_<ContainerAllocator2> & rhs)
{
  return lhs.red == rhs.red &&
    lhs.green == rhs.green &&
    lhs.blue == rhs.blue;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::mirte_msgs_2::color_<ContainerAllocator1> & lhs, const ::mirte_msgs_2::color_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace mirte_msgs_2

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::mirte_msgs_2::color_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mirte_msgs_2::color_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mirte_msgs_2::color_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mirte_msgs_2::color_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mirte_msgs_2::color_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mirte_msgs_2::color_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mirte_msgs_2::color_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c68492118bb6d7180f53625820775c5d";
  }

  static const char* value(const ::mirte_msgs_2::color_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc68492118bb6d718ULL;
  static const uint64_t static_value2 = 0x0f53625820775c5dULL;
};

template<class ContainerAllocator>
struct DataType< ::mirte_msgs_2::color_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mirte_msgs_2/color";
  }

  static const char* value(const ::mirte_msgs_2::color_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mirte_msgs_2::color_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 red\n"
"int32 green\n"
"int32 blue\n"
;
  }

  static const char* value(const ::mirte_msgs_2::color_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mirte_msgs_2::color_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.red);
      stream.next(m.green);
      stream.next(m.blue);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct color_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mirte_msgs_2::color_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mirte_msgs_2::color_<ContainerAllocator>& v)
  {
    s << indent << "red: ";
    Printer<int32_t>::stream(s, indent + "  ", v.red);
    s << indent << "green: ";
    Printer<int32_t>::stream(s, indent + "  ", v.green);
    s << indent << "blue: ";
    Printer<int32_t>::stream(s, indent + "  ", v.blue);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MIRTE_MSGS_2_MESSAGE_COLOR_H
