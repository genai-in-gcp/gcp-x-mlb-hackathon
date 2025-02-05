# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy the app files to the container
COPY . /app

# Install git and npm
RUN apt-get update && apt-get install -y git-core
# RUN npm install npm@latest -g && \
#     npm install n -g && \
#     n latest
# Install python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose Streamlit's default port
EXPOSE 8501

## Set Streamlit configuration (optional)
#ENV STREAMLIT_SERVER_PORT=8080 \
#    STREAMLIT_SERVER_HEADLESS=true \
#    STREAMLIT_SERVER_ENABLECORS=false

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

# Command to run the Streamlit app
CMD ["streamlit", "run", "app.py"]