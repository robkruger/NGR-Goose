// Generated by gencpp from file mirte_msgs/Turn.msg
// DO NOT EDIT!


#ifndef MIRTE_MSGS_MESSAGE_TURN_H
#define MIRTE_MSGS_MESSAGE_TURN_H

#include <ros/service_traits.h>


#include <mirte_msgs/TurnRequest.h>
#include <mirte_msgs/TurnResponse.h>


namespace mirte_msgs
{

struct Turn
{

typedef TurnRequest Request;
typedef TurnResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct Turn
} // namespace mirte_msgs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::mirte_msgs::Turn > {
  static const char* value()
  {
    return "55b88347e6bff17eb9eddc282d36da9d";
  }

  static const char* value(const ::mirte_msgs::Turn&) { return value(); }
};

template<>
struct DataType< ::mirte_msgs::Turn > {
  static const char* value()
  {
    return "mirte_msgs/Turn";
  }

  static const char* value(const ::mirte_msgs::Turn&) { return value(); }
};


// service_traits::MD5Sum< ::mirte_msgs::TurnRequest> should match
// service_traits::MD5Sum< ::mirte_msgs::Turn >
template<>
struct MD5Sum< ::mirte_msgs::TurnRequest>
{
  static const char* value()
  {
    return MD5Sum< ::mirte_msgs::Turn >::value();
  }
  static const char* value(const ::mirte_msgs::TurnRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::mirte_msgs::TurnRequest> should match
// service_traits::DataType< ::mirte_msgs::Turn >
template<>
struct DataType< ::mirte_msgs::TurnRequest>
{
  static const char* value()
  {
    return DataType< ::mirte_msgs::Turn >::value();
  }
  static const char* value(const ::mirte_msgs::TurnRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::mirte_msgs::TurnResponse> should match
// service_traits::MD5Sum< ::mirte_msgs::Turn >
template<>
struct MD5Sum< ::mirte_msgs::TurnResponse>
{
  static const char* value()
  {
    return MD5Sum< ::mirte_msgs::Turn >::value();
  }
  static const char* value(const ::mirte_msgs::TurnResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::mirte_msgs::TurnResponse> should match
// service_traits::DataType< ::mirte_msgs::Turn >
template<>
struct DataType< ::mirte_msgs::TurnResponse>
{
  static const char* value()
  {
    return DataType< ::mirte_msgs::Turn >::value();
  }
  static const char* value(const ::mirte_msgs::TurnResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // MIRTE_MSGS_MESSAGE_TURN_H
