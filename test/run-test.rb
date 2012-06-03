#!/usr/bin/env ruby
require "rubygems"
require "bundler"
Bundler.require(:default, :test)

test_file = "./test/test_*.rb"
Dir.glob(test_file) do |file|
  require file
end
