require 'opal'

desc "Build our app to build.js"
task :build do
  Opal.append_path "app"
  File.binwrite "javascripts/build.js", Opal::Builder.build("application").to_s
end