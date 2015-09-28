JUNIT_DIR?=junit_reports
FEATURES_DIR?=features

run_all_in_parallel:
	make -j test_iphone6_8.0_real_device test_iphone6_8.4_simulator

test_iphone6_8.0_real_device:
	deviceName='iPhone 6 Device' platformVersion='8.0' platformName=iOS \
		app='sauce-storage:TestApp-iphoneos.app.zip' \
		make parallel_split_test

test_iphone6_8.4_simulator:
	deviceName='iPhone 6' platformVersion='8.4' platformName=iOS \
		app='https://s3.amazonaws.com/appium/TestApp8.4.app.zip' \
		make parallel_split_test

parallel_split_test:
	parallel_split_test spec

