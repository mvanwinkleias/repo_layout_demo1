#!/usr/bin/ruby

# spec files must be named with _spec.rb
realbin=__FILE__
if File.lstat(realbin).symlink?
	realbin=File.readlink(__FILE__)
end

$:.unshift('/opt/IAS/lib/ruby2')
# $:.unshift(File.expand_path('../../src/lib/ruby2/',File.dirname(realbin)))
$:.unshift(File.expand_path('../src/lib/ruby2/',File.dirname(realbin)))
require 'ias/hello_repo_layout'

describe "IAS::HelloRepoLayout" do

	describe ".simple_return" do
		it "returns 1" do
			expect(IAS::HelloRepoLayout.simple_return()).to eq(1)
		end
	end

	describe "It says hello" do
		it "says hello" do
			app = IAS::HelloRepoLayout.new
			app.hello()
		end
	end
end
