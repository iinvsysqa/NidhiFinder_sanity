from robot.libraries.BuiltIn import BuiltIn

class LoanLibraries:
     def __init__(self):
        self.selenium = BuiltIn().get_library_instance("SeleniumLibrary")

     def get_element_location(self, locator):
        element = self.selenium.find_element(locator)
        location = element.location
        return location
    
    # from selenium.webdriver.common.by import By
# from selenium.webdriver.common.action_chains import ActionChains
# import time


# class LoanLibrary:
#     def __init__(self):
#         self.driver = None

#     def set_driver(self, driver):
#         self.driver = driver

#     def scroll_to_element(self, element):
#         self.driver.execute_script("arguments[0].scrollIntoView(true);", element)
#         time.sleep(1)

#     def enter_value(self, element, fieldname, value):
#         try:
#             element.clear()
#             element.send_keys(value)
#             print(f"{fieldname} field is entered with value: {value}")
#         except Exception as e:
#             print(f"Failed to enter value in {fieldname}: {str(e)}")

#     def set_slider_to_value(self, target_value, slider_track, slider_thumb, label, min_val, max_val):
#         if not (min_val <= target_value <= max_val):
#             raise ValueError("Target value must be within range.")

#         track_width = slider_track.size['width']
#         value_range = max_val - min_val
#         pixels_per_unit = track_width / value_range

#         current_value = float(label.text.replace("%", "").replace(",", "").strip())
#         x_offset = round((target_value - current_value) * pixels_per_unit)

#         actions = ActionChains(self.driver)
#         actions.click_and_hold(slider_thumb).move_by_offset(x_offset, 0).release().perform()
#         time.sleep(1)

#     def verify_text_contains(self, element, expected_text, field):
#         actual = element.text.strip()
#         print("Text in website:", actual)
#         if expected_text in actual:
#             print(f"{field} contains {expected_text}")
#         else:
#             print(f"{field} did not contain: {expected_text}")



# from selenium.webdriver.common.by import By
# from selenium.webdriver.common.action_chains import ActionChains
# import time

# class LoanLibraries:
#      def __init__(self):
#         self.driver = None
        
#      def set_driver(self, selenium_lib):
#     #    """Sets the WebDriver instance"""
#         self.driver = selenium_lib.driver
#         return True

#      def scroll_to_element(self, element):
#         """Scroll to the specified element"""
#         self.driver.execute_script("arguments[0].scrollIntoView(true);", element)
#         time.sleep(1)

#      def enter_value(self, element, fieldname, value):
#         """Enter value into a field"""
#         try:
#             element.clear()
#             element.send_keys(value)
#             print(f"{fieldname} field is entered with value: {value}")
#             return True
#         except Exception as e:
#             print(f"Failed to enter value in {fieldname}: {str(e)}")
#             return False

#      def set_slider_to_value(self, target_value, slider_track, slider_thumb, label, min_val, max_val):
#         """Set slider to specific value"""
#         if not (min_val <= float(target_value) <= max_val):
#             raise ValueError(f"Target value must be between {min_val} and {max_val}")

#         track_width = slider_track.size['width']
#         value_range = max_val - min_val
#         pixels_per_unit = track_width / value_range

#         current_value = float(label.text.replace("%", "").replace(",", "").strip())
#         x_offset = round((float(target_value) - current_value) * pixels_per_unit)

#         actions = ActionChains(self.driver)
#         actions.click_and_hold(slider_thumb).move_by_offset(x_offset, 0).release().perform()
#         time.sleep(1)
#         return True

#      def verify_text_contains(self, element, expected_text, field):
#         """Verify element contains expected text"""
#         actual = element.text.strip()
#         print(f"Verifying {field}: Expected '{expected_text}' in '{actual}'")
#         if expected_text in actual:
#             print(f"{field} contains {expected_text}")
#             return True
#         else:
#             print(f"{field} did not contain: {expected_text}")
#             return False
        








# from selenium.webdriver.common.action_chains import ActionChains
# import time
# from robot.libraries.BuiltIn import BuiltIn

# class LoanLibraries:
#         def __init__(self):
#             self.driver = None
            
#         def set_driver(self, selenium_lib):
#             """Sets the WebDriver instance from SeleniumLibrary"""
#             self.driver = selenium_lib.driver
#             return True

#         def scroll_to_element(self, element):
#             """Scroll to the specified element"""
#             self.driver.execute_script("arguments[0].scrollIntoView({behavior: 'smooth', block: 'center'});", element)
#             time.sleep(0.5)
#             return True

#         def enter_value(self, element, fieldname, value):
#             """Enter value into a field with better error handling"""
#             try:
#                 self.driver.execute_script("arguments[0].value = '';", element)  # More reliable clear
#                 element.send_keys(str(value))
#                 BuiltIn().log(f"Entered value '{value}' in field '{fieldname}'")
#                 return True
#             except Exception as e:
#                 BuiltIn().log(f"Failed to enter value in {fieldname}: {str(e)}", level='WARN')
#                 return False

#         def set_slider_to_value(self, target_value, slider_track, slider_thumb, label, min_val, max_val):
#             """Set slider to specific value with improved accuracy"""
#             try:
#                 target = float(target_value)
#                 # target = target_value
#                 if not (min_val <= target <= max_val):
#                     raise ValueError(f"Target value must be between {min_val} and {max_val}")

#                 # Get current value more reliably
#                 current_text = label.text.replace("%", "").replace(",", "").strip()
#                 current_value = float(current_text) if current_text else min_val

#                 # Calculate pixel offset more precisely
#                 track_rect = slider_track.rect
#                 thumb_rect = slider_thumb.rect
#                 usable_width = track_rect['width'] - thumb_rect['width']
#                 pixels_per_unit = usable_width / (max_val - min_val)
#                 x_offset = int((target - current_value) * pixels_per_unit)

#                 # More reliable slider movement
#                 actions = ActionChains(self.driver)
#                 (actions.click_and_hold(slider_thumb)
#                     .move_by_offset(x_offset, 0)
#                     .release()
#                     .perform())
                
#                 time.sleep(0.5)  # Reduced wait time
#                 return True
                
#             except Exception as e:
#                 BuiltIn().log(f"Slider movement failed: {str(e)}", level='WARN')
#                 return False

#         def verify_text_contains(self, element, expected_text, field=""):
#             """More robust text verification"""
#             try:
#                 actual = element.text.strip()
#                 result = expected_text in actual
#                 BuiltIn().log(f"Text verification for '{field}': Expected '{expected_text}' in '{actual}' - {'PASS' if result else 'FAIL'}")
#                 return result
#             except Exception as e:
#                 BuiltIn().log(f"Text verification failed: {str(e)}", level='WARN')
#                 return False

# resources/CustomKeywords.py
