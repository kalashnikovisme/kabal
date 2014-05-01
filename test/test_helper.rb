require 'bundler/setup'
require 'coveralls'
Coveralls.wear!

Bundler.require

MiniTest::Unit.autorun

class TestCase < MiniTest::Unit::TestCase
end
