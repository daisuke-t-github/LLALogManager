
Pod::Spec.new do |s|
s.name         = "LLALogManager"
s.version      = "1.0.8"
s.summary      = "Customizable iOS logger."
s.homepage     = "https://github.com/daisuke-t-jp/LLALogManager"
s.screenshots  = "https://raw.githubusercontent.com/daisuke-t-jp/LLALogManager/master/doc/header.png"
s.license      = "MIT"
s.author       = { "daisuke-t-jp" => "daisuke.t.jp@gmail.com" }
s.ios.deployment_target = "10.0"
s.platform       = :ios, "10.0"
s.swift_version  = "4.2"
s.source       = { :git => "https://github.com/daisuke-t-jp/LLALogManager.git", :tag => "1.0.8" }
s.source_files  = "LLALogManager"
s.source_files  = 'LLALogManager/*.{h,swift}'
end
