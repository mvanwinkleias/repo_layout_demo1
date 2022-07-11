#!/usr/bin/ruby

require 'json'
require 'getoptlong'
require 'pp'

opts = GetoptLong.new(
  [ '--ipam-credentials-file', GetoptLong::OPTIONAL_ARGUMENT ],
)

# pp(opts)

options = {
  'ipam-credentials-file' => File.expand_path('~/.config/IAS/some-awesome-project/ipam_credentials.json')
}

opts.each do |opt, arg|
  case opt
    when '--ipam-credentials-file'
      options['ipam-credentials-file'] = arg
  end
end

data=JSON.parse(File.read(options['ipam-credentials-file']))
print 'Username: ' + data['username'] + "\n"

