# ORACLE Cloud Test Drive #
-----
## 402: Develop Custom APIs and Custom Code to extend mobile services ##

### Introduction ###
![](../common/images/mobile/mcsgs_dt_003_customapi.png)

You can create custom REST APIs to build up a library of services that can be used by your mobile applications. Custom APIs are particularly useful for aggregating data from other sources, adding any relevant business logic, and returning results in a mobile-friendly way for mobile applications.
![](../common/images/mobile/mcsgc_dt_004_api.png)

### About the Exercise Today ###
In this exercise, we will:
- Create the custom API and define its endpoints for loyalty management. We need the custom API with several endpoints for offer information query, QR code creation and offer result (e.g. reject or accept) update.
- Associate the APIs with the loyalty management MBE.
- Test the endpoints with mock data. (TBD: Need to provide sample data for APIs with link in the common/assets/mobile folder)
- Implement the API for loyalty management. (We will provide the code for this here --> put link TBD: Need to provide sample data for APIs with link in the common/assets/mobile folder.)
- Test the implementation

### Prerequisites ###
- Loyalty management MBE created in the previous lab.
- Complete custome API with all required endpoints for your use. (It is ready for you.)

----

#### Create custom APIs and define its endpoints for loyalty management ####
In this lab, you will create a custom API for loayalty managment. In fact, we need to define serveral endpoints for the custome API for offer information query, QR code creation and offer result update. Creating endpoints are the same jobs. So, here you will create one endpoint for the query of the specific offer information. **Note:**We will provide the completed custom API with all endpoints for your use in this lab.

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


#### Associate the APIs with the loyalty management MBE ####
To be Described.

#### Test the endpoints with mock data ####
To be Described.

#### Implement the API for loyalty management ####
To be Described.

#### Test the implementation ####
To be Described.

[Procced to Next - 403: Track customer behaviors](403-MobileLab.md)

or

[Back to Mobile Serivce and Application Home](README.md)


