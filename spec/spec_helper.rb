require "rspec/expectations"
require "appium_lib"
require "rspec"
require "sauce_whisk"

RSpec.configure do | config |

  config.before(:each) do | x |

    caps = {
      caps: {
        appiumVersion: '1.4.11',
        deviceName: "#{ENV['deviceName']}",
        deviceOrientation: 'portrait',
        platformVersion: "#{ENV['platformVersion']}",
        platformName: "iOS",
        app: 'sauce-storage:XMLPerf.app.zip',
        browserName: '',
        name: x.full_description
      }
    }

    def server_url
      "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub"
    end

    @driver = Appium::Driver.new(caps)
    @driver.start_driver
  end

  config.after(:each) do | example |
    sessionid = @driver.session_id
    @driver.driver_quit


    if example.exception
      SauceWhisk::Jobs.fail_job sessionid
    else
      SauceWhisk::Jobs.pass_job sessionid
    end
  end

end
