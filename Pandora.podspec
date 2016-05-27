Pod::Spec.new do |s|
  s.name = "Pandora"
  s.version = "0.1.0"
  s.summary = "Once you start using it you will never go back."
  s.description = <<-DESC
                    A collection of useful tools around iOS, tvOS or watchOS apps.
                  DESC
  s.homepage = "https://github.com/floriankrueger/Pandora"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { "Florian Krüger" => "florian.krueger@projectserver.org" }
  s.source = { :git => "https://github.com/floriankrueger/Pandora.git", :tag => s.version }

  s.ios.deployment_target = "8.4"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"

  s.requires_arc = true

  s.source_files = "Sources/**/*.{h,swift}"
end
