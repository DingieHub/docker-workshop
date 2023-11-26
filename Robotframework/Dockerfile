# Use an official Python runtime as a parent image
FROM python:3.8

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Run a robot test when the container launches
# Examples:
# CMD ["robot", "--outputdir", "/tmp/reports", "/tmp/pun.robot"]
# CMD ["robot", "--outputdir", "/tmp/reports", "-t", "Get Pun By ID", "/tmp/pun.robot"]
CMD ["robot", "postcode_test.robot"]
