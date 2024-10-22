#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/point_cloud2_iterator.h>
#include <pcl_ros/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl_conversions/pcl_conversions.h>
#include <random>

int main(int argc, char** argv) {
  // Initialize ROS node
  ros::init(argc, argv, "fake_point_cloud_publisher");
  ros::NodeHandle nh;

  // Create a publisher for the PointCloud2 message
  ros::Publisher pub = nh.advertise<sensor_msgs::PointCloud2>("/fake_point_cloud", 1);

  // Set the publishing rate
  ros::Rate loop_rate(10);  // 10 Hz

  // PointCloud2 message
  sensor_msgs::PointCloud2 cloud_msg;

  // Set frame ID and height and width of the point cloud
  cloud_msg.header.frame_id = "map"; // Adjust frame_id to your setup
  cloud_msg.height = 1;  // Unordered point cloud (height = 1)
  cloud_msg.width = 100; // Number of points
  cloud_msg.is_dense = false;
  cloud_msg.is_bigendian = false;
  cloud_msg.point_step = 3 * sizeof(float); // Each point consists of 3 floats (x, y, z)
  cloud_msg.row_step = cloud_msg.point_step * cloud_msg.width;

  // Create a random number generator to generate random points
  std::random_device rd;
  std::mt19937 gen(rd());
  std::uniform_real_distribution<> dis(-5.0, 5.0); // Points range from -5 to 5 in all axes

  // Allocate memory for the point cloud data
  cloud_msg.data.resize(cloud_msg.width * cloud_msg.point_step);

  while (ros::ok()) {
    // Update the time stamp
    cloud_msg.header.stamp = ros::Time::now();

    // Fill in the point cloud data (x, y, z)
    for (size_t i = 0; i < cloud_msg.width; ++i) {
      float x = static_cast<float>(dis(gen));
      float y = static_cast<float>(dis(gen));
      float z = static_cast<float>(dis(gen));

      // Pack the x, y, z coordinates into the PointCloud2 data array
      std::memcpy(&cloud_msg.data[i * cloud_msg.point_step + 0], &x, sizeof(float));
      std::memcpy(&cloud_msg.data[i * cloud_msg.point_step + 4], &y, sizeof(float));
      std::memcpy(&cloud_msg.data[i * cloud_msg.point_step + 8], &z, sizeof(float));
    }

    // Publish the point cloud
    pub.publish(cloud_msg);

    // Sleep to maintain the loop rate
    ros::spinOnce();
    loop_rate.sleep();
  }

  return 0;
}
