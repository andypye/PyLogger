#
# Be sure to run `pod lib lint PyLogger.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PyLogger'
  s.version          = '0.1.0'
  s.summary          = 'Simple logging in Swift'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
PyLogger is will give you simple swift logging to the console with the option to log out to 3rd party frameworks. Firebase Crashlytics is included in the initial verison.
                       DESC

  s.homepage         = 'https://github.com/andypye/PyLogger'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'andypye' => 'apye@pyrotechnic-apps.com' }
  s.source           = { :git => 'https://github.com/andypye/PyLogger.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '16.0'

  s.source_files = 'PyLogger/Classes/**/*'
  
  # s.resource_bundles = {
  #   'PyLogger' => ['PyLogger/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
