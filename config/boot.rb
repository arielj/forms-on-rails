ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

# $next_rails = File.basename(ENV["BUNDLE_GEMFILE"]) == "Gemfile.next"

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.
