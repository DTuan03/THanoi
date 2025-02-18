# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'THanoi' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for THanoi
  pod 'IQKeyboardManagerSwift'
  pod 'FirebaseStorage'
  pod 'Cosmos'
  pod 'FSCalendar'
  pod 'SwipeCellKit'
  pod 'SwiftLint'
  pod 'DropDown', '2.3.13'
  pod 'Kingfisher'
  pod 'Firebase'
  pod 'FirebaseAuth'
  pod 'Firebase/Firestore'
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      end
    end
  end
end
