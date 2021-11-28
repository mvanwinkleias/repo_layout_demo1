#!/usr/bin/ruby

realbin = __FILE__
if File.lstat(realbin).symlink?
  realbin = File.readlink(__FILE__)
end

$LOAD_PATH.unshift('/opt/IAS/lib/ruby2')
$LOAD_PATH.unshift(File.expand_path('../lib/ruby2/', File.dirname(realbin)))

require 'ias/hello_repo_layout'

app = IAS::HelloRepoLayout.new

app.hello
