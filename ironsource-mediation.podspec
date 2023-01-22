require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "ironsource-mediation"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platforms    = { :ios => "9.0" }
  s.source       = { :git => "https://www.dummy.com.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,m,mm}"

  s.dependency "React"
  s.dependency "IronSourceSDK","7.2.4"
  
  s.subspec "Core" do |ss|
    ss.source_files  = "ios/**/*.{h,m}"
  end
  
  if defined?($RNIronSourceAsStaticFramework)
    Pod::UI.puts "#{s.name}: Using overridden static_framework value of '#{$RNIronSourceAsStaticFramework}'"
    s.static_framework = $RNIronSourceAsStaticFramework
  else
    s.static_framework = false
  end
end
