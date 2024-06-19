// Generated by gencpp from file mirte_msgs_2/GetIntensityDigital.msg
// DO NOT EDIT!


#ifndef MIRTE_MSGS_2_MESSAGE_GETINTENSITYDIGITAL_H
#define MIRTE_MSGS_2_MESSAGE_GETINTENSITYDIGITAL_H

#include <ros/service_traits.h>


#include <mirte_msgs_2/GetIntensityDigitalRequest.h>
#include <mirte_msgs_2/GetIntensityDigitalResponse.h>


namespace mirte_msgs_2
{

struct GetIntensityDigital
{

typedef GetIntensityDigitalRequest Request;
typedef GetIntensityDigitalResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct GetIntensityDigital
} // namespace mirte_msgs_2


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::mirte_msgs_2::GetIntensityDigital > {
  static const char* value()
  {
    return "8b94c1b53db61fb6aed406028ad6332a";
  }

  static const char* value(const ::mirte_msgs_2::GetIntensityDigital&) { return value(); }
};

template<>
struct DataType< ::mirte_msgs_2::GetIntensityDigital > {
  static const char* value()
  {
    return "mirte_msgs_2/GetIntensityDigital";
  }

  static const char* value(const ::mirte_msgs_2::GetIntensityDigital&) { return value(); }
};


// service_traits::MD5Sum< ::mirte_msgs_2::GetIntensityDigitalRequest> should match
// service_traits::MD5Sum< ::mirte_msgs_2::GetIntensityDigital >
template<>
struct MD5Sum< ::mirte_msgs_2::GetIntensityDigitalRequest>
{
  static const char* value()
  {
    return MD5Sum< ::mirte_msgs_2::GetIntensityDigital >::value();
  }
  static const char* value(const ::mirte_msgs_2::GetIntensityDigitalRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::mirte_msgs_2::GetIntensityDigitalRequest> should match
// service_traits::DataType< ::mirte_msgs_2::GetIntensityDigital >
template<>
struct DataType< ::mirte_msgs_2::GetIntensityDigitalRequest>
{
  static const char* value()
  {
    return DataType< ::mirte_msgs_2::GetIntensityDigital >::value();
  }
  static const char* value(const ::mirte_msgs_2::GetIntensityDigitalRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::mirte_msgs_2::GetIntensityDigitalResponse> should match
// service_traits::MD5Sum< ::mirte_msgs_2::GetIntensityDigital >
template<>
struct MD5Sum< ::mirte_msgs_2::GetIntensityDigitalResponse>
{
  static const char* value()
  {
    return MD5Sum< ::mirte_msgs_2::GetIntensityDigital >::value();
  }
  static const char* value(const ::mirte_msgs_2::GetIntensityDigitalResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::mirte_msgs_2::GetIntensityDigitalResponse> should match
// service_traits::DataType< ::mirte_msgs_2::GetIntensityDigital >
template<>
struct DataType< ::mirte_msgs_2::GetIntensityDigitalResponse>
{
  static const char* value()
  {
    return DataType< ::mirte_msgs_2::GetIntensityDigital >::value();
  }
  static const char* value(const ::mirte_msgs_2::GetIntensityDigitalResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // MIRTE_MSGS_2_MESSAGE_GETINTENSITYDIGITAL_H
