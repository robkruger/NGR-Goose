// Generated by gencpp from file mirte_msgs_2/GetPinValue.msg
// DO NOT EDIT!


#ifndef MIRTE_MSGS_2_MESSAGE_GETPINVALUE_H
#define MIRTE_MSGS_2_MESSAGE_GETPINVALUE_H

#include <ros/service_traits.h>


#include <mirte_msgs_2/GetPinValueRequest.h>
#include <mirte_msgs_2/GetPinValueResponse.h>


namespace mirte_msgs_2
{

struct GetPinValue
{

typedef GetPinValueRequest Request;
typedef GetPinValueResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct GetPinValue
} // namespace mirte_msgs_2


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::mirte_msgs_2::GetPinValue > {
  static const char* value()
  {
    return "277ba96458b48c83913177a820e47af8";
  }

  static const char* value(const ::mirte_msgs_2::GetPinValue&) { return value(); }
};

template<>
struct DataType< ::mirte_msgs_2::GetPinValue > {
  static const char* value()
  {
    return "mirte_msgs_2/GetPinValue";
  }

  static const char* value(const ::mirte_msgs_2::GetPinValue&) { return value(); }
};


// service_traits::MD5Sum< ::mirte_msgs_2::GetPinValueRequest> should match
// service_traits::MD5Sum< ::mirte_msgs_2::GetPinValue >
template<>
struct MD5Sum< ::mirte_msgs_2::GetPinValueRequest>
{
  static const char* value()
  {
    return MD5Sum< ::mirte_msgs_2::GetPinValue >::value();
  }
  static const char* value(const ::mirte_msgs_2::GetPinValueRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::mirte_msgs_2::GetPinValueRequest> should match
// service_traits::DataType< ::mirte_msgs_2::GetPinValue >
template<>
struct DataType< ::mirte_msgs_2::GetPinValueRequest>
{
  static const char* value()
  {
    return DataType< ::mirte_msgs_2::GetPinValue >::value();
  }
  static const char* value(const ::mirte_msgs_2::GetPinValueRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::mirte_msgs_2::GetPinValueResponse> should match
// service_traits::MD5Sum< ::mirte_msgs_2::GetPinValue >
template<>
struct MD5Sum< ::mirte_msgs_2::GetPinValueResponse>
{
  static const char* value()
  {
    return MD5Sum< ::mirte_msgs_2::GetPinValue >::value();
  }
  static const char* value(const ::mirte_msgs_2::GetPinValueResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::mirte_msgs_2::GetPinValueResponse> should match
// service_traits::DataType< ::mirte_msgs_2::GetPinValue >
template<>
struct DataType< ::mirte_msgs_2::GetPinValueResponse>
{
  static const char* value()
  {
    return DataType< ::mirte_msgs_2::GetPinValue >::value();
  }
  static const char* value(const ::mirte_msgs_2::GetPinValueResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // MIRTE_MSGS_2_MESSAGE_GETPINVALUE_H
