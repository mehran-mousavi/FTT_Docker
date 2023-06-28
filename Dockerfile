# Use a base image
FROM ubuntu

# Set the working directory
WORKDIR /app

# Copy the script file to the container
COPY script.sh .

# Set the script as executable
RUN chmod +x script.sh

# Update the package repository and install required packages
RUN apt-get update -y && \
    apt-get install -y unzip wget

# Download and install FakeTlsTunnel
RUN wget "https://github.com/radkesvat/FakeTlsTunnel/releases/download/V11.1/v11.1_linux_amd64.zip" -O v11.1_linux_amd64.zip && \
    unzip -o v11.1_linux_amd64.zip && \
    chmod +x FTT && \
    rm v11.1_linux_amd64.zip

# Set the entrypoint and default command
ENTRYPOINT ["./script.sh"]
