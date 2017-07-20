# ORACLE Cloud Test Drive #
-----
## 304: Testing the service and Monitoring with ICS Dashboards ##

### Introduction ###
This tutorial demonstrates how to:
- Consume and monitor a service exposed by Integration Cloud Service (ICS) 

### About this tutorial ###
In this exercise, we will:
- Test an integration flow with REST trigger connection being exposed
- Examine test results from varies ICS monitoring facilities

### Prerequisites ###
- Oracle Public Cloud Service account including Integration Cloud Service
- SOAP and REST connections and an orchestration flow in ICS already configured (303-IntegrationsLab.md)

#### Testing and Monitoring Your Work on ICS ####

1. Previously we have successfully deployed an integration flow which accepts a REST JSON request, route to a SOAP CRM customer service and then reply a REST JSON response. Let's test this service and monitor how it goes.  
	To do so, start a new browser window and visit to: `https://www.hurl.it/`, provide the following information:
	- **Destination**: Select `POST` and enter `https://integration-<Your ICS Identity Domain>.integration.us2.oraclecloud.com/integration/flowapi/rest/<Your Integration Service Name>/v01/processoffer`
	- **Authentication**: Add a new one, select `Basic` and enter your ICS username and password respectively.
	- **Headers**: Add a new one, enter `Content-Type` and `application/json` respectively.
	- **Parameters**: Add a new one by (Test 1 or Test 2):
	- Test 1: `{"customerid": 30001, "offerid": 10001, "productid": 20001, "accepted": true}`
	- Test 2: `{"customerid": 30002, "offerid": 10002, "productid": 20002, "accepted": false}`
	
	(\*Notice: The tests above are not using real data, it just aims for testing the availability of API on ICS)

![](images/304/01.testing.hurl.png)

2. Check `I'm not a robot`, and fill-in the required image questions, and then click `Launch Request` button.  
    On a successful ICS integration flow service setup and test call, you should find HTTP status `200 OK` and the result looks like:
	
![](images/304/02.test.result.png)

3. Back to ICS, click the hamburger menu icon on top left corner, and then click `Monitoring`.

![](images/304/03.monitoring.home.png)

4. By default, the ICS Monitoring **Dashboard** is shown.
    The dashboard summarizes entire ICS traffic condition/trend amongst, *CONNECTIONS*, *INTEGRATIONS*, *SUCCESS*, *FAILURES* and other information, which are critical to integration monitoring.  
	(Optional) Notice on the right of dashboard, you can access to `Activity Stream`, `Download Diagnotics Logs` and `Download Incident`. Feel free to further explore.

![](images/304/04.monitoring.dashboard.png)

5. Under `MONITORING`, click on `Integrations`, you can see the recently test messages fired previously.  
    Now click on `View Messages` icon on the right.

![](images/304/05.monitoring.integration.png)

6. The **Track Instances** flow window for your particular integration is shown.  
    Click on one of your tested instance like below: 

![](images/304/06.monitoring.trackinstance.png)

7. The flow instance of the specific message transaction is shown.  
    The green path throughout the flow instance shows the normal/success flow of the message passing thru.  
	Now click on the hamburger menu icon on top right corner, and then click `Business Identifiers`.

![](images/304/07.monitoring.instance.png)

8. The `Business Identifiers` dialog window is shown.  
    Notice the values of `customerid`, `offerid` and `productid` of this particular message are logged.  
	Click `OK`.

![](images/304/08.monitoring.identifier.png)

9. Click on the hamburger menu icon at top right corner, click `View Audit Trail`.  
    The **Audit Trail** of overall activity executed by the integration flow dialog window is shown.  
    Click `OK` button and then click `Close`.

![](images/304/09.monitoring.audit.png)
![](images/304/10.monitoring.audit1.png)

You have finished this lab.

[Back to Integrations Lab Home](README.md)
