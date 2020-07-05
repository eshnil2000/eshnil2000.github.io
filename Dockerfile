#docker run -it -p4000:4000 -v "$PWD":/usr/src/app jekyll-now:latest
FROM ruby:latest
#Install pre-reqs
RUN gem install github-pages

# throw errors if Gemfile has been modified since Gemfile.lock
#RUN bundle config --global frozen 1
#Change working directory
WORKDIR /usr/src/app
#Expose port
EXPOSE 4000
#Serve the static blog/ web page using jekyll
ENTRYPOINT [ "jekyll", "serve" ]
#expose the server on the host externally via IP 0.0.0.0
CMD [ "bundle", "exec", "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000" ]

