platform :ios, '13.0'

use_frameworks!
inhibit_all_warnings!

target 'Hermes' do
  
  pod 'LookinServer', :configurations => ['Debug']

  post_install do |installer|
      installer.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
          end
      end
  end
end
