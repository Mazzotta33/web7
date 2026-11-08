ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.
# Bootsnap's native file access fails on non-ASCII paths in Windows.
require "bootsnap/setup" unless Gem.win_platform? && !__dir__.ascii_only?
