#!/usr/bin/env ruby

require 'erb'

if !ARGV[0]
	puts "Usage: #{File.basename(__FILE__)} classname"
	exit
end

GENERATOR_PATH="/Users/tsanzey/generator/"

classname = ARGV[0]

cpp_template = File.open(GENERATOR_PATH + "class_cpp.erb", "r")
hpp_template = File.open(GENERATOR_PATH + "class_hpp.erb", "r")

cpp_erb = ERB.new(cpp_template.read)
hpp_erb = ERB.new(hpp_template.read)

cpp_template.close
hpp_template.close

File.new(Dir.pwd + "/" + classname + ".cpp", "w").puts(cpp_erb.result())
File.new(Dir.pwd + "/" + classname + ".hpp", "w").puts(hpp_erb.result())
