Pod::Spec.new do |s|
s.name         = "LLALogManager"
s.version      = "1.0.11"
s.summary      = "Customizable iOS logger."
s.homepage     = "https://github.com/daisuke-t-jp/LLALogManager"
s.screenshots  = "https://raw.githubusercontent.com/daisuke-t-jp/LLALogManager/master/doc/header.png"
s.license      = "MIT"
s.author       = { "daisuke-t-jp" => "daisuke.t.jp@gmail.com" }

s.requires_arc = true
s.swift_version  = "4.2"
s.ios.deployment_target = "10.0"

s.source       = { :git => "https://github.com/daisuke-t-jp/LLALogManager.git", :tag => s.version }
s.source_files  = 'LLALogManager/LLALogManager/*.{h,swift}'
end
