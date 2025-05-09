# 支持多架构，使用变量指定架构
ARG TARGETARCH
# 基于学长的Ubuntu22.04、ROS2Humble、OpenCV4.11、CUDA12.8、CuDNN9.7.0镜像
FROM --platform=linux/${TARGETARCH} tungchiahui/ros-opencv:humble-411-cuda128-cudnn970-jammy

# 下方内容为拓展的新内容

# 安装livox-sdk2
WORKDIR /opt
RUN git clone https://github.com/Livox-SDK/Livox-SDK2.git && \
    cd ./Livox-SDK2/ && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j$(grep -c ^processor /proc/cpuinfo) && \
    make install -j$(grep -c ^processor /proc/cpuinfo) && \
    ldconfig

# 启动时默认进入bash shell
CMD ["bash"]
