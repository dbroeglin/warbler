# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{warbler}
  s.version = "1.3.0.beta1"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nick Sieger"]
  s.date = %q{2010-11-11}
  s.default_executable = %q{warble}
  s.description = %q{Warbler is a gem to make a Java jar or war file out of any Ruby,
Rails, Merb, or Rack application. Warbler provides a minimal,
flexible, Ruby-like way to bundle up all of your application files for
deployment to a Java environment.}
  s.email = %q{nick@nicksieger.com}
  s.executables = ["warble"]
  s.extra_rdoc_files = ["History.txt", "LICENSE.txt", "Manifest.txt", "README.txt"]
  s.files = ["Gemfile", "History.txt", "LICENSE.txt", "Manifest.txt", "README.txt", "Rakefile", "bin/warble", "ext/CipangoMain.java", "ext/Main.java", "ext/WarblerWar.java", "ext/WarblerWarService.java", "lib/warbler.rb", "lib/warbler/application.rb", "lib/warbler/config.rb", "lib/warbler/gems.rb", "lib/warbler/task.rb", "lib/warbler/templates/config.erb", "lib/warbler/templates/rack.erb", "lib/warbler/templates/rails.erb", "lib/warbler/version.rb", "lib/warbler/war.rb", "lib/warbler_war.jar", "spec/sample/app/controllers/application.rb", "spec/sample/app/helpers/application_helper.rb", "spec/sample/config/boot.rb", "spec/sample/config/database.yml", "spec/sample/config/environment.rb", "spec/sample/config/environments/development.rb", "spec/sample/config/environments/production.rb", "spec/sample/config/environments/test.rb", "spec/sample/config/initializers/inflections.rb", "spec/sample/config/initializers/mime_types.rb", "spec/sample/config/initializers/new_rails_defaults.rb", "spec/sample/config/routes.rb", "spec/sample/lib/tasks/utils.rake", "spec/sample/public/404.html", "spec/sample/public/422.html", "spec/sample/public/500.html", "spec/sample/public/favicon.ico", "spec/sample/public/index.html", "spec/sample/public/robots.txt", "spec/spec_helper.rb", "spec/warbler/application_spec.rb", "spec/warbler/config_spec.rb", "spec/warbler/gems_spec.rb", "spec/warbler/task_spec.rb", "spec/warbler/war_spec.rb", "warble.rb", "web.xml.erb"]
  s.homepage = %q{http://caldersphere.rubyforge.org/warbler}
  s.rdoc_options = ["--main", "README.txt", "-SHN", "-f", "darkfish"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{caldersphere}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Warbler chirpily constructs .war files of your Rails applications.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>, [">= 0.8.7"])
      s.add_runtime_dependency(%q<jruby-jars>, [">= 1.4.0"])
      s.add_runtime_dependency(%q<jruby-rack>, [">= 1.0.0"])
      s.add_runtime_dependency(%q<rubyzip>, [">= 0.9.4"])
      s.add_development_dependency(%q<rubyforge>, [">= 2.0.4"])
    else
      s.add_dependency(%q<rake>, [">= 0.8.7"])
      s.add_dependency(%q<jruby-jars>, [">= 1.4.0"])
      s.add_dependency(%q<jruby-rack>, [">= 1.0.0"])
      s.add_dependency(%q<rubyzip>, [">= 0.9.4"])
      s.add_dependency(%q<rubyforge>, [">= 2.0.4"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0.8.7"])
    s.add_dependency(%q<jruby-jars>, [">= 1.4.0"])
    s.add_dependency(%q<jruby-rack>, [">= 1.0.0"])
    s.add_dependency(%q<rubyzip>, [">= 0.9.4"])
    s.add_dependency(%q<rubyforge>, [">= 2.0.4"])
  end
end
