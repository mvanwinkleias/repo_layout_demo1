require 'pp'

# Put this in the root of your project, and
# build it like you would a regular gem.

executables = Dir['src/bin/*.rb']
executables.each do | e |
	e.gsub!(/^src\/bin\//, '')
end


Gem::Specification.new do |s|
  s.name        = 'repo-layout-demo1'
  s.version     = '0.0.0'
  s.date        = '2020-09-21'
  s.summary     = "Summary"
  s.description = "Description"
  s.authors     = ["SomeAuthor"]
  s.email       = 'someemail@example.com'
  s.bindir      = 'src/bin'
  s.files       = Dir['src/lib/ruby2/**/*']
  s.require_paths = ['src/lib/ruby2']
  s.executables = executables
  s.homepage    =
    'https://example.com/SomeGem'
  s.license       = 'GPL-3.0'
end
