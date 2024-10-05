#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl/filters/voxel_grid.h>

class PointCloudProcessor
{
public:
    PointCloudProcessor()
    {
        // Initialize subscriber and publisher
        pointcloud_sub_ = nh_.subscribe("/camera/depth/points", 1, &PointCloudProcessor::pointCloudCallback, this);
        pointcloud_pub_ = nh_.advertise<sensor_msgs::PointCloud2>("/filtered_points", 1);
    }

    void applyVoxelGridFilter(const pcl::PCLPointCloud2::Ptr &input_cloud, const pcl::PCLPointCloud2::Ptr &output_cloud)
    {
        // Perform a VoxelGrid filter (downsampling)
        pcl::VoxelGrid<pcl::PCLPointCloud2> sor;
        sor.setInputCloud(input_cloud);
        sor.setLeafSize(0.05f, 0.05f, 0.05f); // Change the leaf size according to your needs
        sor.filter(*output_cloud);
    }

    void pointCloudCallback(const sensor_msgs::PointCloud2ConstPtr &cloud_msg)
    {
        // Convert the sensor_msgs/PointCloud2 data to pcl/PointCloud
        pcl::PCLPointCloud2::Ptr pcl_cloud(new pcl::PCLPointCloud2);
        pcl_conversions::toPCL(*cloud_msg, *pcl_cloud);

        // Apply voxel grid filter
        pcl::PCLPointCloud2::Ptr pcl_cloud_filtered(new pcl::PCLPointCloud2);
        applyVoxelGridFilter(pcl_cloud, pcl_cloud_filtered);

        // Convert the filtered pcl/PointCloud2 back to sensor_msgs/PointCloud2
        sensor_msgs::PointCloud2 output;
        pcl_conversions::fromPCL(*pcl_cloud_filtered, output);

        // Publish the data
        pointcloud_pub_.publish(output);
        ROS_INFO("PointCloud filtered and published.");
    }

private:
    ros::NodeHandle nh_;
    ros::Subscriber pointcloud_sub_;
    ros::Publisher pointcloud_pub_;
};

int main(int argc, char **argv)
{
    ros::init(argc, argv, "pointcloud_processor_node");

    PointCloudProcessor processor;

    ros::spin();

    return 0;
}
