FROM alpine:3.9

MAINTAINER Luke Thompson <luke@dukeluke.com>
LABEL Description="This image will be used for Concourse Pipelines executing awscli"

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV TERRAFORM_VERSION 0.11.8
ENV ARCH amd64
ENV OS linux

RUN apk update && \
    apk upgrade && \
    apk add --no-cache coreutils build-base curl git openssl ca-certificates wget unzip zsh bash jq && \
    update-ca-certificates && \
    apk add --no-cache python py-pip python-dev py-setuptools openssh && \
    pip install --upgrade pip pipenv setuptools awscli && \
    rm -f /tmp/* /etc/apk/cache/* && \
    rm -r /root/.cache

# Install oh-my-zsh
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc && \
    echo 'DISABLE_AUTO_UPDATE="true"' >> ~/.zshrc

# Configure zsh
ENV SHELL=/bin/zsh
RUN sed -i -e "s/bin\/ash/bin\/zsh/" /etc/passwd

# Define working directory.
WORKDIR /root

# Set Entrypoint
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
