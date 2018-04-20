FROM ruby:2.5.1-alpine
MAINTAINER Strobo <info@strobo.io>
RUN apk add --no-cache \
        git \
        docker \
        openssh-client \
        ca-certificates \
        curl \
        unzip \
        python && \
    # aws-cli
    curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm -rf ./awscli-bundle && \
    # ecs-cli
    curl -o /usr/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-v1.4.2 && \
    chmod +x /usr/bin/ecs-cli

RUN gem install yaml_vault && gem install aws-sdk-kms
