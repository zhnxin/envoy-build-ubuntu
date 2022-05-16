From envoyproxy/envoy-build-ubuntu:81a93046060dbe5620d5b3aa92632090a9ee4da6
# https://github.com/envoyproxy/envoy/archive/ea23f47b27464794980c05ab290a3b73d801405e.tar.gz
ENV PATH="/opt/llvm/bin:$PATH"
ARG SHA1=ea23f47b27464794980c05ab290a3b73d801405e
RUN apt update && apt-get -y install vim openssh-server git curl wget &&\
  cd /root &&\
  wget "https://github.com/envoyproxy/envoy/archive/${SHA1}.tar.gz" &&\
  tar -zxvf "envoy-${SHA1}.tar.gz" &&\
  cd "envoy-${SHA1}" &&\
  sh /root/envoy/tools/vscode/refresh_compdb.sh
RUN sed -i 's|#PermitRootLogin.*|PermitRootLogin yes|g' /etc/ssh/sshd_config
  
