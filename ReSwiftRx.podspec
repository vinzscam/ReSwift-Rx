Pod::Spec.new do |s|
  s.name             = 'ReSwiftRx'
  s.version          = '1.0.3'
  s.summary          = 'Rx extension for ReSwift\'s Store'
  s.description      = <<-DESC
    ReSwiftRx is an extension for ReSwift that provides a method
    to create an observable sequence of states from a Store.
    DESC

  s.homepage         = 'https://github.com/vinzscam/ReSwift-Rx'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'Vincenzo Scamporlino' => 'vinz.scamporlino@gmail.com' }
  s.source           = { :git => 'https://github.com/vinzscam/ReSwift-Rx.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/vinzscam'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Sources/**/*'

  s.dependency 'ReSwift'
  s.dependency 'RxSwift'
end
