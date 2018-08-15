import time
from selenium import webdriver
import credentials as cred

if not cred.chrome_driver:
	browser = webdriver.Chrome()
else:
	browser = webdriver.Chrome(cred.chrome_driver)

browser.get(cred.login_url)
time.sleep(4)  # give chrome some time to load

# select html elements
email_field = browser.find_element_by_id('email')
pass_field = browser.find_element_by_id('password')
submit_button = browser.find_element_by_id('submit-button')

# input email/pass and login
email_field.send_keys(cred.email)
pass_field.send_keys(cred.pword)
submit_button.click()

# you know have your login for the day
time.sleep(3)
browser.quit()
