require "./lib/attr_slug/version"

Gem::Specification.new do |gem|
  gem.name        = "attr_slug"
  gem.version     = AttrSlug::Version::Compact
  gem.summary     = AttrSlug::Version::Summary
  gem.description = AttrSlug::Version::Description
  gem.authors     = AttrSlug::Version::Author
  gem.email       = AttrSlug::Version::Email
  gem.homepage    = AttrSlug::Version::Homepage
  gem.license     = AttrSlug::Version::License
  gem.metadata    = AttrSlug::Version::Metadata
  gem.platform    = Gem::Platform::RUBY

  gem.required_ruby_version = '>= 2.3'
  gem.require_paths = ["lib"]
  gem.files = Dir[
    "{lib}/**/*",
    "MIT-LICENSE",
    "CHANGELOG.md",
    "README.md"
  ]

  gem.add_runtime_dependency 'activerecord', '>= 5.1.4'
  gem.add_runtime_dependency 'activesupport', '>= 5.1.4'
end
