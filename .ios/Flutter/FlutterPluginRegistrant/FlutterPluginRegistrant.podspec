#
# Generated file, do not edit.
#

Pod::Spec.new do |s|
  s.name             = 'FlutterPluginRegistrant'
  s.version          = '0.0.1'
  s.summary          = 'Registers plugins with your Flutter app'
  s.description      = <<-DESC
Depends on all your plugins, and provides a function to register them.
                       DESC
  s.homepage         = 'https://flutter.dev'
  s.license          = { :type => 'BSD' }
  s.author           = { 'Flutter Dev Team' => 'flutter-dev@googlegroups.com' }
  s.ios.deployment_target = '13.0'
  s.source_files =  "Classes", "Classes/**/*.{h,m}"
  s.source           = { :path => '.' }
  s.public_header_files = './Classes/**/*.h'
  s.static_framework    = true
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.dependency 'Flutter'
  s.dependency 'audioplayers_darwin'
  s.dependency 'camera_avfoundation'
  s.dependency 'connectivity_plus'
  s.dependency 'device_info_plus'
  s.dependency 'flutter_core'
  s.dependency 'flutter_gl'
  s.dependency 'flutter_localization'
  s.dependency 'flutter_ui_base'
  s.dependency 'home_widget'
  s.dependency 'my_graphs'
  s.dependency 'my_localizations'
  s.dependency 'my_logger_metrics'
  s.dependency 'my_theme_style'
  s.dependency 'package_info_plus'
  s.dependency 'path_provider_foundation'
  s.dependency 'permission_handler_apple'
  s.dependency 'pointer_interceptor_ios'
  s.dependency 'shared_preferences_foundation'
  s.dependency 'speech_to_text'
  s.dependency 'url_launcher_ios'
  s.dependency 'webview_flutter_wkwebview'
end
