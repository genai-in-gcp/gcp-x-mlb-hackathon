## Use an official node runtime as a parent image
#FROM node:18-alpine

## Use an official Python runtime as a parent image
#FROM python:3.10-slim

FROM ubuntu:22.04

# Set the working directory
WORKDIR /app

# Copy the app files to the container
COPY . /app

# Install nodejs
RUN apt-get update && apt-get install -y wget build-essential && apt-get clean
RUN mkdir -p /node
RUN wget https://nodejs.org/dist/v20.13.1/node-v20.13.1-linux-x64.tar.xz \
    && mkdir -p /node && tar -xf node-v20.13.1-linux-x64.tar.xz -C /node \
    && chmod +x -R /node/node-v20.13.1-linux-x64
ENV PATH="/node/node-v20.13.1-linux-x64/bin:${PATH}"
RUN rm node-v20.13.1-linux-x64.tar.xz

# Install chrome driver
RUN apt-get update \
 && apt-get install -y wget \
 && wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
 && apt-get install -y ./google-chrome-stable_current_amd64.deb

RUN rm google-chrome-stable_current_amd64.deb

## Install nodejs (and git)
#RUN apt-get install -y git-core curl build-essential openssl libssl-dev \
#noe && git clone https://github.com/nodejs/node.git \
# && cd node \
# && ./configure \
# && make \
# && sudo make install

# Install git and python3
RUN apt-get update \
 && apt-get install -y git-core python3 python3-pip

# Install python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install nodejs dependencies
RUN cd ./tiktok_uploader/tiktok-signature && npm install

# Expose Streamlit's default port
EXPOSE 8501

## Set Streamlit configuration (optional)
#ENV STREAMLIT_SERVER_PORT=8080 \
#    STREAMLIT_SERVER_HEADLESS=true \
#    STREAMLIT_SERVER_ENABLECORS=false

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

# Command to run the Streamlit app
CMD ["streamlit", "run", "app.py"]