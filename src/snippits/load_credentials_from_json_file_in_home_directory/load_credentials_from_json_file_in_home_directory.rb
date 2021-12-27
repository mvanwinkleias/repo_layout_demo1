#!/usr/bin/ruby

require 'json'

data=JSON.parse(
  File.read(
    ENV['HOME'] \
    + '/.config/IAS/some-awesome-project/ipam_credentials.json'
  )
)

print 'Username: ' + data['username'] + "\n"

