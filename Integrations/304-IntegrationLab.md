# ORACLE Cloud Test Drive #
-----
## 3. Rapid Connect Applications by Oracle Integration Cloud Service ##

### About this tutorial ###

#### 304: Testing the service and Monitoring with ICS Dashboards ####

70. Previously we have successfully deployed an integration flow which accepts a REST JSON request, route to a SOAP CRM customer service and then reply a REST JSON response. Let's test this service and monitor how it goes.  
	To do so, start a new browser window and visit to: `https://www.hurl.it/`, provide the following information:
	- **Destination**: Select `POST` and enter `https://integration-<Your ICS Identity Domain>.integration.us2.oraclecloud.com/integration/flowapi/rest/<Your Integration Service Name>/v01/processoffer`
	- **Authentication**: Add a new one, select `Basic` and enter your ICS username and password respectively.
	- **Headers**: Add a new one, enter `Content-Type` and `application/json` respectively.
	- **Parameters**: Add a new one by (Test 1 or Test 2):
	- Test 1: `{"customerid": 10001, "offerid": 10001, "productid": 10001, "accepted": true}`
	- Test 2: `{"customerid": 10001, "offerid": 10001, "productid": 10001, "accepted": false}`

![](images/00/72.testing.hurl.png)

71. Check `I'm not a robot`, and fill-in the required image questions, and then click `Launch Request` button.  
    On a successful ICS integration flow service setup and test call, you should find HTTP status `200 OK` and the result looks like:
	
![](images/00/73.test.result.png)

72. Back to ICS, click the hamburger menu icon on top left corner, and then click `Monitoring`.

![](images/00/74.monitoring.home.png)

73. By default, the ICS Monitoring **Dashboard** is shown.
    The dashboard summarizes entire ICS traffic condition/trend amongst, *CONNECTIONS*, *INTEGRATIONS*, *SUCCESS*, *FAILURES* and other information, which are critical to integration monitoring.  
	(Optional) Notice on the right of dashboard, you can access to `Activity Stream`, `Download Diagnotics Logs` and `Download Incident`. Feel free to further explore.

![](images/00/75.monitoring.dashboard.png)



You have finished this lab.

[Back to Cloud Test Drive Home](../README.md)
