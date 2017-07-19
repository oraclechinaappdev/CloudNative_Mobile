# ORACLE Cloud Test Drive #
-----
## 402: Create Connectors for external services ##

### Introduction ###
![](../common/images/mobile/402-Connectors_Overview.png)

Connectors allow you to declaratively create APIs that simplify access to and standardize use of backend systems (such as enterprise middleware) and web services. Connector types are available for REST web services, SOAP web services, the Oracle Integration Cloud Service (ICS), and Oracle Cloud applications based on Fusion Applications (FA). For this lab, we are going to use the connectors for the REST web services to integrate ACCS and ICS.

Once you create a connector API to access the service, you can use it in custom APIs (e.g. Loyalty Managment API), which you can then call from your mobile applications using standard REST calls.

![](../common/images/mobile/402-Connectors_Mechanism.png)

### About the Exercise Today ###
There are 3 RESTful APIs for offer information query, QR code creation and offer result (e.g. reject or accept) update from external systems like ACCS (Application Container Cloud Service) and ICS (Integration Cloud Service) that we need to access in this lab. We will only walkthrough the one that retrieves offer information here. 

To create a connector for an ACCS service to get offer information, we will:
- Create a REST connector API for ACCS service
- Test the connector API

### Prerequisites ###
- Loyalty management MBE created in the previous lab.

----

#### Create a REST connector API for ACCS service ####
In this lab, we will create a connector API to integrate ACCS microservice for offer information. **[Note]** A connector API is for the custome APIs. It means a connector API doesn't have direct interactions with mobile applications. Mobile applications only interact with custom APIs and custom APIs will use the connector API to interact external services and systems.

1. On the navigation pane, select “Applications” -> “Connectors”. Click on the “+ New Connector” green button and select “REST” from the dropdown list.
![](../common/images/mobile/402-New_Connector.png)

2. Enter `Test Drive ACCS Product Management API 0X`(0X is the sequence number assigned to you by instructor. - e.g.: 01) as a name for this connector. The API name will be automatically generated for you while you type in the Display API Name. Note that the “API Name” will be used in custom API implementation coding thus is must meet JavaScript variable naming standards. Click on “Create” on the bottom right when you are done.
![](../common/images/mobile/402-New_Connector_Info.png)

3. Review the name/description on the general screen and click on the “Next Step” button (“>” on the top right) to move to the next screen.
![](../common/images/mobile/402-Connector_Info_Review.png)

4. Enter the URL (It will be provided in the Access Document.) to the REST API into the “Remote URL” textbox. Click on “Next Step”.
![](../common/images/mobile/02-Connector_URL_Setting.png)

5. TTT




1. From the navigation pane, select “Applications” -> “APIs”, click on “+ New API” and select “API” from the dropdown list.
![](../common/images/mobile/402-New_API.png)

2. Enter name and description and click on “Create” as below:
+ **API Display Name**: `Loyalty Management 0X` (0X is the sequence number assigned to you by instructor. - e.g.: 01)
+ **API Name**: `LoyaltyManagement0X` 
+ **API Short Description**: `Custom API for Loyalty Management`
![](../common/images/mobile/402-API_Creation.png)

3. Define endpoints for the Loyalty Management API
    - Select “Endpoints” on the page level navigation pane on the left and click on “+ New Resource”.
![](../common/images/mobile/402-Click_Endpoints.png)



	{
    	"id": 10001,
    	"name": "Samsam Galaxy Offer",
    	"points": 6000,
    	"message": "Exchange 6000 points for 10% discount of Samsam Mobile Phone",
    	"productid": 20001,
    	"productname": "Samsam Galaxy 7",
    	"productprice": 1000,
    	"productimage": "20001.jpg",
    	"productdesc": "The best Android phone in the galaxy"
  	} 


#### TBD ####
To be Described.

#### TBD ####
To be Described.

#### TBD ####
To be Described.

#### Test the implementation ####
To be Described.

[Procced to Next - 403: Develop Custom APIs and Custom Code to extend mobile services](403-MobileLab.md)

or

[Back to Mobile Serivce and Application Home](README.md)


