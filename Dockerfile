FROM alpine:latest

# Install Terraform
ENV TF_VERSION=0.12.12

RUN wget https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip -O terraform.zip
RUN unzip terraform.zip && rm terraform.zip
RUN mv terraform /usr/local/bin/

# Install gcloud
ENV CLOUD_SDK_VERSION=267.0.0

ENV PATH /google-cloud-sdk/bin:$PATH
RUN apk --no-cache add \
        curl \
        python \
        py-crcmod \
        bash \
        libc6-compat \
        openssh-client \
        git \
        gnupg \
        jq \
        bind-tools \
    && curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud config set metrics/environment github_docker_image && \
    gcloud components install kubectl alpha beta && \
    gcloud --version
VOLUME ["/root/.config"]

# Install Helm
ENV HELM_VERSION="v2.14.3"

RUN wget -q https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm && \
  chmod +x /usr/local/bin/helm

# Install BATS
RUN git clone https://github.com/bats-core/bats-core.git && \
  git clone https://github.com/ztombol/bats-support /usr/local/lib/bats-support && \
  git clone https://github.com/ztombol/bats-assert /usr/local/lib/bats-assert && \
  cd bats-core && \
  ./install.sh /usr/local

CMD ["/bin/bash"]
