JUNIT_DIR?=junit_reports
FEATURES_DIR?=features

run_all_in_parallel:
	make -j test_iphone6_8.4_simulator test_iphone5_8.4_simulator

test_iphone6_8.4_simulator:
	deviceName='iPhone 6' platformVersion='8.4' platformName=iOS \
		app='https://s3.amazonaws.com/appium/TestApp8.4.app.zip' \
		make parallel_split_test

test_iphone5_8.4_simulator:
	deviceName='iPhone 5' platformVersion='8.4' platformName=iOS \
		app='https://s3.amazonaws.com/appium/TestApp8.4.app.zip' \
		make parallel_split_test

parallel_split_test:
	parallel_split_test spec

