Pod::Spec.new do |spec|

  spec.name         = "DSTextView"
  spec.version      = "1.0.0"
  spec.summary      = "DSTextView to get rid of placeholder and its color issue of UITextView of UIKit in swift 5.1."
  spec.description  = "DSTextView to get rid of placeholder and its color issue of UITextView of UIKit in swift 5.1. It Will help a lot."
  spec.homepage     = "https://github.com/dsinha999/DSTextView"
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author             = { "Dharmendra Sinha" => "dsinha6193@gmail.com" }
  spec.platform     = :ios, "12.0"
  spec.source       = { :git => "https://github.com/dsinha999/DSTextView.git", :tag => "1.0.0" }
  spec.source_files  = "DSTextView/**/*.{h,m,swift}"
  spec.swift_version     = '5.0'


 spec.screenshots  = "https://github.com/dsinha999/DSTextView/blob/master/screenshot.jpg?raw=true"


end
