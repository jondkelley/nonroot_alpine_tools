FROM alpine:3.15

ARG USER=nonroot
ENV HOME /home/$USER

# install sudo as root
RUN apk add --update sudo
RUN apk add --no-cache iputils vim curl openssl wget

# add new user
RUN adduser -u 1000 -D $USER \
        && echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER \
        && chmod 0440 /etc/sudoers.d/$USER

USER $USER
WORKDIR $HOME

# files in /home/$USER to be owned by $USER
# docker has --chown flag for COPY, but it does not expand ENV so we fallback to:
# COPY src src
RUN sudo chown -R $USER:$USER $HOME
