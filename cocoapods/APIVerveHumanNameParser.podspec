Pod::Spec.new do |s|
  s.name             = 'APIVerveHumanNameParser'
  s.version          = '1.2.3'
  s.summary          = 'Human Name Parser splits full name strings into first, middle, and last names, titles, nicknames, and suffixes.'
  s.description      = <<-'DESC'
Human Name Parser splits full name strings into first, middle, and last names, titles, nicknames, and suffixes. It also generates initials directly from the detected components.

This iOS/macOS SDK provides a convenient way to access the Human Name Parser from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/humannameparser?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/humannameparser-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveHumanNameParser/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
