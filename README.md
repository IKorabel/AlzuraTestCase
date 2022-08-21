# About App
My task was to develop a mobile app. with authentication and a list of orders with the ability to sort them in different ways.

## User stories
  - The courier uses the app to figure out what items he needs to deliver today
  - The accountant opens the app in order to find out how much it costs to buy the goods and further resell them
  - The customer opens an App in order to find a goods, which he interested in

## Used Libraries in a project 
   - ### **Locksmith**. 
        User-friendly wrapper over Keychain. In order not to spend a lot of time writing code to work with Keychain, I decided to use this library
   - ### **SkyfloatingLabelTextField**.
     Since for me a beautiful and user-friendly design in any project is a priority, I decided to use these textfields

## How long did it take?
Approximately 1,5 days

# Progress of development

   ## 1.  Login Screen
   
   ### Functionality
   - Sign in and sign up in order to get an access to list of orders
  
  ### Features
   - Well-designed textfields, watching then how well you fill them out
   - Buttons are available only when all filled text fields follow the minimum rules 
   - Storing user data in the **Keychain** database in encrypted form
   - Simple system Alerts in case something went wrong
   
   ### Development features
   - The interface was built entirely programmatically using NSAnchors
   - Open-source library SkyfloatingLabelTextField was used in order to make the nicest textfields
   
   ### What I would prefer to fix/add/replace
   - Replace system alerts to more convenient and nice native style alerts from GitHub
   - Add Notification toasts 
   - Make a code refactoring in order to split View Controller into modules
   - Add animation during Alpha of button changes
   
   ### How many time this screen took?
   - Approximately 5 hours 
   
   ## 2.  Orders Screen
   
   ### Functionality
   - All orders are available in one place 
   - Every order cell contains information about price, date, id , paymentmethod of order
   - User can sort orders in ascending or descending order
   - User can find needed order through search by ID
   - User has an opportunity to sign out
   
   ### Development features
   - The interface has been built partially programmatically with NSAnchors (views on UIViewController)
   - UI of TableView cell has been built in nib with AutoLayout Constraints
   - Activity Indicator and simple system Alert
   - App get Orders data from Alzura API
   
   ### What I would prefer to fix/add/replace
   - Replace system alerts to more convenient and nice native style alerts from GitHub
   - Add Notification toasts 
   - Make a code refactoring in order to split View Controller into modules
   - Change the way how sorting works. Substitute sorting in app to sorting on backend
   - Integrate UI to be able to set a date range for filtering. (Method for this feature is now available in the app) 
   - Add animations to TableView presentation
   
   ## 3. Networking. Alzura API
   ### Used features
   - Authorization via API in order to get access token 
   - Getting an order list
  
  ### Difficulties
   - There was confusion at the time of getting the token. Later we came to a solution together
   
  ### What I would prefer to fix/add/replace
   - Remove repetitive parts of code inside the API class
   - Make API class more flexible for using of filtration, sorting in requests
