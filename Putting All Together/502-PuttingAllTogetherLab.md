# ORACLE Cloud Test Drive #
-----
## 502: End-to-End Testing ##

### Introduction ###
Finally we can put everything together by doing a test run end-to-end, monitor to track how message flow across systems, device and components.

### About the Exercise Today ###
In this exercise, we will:
- Test run the loyalty management application and 'Cafe Supremo' mobile app as per roles of marketing manager and end customer respectively
- Identify and monitor message flow across components used in all lab exercises today

### Prerequisites ###
+ Completion of previous lab exercise: [501: Update Source Code for Sending Push Notification from JEE Application to Mobile Cloud Service](501-PuttingAllTogetherLab.md)

----

#### Create An Offer from Loyalty Management Application ####

1. Go to home page of the Loyalty Management application. The Loyalty Management application URL should be in the format of:  
`https://**<JCS WLS instance IP Adress>**/loyalty/jsp/welcome.jsp`  
Provide an integer value for **Input Offer Criteria**, enter `10000` in this example represent any customer who has 10000 points or above to match offer criteria.  
Select a **Target Product**, `Festival Blend` is chosen in this example.  
Then click `Search` button.

![](images/502/01.offer.search.png)

2. The number of total customers who match the offer critieria is shown, click `Next` button.

![](images/502/02.offer.target.png)

3. Provide detail for this new offer by example of:  
**Offer Name** : `Summer Festival Offer`  
**Offer Period** : `01-08-2017` To `31-08-2017`  
**Offer Message** : `Hot Summer means Hot Offer. Enjoy our discount today on Festival Blend. Valid from 1st to 31st Aug 2017, terms and conditions apply.`  
Then click `Create Offer` button.

![](images/502/03.offer.create.png)

4. On a successful offer creation and customer push notification, the following result should be displayed:  
(with red highlighted text about offer created and blue highlighted text of notification JSON message.

![](images/502/04.offer.sent.png)

#### Respond to Offer from Mobile App ####

5. In a couple of seconds, an app push notification should be arrived at your Android device with offer message provided previously.

![](images/502/05.offer.receive.png)

6. Swipe/Click to open the notification message, the 'Cafe Supremo' mobile app with offers list opened. Click to open the latest or any drink offer from the existing offers list.

![](images/502/06.offer.open.png)

7. The offer detail about the drink product image, description and offer respond 'accept/decline' buttons are shown, click on either `accept` or `decline` button to procced. 

![](images/502/07.offer.accept.png)

8. The offer with QR code image and drink product description. Optionally you can use a QR scanner to open the offer URL.

![](images/502/08.offer.qr.png)

9. From MCS dashboard, go to `Applications` -> `Mobile Backends` -> `Your Loyalty Management API`, you should be able to find the recent API calls from mobile and average response time. For more about MCS monitoring, please refer to [404: Track customer behaviors](../Mobile%20Service%20and%20App/404-MobileLab.md)

![](images/502/09.offer.mcs.png)

10. From ICS dashboard, go to `Monitoring` -> `Tracking`, you should be able to locate the recent offer respond action message track. For more about ICS monitoring, please refer to [304: Testing the service and Monitoring with ICS Dashboards](../Integrations/304-IntegrationsLab.md)

![](images/502/10.offer.ics.png)

11. From the track instance flow, you can find the accepted or declined if-then execution path of message flow.  
From the 'Activity Stream', you can find the QR code image URL of the accepted or declined offer.

![](images/502/11.offer.flow.png)

12. Congratulations! You have finished this lab section and all workshop exercises of today.

[Back to Putting All Together Lab Home](README.md)
