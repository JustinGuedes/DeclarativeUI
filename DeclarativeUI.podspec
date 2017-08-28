Pod::Spec.new do |s|
  s.name             = 'DeclarativeUI'
  s.version          = '0.1.0'
  s.summary          = 'A short description of DeclarativeUI.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/JustinGuedes/DeclarativeUI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'JustinGuedes' => 'justin.guedes@gmail.com' }
  s.source           = { :git => 'https://github.com/JustinGuedes/DeclarativeUI.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.frameworks = 'UIKit'
  s.default_subspec = 'Core'

  s.subspec 'All' do |sp|
    sp.source_files = 'DeclarativeUI/Classes/**/*'
  end

  s.subspec 'Core' do |sp|
    sp.source_files = 'DeclarativeUI/Classes/Core/**/*'
  end

  s.subspec 'Binding' do |sp|
    sp.dependency 'DeclarativeUI/Core'
    sp.source_files = 'DeclarativeUI/Classes/Binding/**/*'
  end

  s.subspec 'Validation' do |sp|
    sp.dependency 'DeclarativeUI/Core'
    sp.source_files = 'DeclarativeUI/Classes/Validation/**/*'
  end

end

