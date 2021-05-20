FROM ruby:3.0.0


RUN apt-get update && apt-get install -qq -y --no-install-recommends \
  build-essential nodejs libpq-dev imagemagick zlib1g-dev apt-utils \
  libmagickwand-dev libmagickcore-dev vim

ENV INSTALL_PATH /workspace/rails_app/builtcode_test

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

ENV BUNDLE_PATH /workspace/rails_app/builtcode_test/box

ADD Gemfile /workspace/rails_app/builtcode_test/Gemfile
ADD Gemfile.lock /workspace/rails_app/builtcode_test/Gemfile.lock

COPY Gemfile ./
RUN bundle install

COPY . .

# EXPOSE 3000
#
# CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
