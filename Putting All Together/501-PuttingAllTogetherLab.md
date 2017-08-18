# ORACLE Cloud Test Drive #
-----
## 501: Update Source Code for Sending Push Notification from JEE Application to Mobile Cloud Service ##

### Introduction ###
On the completion of Lab 4 - Mobile Service and App, you should be able to run the 'Cafe Supremo' app on Android device and configured all necessary mobile backend services. Customer using Cafe Supremo app can logon, explore personalized promotion and menu.  
Rather than having the customer periodically checks the latest new promotion offer, the company wants to actively notify customers. An app-based push notification will be sent to those who already installed the 'Cafe Supremo' app, upon a new offer is created by marketing manager. Therefore, we will need to connect the Loyalty Management JEE application to Mobile Cloud Service (MCS) by calling a messaging notification API.

![](images/501/final.scope.work.png)

### About the Exercise Today ###
In this exercise, we will:
- Perform second iteration of 'Continuous Integration and Continuous Delivery', i.e. provision another set of code changes
- Call MCS API to send push notification from JEE application to mobile device

### Prerequisites ###
+ Completion of all previous 4 lab exercises: [Java Apps](../Java%20Apps/README.md), [Microservices](../Microservices/README.md), [Integration](../Integrations/README.md) and [Mobile](Mobile%20Service%20and%20App/README.md)
+ Re-open the VirtualBox Virtual Machine image used previously in [Java Apps Lab 103](../Java%20Apps/103-JavaAppsLab.md), or [click here if you forget the VirtualBox installation and usage instruction](../Java%20Apps/virtualbox.md)

----

#### Prepare Mobile Device to Receive Push Notification ####

1. By the end of previous lab [401: Set up Push Notification and Test Push Notification to mobile app](../Mobile Service and App/401-MobileLab.md), you should be able to receive notification message pop-up from your mobile device upon **Test Notifications** from MCS like below. (Please check with instructor if you cannot complete lab exercise 401)

![](../common/images/mobile/401-MCS_Notification_Result.png)
![](../common/images/mobile/401-MobileApp_Notification_Result.png)

2. Before running notification test, you were told to prepare a file called **Mobile_App_Settings_Sample.json** like below format:    
```
{
      "baseUrl": "https://<Your Mobile Cloud Service Identity Domain Name>.mobileenv.us2.oraclecloud.com:443",
      "applicationKey": "9722de7f-4ecf-443f-8e0e-714b2f6e0f9c",
      "backendId": "4a9d0d32-8aad-48fb-b803-5315459dce9f",
      "anonymousToken": "R1NFMDAwMTE2NzhfTUNTX01PQklMRV9BTk9OWU1PVVNfQVBQSUQ6Smk3cXBld3lrczlfbmI=",
      "API":"LoyaltyManagementAPI0X",
      "senderID":"925757644219"
}
```
We will use it shortly.

3. From your web browser, go to `http://www.qr-code-generator.com/`, click on `Text` button and the **Free text** text area is shown.

![](images/501/01.qr.site.png)

4. Copy **Your own** JSON file content from step 2 above, paste it into the **Free text** text area, then click `Create QR code` button. A QR code image will be generated on the right hand side of window.

![](images/501/02.qr.result.png)

You can keep this browser open, or save the image for later use.

5. From your mobile device, open the app 'Supremo'.

![](images/501/03.mobile.app.png)

6. On app started and login page shown, click on the hamburger menu on top left corner.

![](images/501/04.mobile.menu.png)

7. On expanded menu, click `Settings`

![](images/501/05.mobile.settings.png)

8. On Settings page opened, click `Read Settings from QRCode` button at middle.

![](images/501/06.mobile.qr.png)

9. When the QR scanner running, face your mobile device towards the QR code image (from step 4).  
You may need to adjust the distance between your mobile device and your screen until the scanner camera can recognize the QR image.

![](images/501/07.mobile.cam.png)

10. On successful QR scanning, all property settings in your JSON file will be automatically filled into the mobile app Setting page like below. (You may need to expand `MCS Mobile Backend Preferences`)

![](images/501/08.mobile.qr.result.png)

Click `Save settings and logout` button. You will then be returned to home screen.

11. Enter the mobile app **Username** and **Password** provided by instructor, then click `Login` button.

![](images/501/09.mobile.login.png)

12. Upon successful login, the welcome page is shown. Your mobile device is now ready to receive push notification of campaign offer.

![](images/501/10.mobile.welcome.png)

#### Modify Java App Push Notification Configuration

1. Go to home page of the Loyalty Management application. The Loyalty Management application URL should be in the format of:  
`https://**<JCS WLS instance IP Adress>**/loyalty/jsp/welcome.jsp`  

  Click the [ **Configure Push Notification** ] URL at the bottom of the page

![](images/501/101.javaapp.png)

2. Update the MCS Notification Setting with respect to your environment - the values are available in the Mobile_App_Settings_Sample.json you've prepared previously in Step 2 of Lab 404.
    - MCS Identity Domain Name: `your identity domain, gse000XXXXX`     
    - Mobile Backend ID: `backendId in the json file`    
    - MCS Anonymous Key: `anonymousToken in the json file`    
    - Custom API Name: `API in the json file, LoyaltyMAnagementAPIXX`    

    Your json file should looks similar to this - **of course the vales are different**
    ```json
    {
          "baseUrl": "https://<Your Mobile Cloud Service Identity Domain Name>.mobileenv.us2.oraclecloud.com:443",
          "applicationKey": "9722de7f-4ecf-443f-8e0e-714b2f6e0f9c",
          "backendId": "4a9d0d32-8aad-48fb-b803-5315459dce9f",
          "anonymousToken":  "R1NFMDAwMTE2NzhfTUNTX01PQklMRV9BTk9OWU1PVVNfQVBQSUQ6Smk3cXBld3lrczlfbmI=",
          "API":"LoyaltyManagementAPI0X",
          "senderID":"925757644219"
    }
    ```

    When Copy-n-Paste to the web form, be careful
      - do NOT add white space   
      - you copy and paste the **COMPLETE** value     
  Click [ **SAVE** ] button to save your new settings.

![](images/501/102.settings.png)

3. Once the Push Notification Settings are saved, you can proceed to next lab.

![](images/501/103.save.png)


Your Loyalty Management JEE Application is now ready to create campaign offer and notify customer mobile device.

You have finished this lab section.

[Procced to Next - 502: End-to-End Testing](502-PuttingAllTogetherLab.md)

or

[Back to Putting All Together Lab Home](README.md)
