#!/usr/bin/env ruby
require 'net/http'

MINIMUM_RUBY_VERSION    = "2.2.0"
MINIMUM_BUNDLER_VERSION = "1.10.0"
MINIMUM_RVM_VERSION     = "1.1.0"
MINIMUM_RBENV_VERSION   = "0.4.0"
MINIMUM_RAILS_VERSION   = "5.0.0"

# http://stackoverflow.com/questions/11399584/stdin-gets-produces-nil-when-file-is-attained-with-curl-and-piped-to-ruby
tty = STDIN.reopen('/dev/tty')

class Course
  attr_reader :name

  def initialize(name, ruby = nil, bundler = nil, rvm = nil, rbenv = nil, rails = nil)
    @name    = name
    @ruby    = ruby
    @bundler = bundler
    @rvm     = rvm
    @rbenv   = rbenv
    @rails   = rails
  end

  def meets_requirement?
    if name == "Introduction to Programming"
      ruby_version >= @ruby && bundler_version >= @bundler
    else
      ruby_version >= @ruby && bundler_version >= @bundler && (rvm_version >= @rvm || rbenv_version >= @rbenv) && rails_version >= @rails
    end
  end
end

def uri
  if ENV["DEVELOPMENT"]
    URI('http://0.0.0.0:3000/checks')
  else
    URI('http://www.railsbridge-montreal.com/checks')
  end
end

def ruby_version
  RUBY_VERSION
end

def platform_version
  RUBY_PLATFORM
end

def bundler_version
  `bundle -v`.delete("^0-9.")
rescue Errno::ENOENT => e
  "0.0"
end

def rvm_version
  if `rvm -v 2>&1` =~ /command not found/
    "0.0"
  else
    `rvm -v`.delete("^0-9.")
  end
rescue Errno::ENOENT => e
  "0.0"
end

def rbenv_version
  if `rbenv -v 2>&1` =~ /command not found/
    "0.0"
  else
    `rbenv -v`.delete("^0-9.")
  end
rescue Errno::ENOENT => e
  "0.0"
end

def rails_version
  if `rails -v 2>&1` =~ /Could not find/
    "0.0"
  else
    `rails -v`.delete("^0-9.")
  end
rescue Errno::ENOENT => e
  "0.0"
end

def output_course_eligibility
  courses = [
    Course.new("Introduction to Programming", MINIMUM_RUBY_VERSION, MINIMUM_BUNDLER_VERSION),
    Course.new("Introduction to Rails",       MINIMUM_RUBY_VERSION, MINIMUM_BUNDLER_VERSION, MINIMUM_RVM_VERSION, MINIMUM_RBENV_VERSION, MINIMUM_RAILS_VERSION),
    Course.new("Rails for Developers",        MINIMUM_RUBY_VERSION, MINIMUM_BUNDLER_VERSION, MINIMUM_RVM_VERSION, MINIMUM_RBENV_VERSION, MINIMUM_RAILS_VERSION),
  ]

  courses.each do |course|
    puts "#{course.name}: #{course.meets_requirement? ? 'OK' : 'Missing something'}"
  end
end

def send_data_to_server
  puts "What is your email address?"
  email = $stdin.gets.chomp

  params = {
    "check[email]"         => email,
    "check[ruby_version]"  => ruby_version,
    "check[ruby_platform]" => platform_version,
  }

  response = Net::HTTP.post_form(uri, params)
  puts response.message
end

output_course_eligibility
send_data_to_server

tty.close
