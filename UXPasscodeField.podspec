#
# Be sure to run `pod lib lint UXPasscodeField.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UXPasscodeField'
  s.version          = '1.2.1'
  s.summary          = 'UXPasscodeField is an input control for numeric code'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
UXPasscodeField is designed for inputting numeric values. It can be used for inputting passcode, PIN, SMS-verification, etc.
                       DESC

  s.homepage         = 'https://github.com/eddy-lau/UXPasscodeField'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Eddie Lau' => 'eddie@touchutility.com' }
  s.source           = { :git => 'https://github.com/eddy-lau/UXPasscodeField.git', :tag => s.version.to_s }
  s.resource_bundle = { 'UXPasscodeField' => 'UXPasscodeField/Resources/*' }


  s.ios.deployment_target = '8.0'
  s.source_files = 'UXPasscodeField/Classes/**/*'

end
