def run_tests(deviceName, platformName, platformVersion, app)
  system("deviceName=\"#{deviceName}\" platformName=\"#{platformName}\" platformVersion=\"#{platformVersion}\" app=\"#{app}\" parallel_split_test spec")
end

task :iPhone_6_Device do
  run_tests('iPhone 6 Device', 'iOS', '8.4', 'sauce-storage:TestApp-iphoneos.app.zip')
end

multitask :test_sauce => [
    :iPhone_6_Device
  ] do
    puts 'Running automation'
end

