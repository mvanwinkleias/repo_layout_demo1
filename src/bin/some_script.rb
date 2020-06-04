#!/usr/bin/ruby

realbin=__FILE__
if File.lstat(realbin).symlink?
	realbin=File.readlink(__FILE__)
end

$:.unshift('/opt/IAS/lib/ruby2')
$:.unshift(File.expand_path('../lib/ruby2/',File.dirname(realbin)))

require 'IAS/HelloRepoLayout'

app = IAS::HelloRepoLayout.new

app.hello()
