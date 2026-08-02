## Exercise 1: Web Application Testing

| Test Case | Expected Results                         | Actual Results                                                                                | Verdict  |
| :-------: | :--------------------------------------- | :-------------------------------------------------------------------------------------------- | :------: |
|   **1**   | User registered successfully             | Valid inputs submitted.<br>![Form](assets/tc1_input.png)<br>![Success](assets/tc1_result.png) | **Pass** |
|   **2**   | Reject invalid UserName and Email format | Invalid/empty UserName & wrong Email format (`515@_AA`).<br>![TC2](assets/tc2.png)            | **Pass** |
|   **3**   | Reject invalid Postal Code format        | Postal Code set to `12345`. Error: `Wrong Postal Code format`.<br>![TC3](assets/tc3.png)      | **Pass** |
|   **4**   | Reject empty Email                       | Email left blank. Error: `Wrong Email format`.<br>![TC4](assets/tc4.png)                      | **Pass** |
|   **5**   | Reject missing Age                       | Age field empty. Error: `Age is mandatory`.<br>![TC5](assets/tc5.png)                         | **Pass** |
|   **6**   | Reject Age > 64                          | Age set to `150`. Error: `must be less than or equal to 64`.<br>![TC6](assets/tc6.png)        | **Pass** |
|   **7**   | Reject Age < 18                          | Age set to `-1`. Error: `must be greater than or equal to 18`.<br>![TC7](assets/tc7.png)      | **Pass** |
