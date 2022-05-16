From envoyproxy/envoy-build-ubuntu:81a93046060dbe5620d5b3aa92632090a9ee4da6
# https://github.com/envoyproxy/envoy/archive/ea23f47b27464794980c05ab290a3b73d801405e.tar.gz
ENV PATH="/opt/llvm/bin:$PATH"
RUN apt update && apt-get -y install vim openssh-server git curl wget &&\
  cd /root &&\
  git clone --depth 1 -b v1.20.1 https://github.com/envoyproxy/envoy.git &&\
  cd "envoy" &&\
  python3 tools/vscode/generate_debug_config.py //test/extensions/filters/network/dubbo_proxy:dubbo_hessian2_serializer_impl_test --debugger "lldb"
RUN sed -i 's|#PermitRootLogin.*|PermitRootLogin yes|g' /etc/ssh/sshd_config
  
