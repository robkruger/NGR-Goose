// Generated by gencpp from file mirte_msgs/get_virtual_color.msg
// DO NOT EDIT!


#ifndef MIRTE_MSGS_MESSAGE_GET_VIRTUAL_COLOR_H
#define MIRTE_MSGS_MESSAGE_GET_VIRTUAL_COLOR_H

#include <ros/service_traits.h>


#include <mirte_msgs/get_virtual_colorRequest.h>
#include <mirte_msgs/get_virtual_colorResponse.h>


namespace mirte_msgs
{

struct get_virtual_color
{

typedef get_virtual_colorRequest Request;
typedef get_virtual_colorResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct get_virtual_color
} // namespace mirte_msgs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::mirte_msgs::get_virtual_color > {
  static const char* value()
  {
    return "8ce5cc0c46b1c53043e61c14e381c577";
  }

  static const char* value(const ::mirte_msgs::get_virtual_color&) { return value(); }
};

template<>
struct DataType< ::mirte_msgs::get_virtual_color > {
  static const char* value()
  {
    return "mirte_msgs/get_virtual_color";
  }

  static const char* value(const ::mirte_msgs::get_virtual_color&) { return value(); }
};


// service_traits::MD5Sum< ::mirte_msgs::get_virtual_colorRequest> should match
// service_traits::MD5Sum< ::mirte_msgs::get_virtual_color >
template<>
struct MD5Sum< ::mirte_msgs::get_virtual_colorRequest>
{
  static const char* value()
  {
    return MD5Sum< ::mirte_msgs::get_virtual_color >::value();
  }
  static const char* value(const ::mirte_msgs::get_virtual_colorRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::mirte_msgs::get_virtual_colorRequest> should match
// service_traits::DataType< ::mirte_msgs::get_virtual_color >
template<>
struct DataType< ::mirte_msgs::get_virtual_colorRequest>
{
  static const char* value()
  {
    return DataType< ::mirte_msgs::get_virtual_color >::value();
  }
  static const char* value(const ::mirte_msgs::get_virtual_colorRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::mirte_msgs::get_virtual_colorResponse> should match
// service_traits::MD5Sum< ::mirte_msgs::get_virtual_color >
template<>
struct MD5Sum< ::mirte_msgs::get_virtual_colorResponse>
{
  static const char* value()
  {
    return MD5Sum< ::mirte_msgs::get_virtual_color >::value();
  }
  static const char* value(const ::mirte_msgs::get_virtual_colorResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::mirte_msgs::get_virtual_colorResponse> should match
// service_traits::DataType< ::mirte_msgs::get_virtual_color >
template<>
struct DataType< ::mirte_msgs::get_virtual_colorResponse>
{
  static const char* value()
  {
    return DataType< ::mirte_msgs::get_virtual_color >::value();
  }
  static const char* value(const ::mirte_msgs::get_virtual_colorResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // MIRTE_MSGS_MESSAGE_GET_VIRTUAL_COLOR_H