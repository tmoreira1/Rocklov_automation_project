require "allure-cucumber"
require "capybara"
require "capybara/cucumber"
require "faker"
require 'webdrivers'

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["CONFIG"]}"))

case ENV["BROWSER"]
when "firefox"
    @driver = :selenium
when "chrome"
    @driver = :selenium_chrome
when "fire_headless"
    @driver = :selenium_headless
when "chrome_headless"
    @driver = :selenium_chrome_headless
else
    raise "Navegador invalido :("
end

Capybara.configure do |config|
    config.default_driver = @driver
    config.app_host = CONFIG["url"]
    config.default_max_wait_time = 10
end

AllureCucumber.configure do |config|
    config.results_directory = "/logs"
    config.clean_results_directory = true


end