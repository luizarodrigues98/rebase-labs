FROM ruby:3.1.3
WORKDIR /rebase_labs
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock
RUN bundle install
COPY . .
EXPOSE 3000

CMD ["/bin/bash"]