// Generated by gencpp from file mirte_msgs_2/TurnResponse.msg
// DO NOT EDIT!


#ifndef MIRTE_MSGS_2_MESSAGE_TURNRESPONSE_H
#define MIRTE_MSGS_2_MESSAGE_TURNRESPONSE_H


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
struct TurnResponse_
{
  typedef TurnResponse_<ContainerAllocator> Type;

  TurnResponse_()
    : finished(false)  {
    }
  TurnResponse_(const ContainerAllocator& _alloc)
    : finished(false)  {
  (void)_alloc;
    }



   typedef uint8_t _finished_type;
  _finished_type finished;





  typedef boost::shared_ptr< ::mirte_msgs_2::TurnResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mirte_msgs_2::TurnResponse_<ContainerAllocator> const> ConstPtr;

}; // struct TurnResponse_

typedef ::mirte_msgs_2::TurnResponse_<std::allocator<void> > TurnResponse;

typedef boost::shared_ptr< ::mirte_msgs_2::TurnResponse > TurnResponsePtr;
typedef boost::shared_ptr< ::mirte_msgs_2::TurnResponse const> TurnResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mirte_msgs_2::TurnResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mirte_msgs_2::TurnResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::mirte_msgs_2::TurnResponse_<ContainerAllocator1> & lhs, const ::mirte_msgs_2::TurnResponse_<ContainerAllocator2> & rhs)
{
  return lhs.finished == rhs.finished;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::mirte_msgs_2::TurnResponse_<ContainerAllocator1> & lhs, const ::mirte_msgs_2::TurnResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace mirte_msgs_2

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::mirte_msgs_2::TurnResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mirte_msgs_2::TurnResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mirte_msgs_2::TurnResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mirte_msgs_2::TurnResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mirte_msgs_2::TurnResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mirte_msgs_2::TurnResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mirte_msgs_2::TurnResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e2797c797e620a950ba704492d72873b";
  }

  static const char* value(const ::mirte_msgs_2::TurnResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe2797c797e620a95ULL;
  static const uint64_t static_value2 = 0x0ba704492d72873bULL;
};

template<class ContainerAllocator>
struct DataType< ::mirte_msgs_2::TurnResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mirte_msgs_2/TurnResponse";
  }

  static const char* value(const ::mirte_msgs_2::TurnResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mirte_msgs_2::TurnResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool finished\n"
"\n"
;
  }

  static const char* value(const ::mirte_msgs_2::TurnResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mirte_msgs_2::TurnResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.finished);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TurnResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mirte_msgs_2::TurnResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mirte_msgs_2::TurnResponse_<ContainerAllocator>& v)
  {
    s << indent << "finished: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.finished);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MIRTE_MSGS_2_MESSAGE_TURNRESPONSE_H
