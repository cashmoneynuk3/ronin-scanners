# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ronin-scanners}
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Postmodern"]
  s.date = %q{2010-02-11}
  s.default_executable = %q{ronin-scanners}
  s.description = %q{Ronin Scanners is a Ruby library for Ronin that provides Ruby interfaces to various third-party security scanners.}
  s.email = %q{postmodern.mod3@gmail.com}
  s.executables = ["ronin-scanners"]
  s.extra_rdoc_files = [
    "ChangeLog.md",
    "README.md"
  ]
  s.files = [
    ".gitignore",
    ".specopts",
    ".yardopts",
    "COPYING.txt",
    "ChangeLog.md",
    "README.md",
    "Rakefile",
    "bin/ronin-scanners",
    "lib/ronin/scanners.rb",
    "lib/ronin/scanners/nikto.rb",
    "lib/ronin/scanners/nmap.rb",
    "lib/ronin/scanners/version.rb",
    "spec/helpers/database.rb",
    "spec/scanners_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.has_rdoc = %q{yard}
  s.homepage = %q{http://github.com/ronin-ruby/ronin-scanners}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A Ruby library for Ronin that provides Ruby interfaces to various third-party security scanners.}
  s.test_files = [
    "spec/scanners_spec.rb",
    "spec/spec_helper.rb",
    "spec/helpers/database.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ruby-nmap>, [">= 0.1.0"])
      s.add_runtime_dependency(%q<ruby-nikto>, [">= 0.1.0"])
      s.add_runtime_dependency(%q<ronin>, [">= 0.4.0"])
      s.add_development_dependency(%q<rspec>, [">= 1.3.0"])
      s.add_development_dependency(%q<yard>, [">= 0.5.3"])
    else
      s.add_dependency(%q<ruby-nmap>, [">= 0.1.0"])
      s.add_dependency(%q<ruby-nikto>, [">= 0.1.0"])
      s.add_dependency(%q<ronin>, [">= 0.4.0"])
      s.add_dependency(%q<rspec>, [">= 1.3.0"])
      s.add_dependency(%q<yard>, [">= 0.5.3"])
    end
  else
    s.add_dependency(%q<ruby-nmap>, [">= 0.1.0"])
    s.add_dependency(%q<ruby-nikto>, [">= 0.1.0"])
    s.add_dependency(%q<ronin>, [">= 0.4.0"])
    s.add_dependency(%q<rspec>, [">= 1.3.0"])
    s.add_dependency(%q<yard>, [">= 0.5.3"])
  end
end

