#
# Be sure to run `pod lib lint WCXPopup.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WCXPopup'
  s.version          = '0.1.02'
  s.summary          = 'This is the core view of a custom pop-up window, which supports animation display and hiding, and supports scene interpretation in four directions: up, down, left, and right.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/marst123/WCXPopup'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'marst123' => 'tianlan2325@qq.com' }
  s.source           = { :git => 'https://github.com/marst123/WCXPopup.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.swift_versions = ['5.0']
  
  s.ios.deployment_target = '13.0'

  s.source_files = 'WCXPopup/Classes/**/*'
  
  # s.resource_bundles = {
  #   'WCXPopup' => ['WCXPopup/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
