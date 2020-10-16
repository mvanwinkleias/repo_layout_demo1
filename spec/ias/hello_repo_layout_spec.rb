#!/usr/bin/ruby

require 'spec_helper'

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
