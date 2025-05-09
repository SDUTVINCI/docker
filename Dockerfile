# 支持多架构，使用变量指定架构
ARG TARGETARCH
# 基于学长的Ubuntu22.04、ROS2Humble、OpenCV4.11、CUDA12.8、CuDNN9.7.0镜像
FROM --platform=linux/${TARGETARCH} tungchiahui/ros-opencv:humble-411-cuda128-cudnn970-jammy

# 下方内容为拓展的新内容



# 启动时默认进入bash shell
CMD ["bash"]
