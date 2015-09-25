run_all_in_parallel:
	make -j test_iPhone_Simulator_9.0 test_iPhone_6_8.4 test_iPhone_6_Plus_8.0

test_iPhone_Simulator_9.0:
	deviceName="iPhone Simulator" platformVersion=9.0 \
		make parallel_split_test

test_iPhone_6_8.4:
	deviceName="iPhone 6" platformVersion=8.4 \
		make parallel_split_test

test_iPhone_6_Plus_8.0:
	deviceName="iPhone 6 Plus" platformVersion=8.0 \
		make parallel_split_test

parallel_split_test:
	parallel_split_test spec

