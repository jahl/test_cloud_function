# Use the official Ruby image from the Docker Hub
FROM ruby:2.7

# Install the Google Cloud SDK
RUN apt-get update -y && apt-get install -y curl
RUN curl -sSL https://sdk.cloud.google.com | bash
ENV PATH $PATH:/root/google-cloud-sdk/bin

# Create a directory for your application code and set it as the working directory
RUN mkdir /app
WORKDIR /app

# Copy the Gemfile and Gemfile.lock from your local machine to the Docker image
COPY Gemfile Gemfile.lock ./

# Install the Ruby Gems
RUN bundle install

# Copy the rest of your application code to the Docker image
COPY . .

# Define the command that should be run when the Docker container starts up
CMD ["bundle", "exec", "functions-framework-ruby", "--target",  "delete_images"]
