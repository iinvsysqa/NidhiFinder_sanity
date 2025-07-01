# keywords/WebKeywords.py
# from drivers.WebDriverManager import WebDriverManager
# from selenium.webdriver.common.by import By
# from selenium.webdriver.common.action_chains import ActionChains

# class WebKeywords:
#     def __init__(self):
#         self.driver = WebDriverManager.get_driver()

#     def click_element(self, locator_type, locator):
#         self.driver.find_element(getattr(By, locator_type.upper())).click()

#     def enter_text(self, locator_type, locator, text):
#         self.driver.find_element(getattr(By, locator_type.upper()), locator).send_keys(text)

#     def clear_text(self, locator_type, locator):
#         self.driver.find_element(getattr(By, locator_type.upper()), locator).clear()

#     def is_displayed(self, locator_type, locator):
#         return self.driver.find_element(getattr(By, locator_type.upper()), locator).is_displayed()

#     def scroll_to_element(self, locator_type, locator):
#         element = self.driver.find_element(getattr(By, locator_type.upper()), locator)
#         self.driver.execute_script("arguments[0].scrollIntoView(true);", element)


# from selenium.webdriver.common.by import By
import random
# class LoginPage:
#     def __init__(self, driver):
#         self.driver = driver

#     def enter_username(self, username):
#         self.driver.find_element(By.ID, "username").send_keys(username)

#     def enter_password(self, password):
#         self.driver.find_element(By.ID, "password").send_keys(password)

#     def click_login(self):
#         self.driver.find_element(By.ID, "loginButton").click()     

class Homepage:

   def random_phone_number(self):
    # Generates between 2000000000 and 9999999999
     return  str(random.randint(8888888888, 9999999999))
