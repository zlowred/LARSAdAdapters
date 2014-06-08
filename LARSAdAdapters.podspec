Pod::Spec.new do |s|
  s.name = 'LARSAdAdapters'
  s.version = '1.0.0'
  s.summary = 'Adapters for LARSAdController.'
  s.description = 'Adapters for LARSAdController.'
  s.homepage = 'https://github.com/zlowred/LARSAdAdapters/'
  s.author = {
    'Max Matveev' => 'mail@maxmatveev.com'
  }
  s.source = {
    :git => 'https://github.com/zlowred/LARSAdAdapters.git'
  }
  s.platform = :ios, 5.0
  s.license = 'MIT'
  s.requires_arc = true
  s.frameworks = 'CoreGraphics'

  s.subspec 'InMobi' do |im|
      im.source_files = 'src/InmobiAdAdapter.{h,m}'
      im.dependency 'InMobiSDK'
      im.dependency 'LARSAdController/Core'
      im.weak_frameworks = 'AdSupport', 'Social', 'StoreKit'
      im.frameworks = 'AudioToolbox', 'AVFoundation', 'CoreTelephony', 'MessageUI', 'SystemConfiguration', 'CoreGraphics', 'EventKit', 'EventKitUI', 'Security'
    end

  s.subspec 'RevMob' do |rm|
      rm.source_files = 'src/RevMobAdAdapter.{h,m}'
      rm.dependency 'RevMob'
      rm.dependency 'LARSAdController/Core'
      rm.weak_frameworks = 'AdSupport', 'StoreKit'
      rm.frameworks = 'SystemConfiguration'
    end
end