
Pod::Spec.new do |s|
s.name             = 'DDFeedback'
s.version          = '1.0.8'
s.summary          = 'DDFeedback 基于RxSwift和RxCocoa'

s.description      = <<-DESC
基于RxSwift和RxCocoa，在RxFeedback的基础上根据使用习惯改变的
DESC

s.homepage         = 'https://github.com/DDKit/DDFeedback'
# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'DuanChangHe' => 'duanchanghe@gmail.com' }
s.source           = { :git => 'https://github.com/DDKit/DDFeedback.git', :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

s.ios.deployment_target = '9.0'
s.source_files = 'DDFeedback/Classes/**/*'
s.swift_version = '5'


# s.resource_bundles = {
#   'DDFeedback' => ['DDFeedback/Assets/*.png']
# }

# s.public_header_files = 'Pod/Classes/**/*.h'
# s.frameworks = 'UIKit', 'MapKit'
s.dependency 'RxDataSources', '~> 4.0'

end

# pod trunk push DDFeedback.podspec --allow-warnings
