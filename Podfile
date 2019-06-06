source 'https://cdn.jsdelivr.net/cocoa/'
platform :ios, '12.0'
use_frameworks!

workspace 'ios_github_client'

project 'GithubMain/GithubMain.xcodeproj'
project 'GithubCommon/GithubCommon.xcodeproj'

def tool_pods
  pod 'SwiftGen',  '~> 6.0.1' # https://github.com/SwiftGen/SwiftGen/blob/master/CHANGELOG.md
end

target 'GithubMain' do
  project 'GithubMain/GithubMain.xcodeproj'
  tool_pods
end

target 'GithubCommon' do
  project 'GithubCommon/GithubCommon.xcodeproj'
end
target 'GithubCommonTests' do
  project 'GithubCommon/GithubCommon.xcodeproj'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |configuration|
      configuration.build_settings['SWIFT_VERSION'] = "5.0"
    end
  end
end
