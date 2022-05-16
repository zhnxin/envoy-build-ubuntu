From envoyproxy/envoy-build-ubuntu:81a93046060dbe5620d5b3aa92632090a9ee4da6
# https://github.com/envoyproxy/envoy/archive/dba39baf054b9bc7a352c481a70b774e69b8b52d.tar.gz
ENV PATH="/opt/llvm/bin:$PATH"
RUN apt update && apt-get -y install vim openssh-server git curl wget &&\
  cd /root &&\
  wget https://github.com/envoyproxy/envoy/archive/dba39baf054b9bc7a352c481a70b774e69b8b52d.tar.gz &&\
  tar -zxvf envoy-dba39baf054b9bc7a352c481a70b774e69b8b52d.tar.gz &&\
  cd envoy-dba39baf054b9bc7a352c481a70b774e69b8b52d &&\
  sh /root/envoy/tools/vscode/refresh_compdb.sh
RUN sed -i 's|#PermitRootLogin.*|PermitRootLogin yes|g' /etc/ssh/sshd_config
  
