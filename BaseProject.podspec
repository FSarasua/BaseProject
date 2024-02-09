#
# Be sure to run `pod lib lint BaseProject.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BaseProject'
  s.version          = '1.0.9'
  s.summary          = 'The base of VIPER architecture.'
  s.swift_version    = '5.0'
  
  s.description      = "A long description of BaseProject. A long description of BaseProject."

  s.homepage         = 'https://github.com/FSarasua/BaseProject'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'FSarasua' => 'franciscojavier.sg.trabajo@gmail.com' }
  s.source           = { :git => 'https://github.com/FSarasua/BaseProject.git', :tag => s.version.to_s }

  s.ios.deployment_target = '15.0'

  s.source_files = 'BaseProject/Classes/**/*'
  
end
