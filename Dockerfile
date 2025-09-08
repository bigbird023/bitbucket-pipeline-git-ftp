# Use the Atlassian default image as the base image
FROM atlassian/default-image:2

# Set non-interactive mode for apt-get to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install git-ftp
RUN apt-get update && \
    apt-get -qq install --no-install-recommends git-ftp && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set a default working directory (optional, adjust as needed)
WORKDIR /workspace

# Add metadata to the image
LABEL maintainer="Craig Benner <bigbird023@gmail.com>" \
      description="Custom Docker image based on atlassian/default-image:2 with git-ftp installed"

# Default command (optional, adjust as needed)
CMD ["/bin/bash"]