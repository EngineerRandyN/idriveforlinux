FROM --platform=linux/arm64/v8 ubuntu:latest

# Update, upgrade, and install dependencies.
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl cron libexpat1 expect vim

# Add missing libssl dependency.
ADD http://ports.ubuntu.com/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_arm64.deb /tmp/
RUN dpkg -i /tmp/libssl1.1_1.1.1f-1ubuntu2_arm64.deb

# Download idriveforlinux.bin file.
ADD https://www.idrivedownloads.com/downloads/linux/download-for-linux/linux-bin/idriveforlinux.bin /tmp/
RUN chmod a+x /tmp/idriveforlinux.bin

# Copy expect script for use in setup of the install.
COPY script.exp script.exp
RUN chmod a+x script.exp

# Entrypoint into entrypoint script.
COPY entrypoint.sh entrypoint.sh
RUN chmod a+x entrypoint.sh
ENTRYPOINT ["/bin/bash", "-c", "./entrypoint.sh"]