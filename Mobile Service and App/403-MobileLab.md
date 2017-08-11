# ORACLE Cloud Test Drive #
-----
## 403: Develop Custom APIs and Custom Code to extend mobile services ##

### Introduction ###
![](../common/images/mobile/mcsgs_dt_003_customapi.png)

You can create custom REST APIs to build up a library of services that can be used by your mobile applications. Custom APIs are particularly useful for aggregating data from other sources, adding any relevant business logic, and returning results in a mobile-friendly way for mobile applications.
![](../common/images/mobile/mcsgc_dt_004_api.png)

### About the Exercise Today ###
In the previous lab, we've created 3 connector APIs to integrate with external services for offer information query, QR code creation and offer result update. As you might remember, those connector APIs are not directly exposed to mobile applications. Once you create connector APIs to access the services, you can use them in custom APIs (e.g. Loyalty Management API), which you can then call from your mobile applications or external systems using standard REST calls. So, in this lab, we will create a custom API for 3 connector APIs.

In this exercise, we will:
- Create the custom API and define its endpoints for loyalty management. We need the custom API with several endpoints for offer information query, QR code creation and offer result (e.g. reject or accept) update.
- Implement the custom API: In this lab, we will provide code snippets for API implementation. Just follow the instructions and you can make it.
- Set up Security for the custom API
- Associate the APIs with the loyalty management MBE.
- Test the Custom API for loyalty management

### Prerequisites ###
- Loyalty management MBE created in the previous lab. (400 lab)
- 3 Connector APIs we created in the previous lab (402 lab)
- A RAML file for the custom API with some of endpoints for your use. It can be downloaded by right clicking on [this link](../common/assets/mobile/loyaltymanagementapi.raml) and select "Save link as..." for your use in the lab.
- Chrome Postman to test custom APIs
- Any text file editor

----
#### Create the custom API and define its endpoints for loyalty management ####
In this lab, you will create a custom API for loyalty management. In fact, we need to define several endpoints for the custom API for offer information query, QR code creation and offer result update. Creating endpoints are the same jobs. For your convenience, we will create our own custom API using a RAML file for other endpoints and then manually create one additional endpoint. So, here you will create one endpoint for the query of the specific offer information.

1. From the navigation pane, select “Applications” -> “APIs”, click on “+ New API” and select “API” from the dropdown list.
![](../common/images/mobile/403-New_API.png)

2. Click on “Upload a RAML document” link and choose the RAML file (`loyaltymanagementapi.raml`) you downloaded in the Prerequisites section.
![](../common/images/mobile/403-RAML_upload.png)

3. When uploaded successfully, enter name and description and click on “Create” as below:
    + **API Display Name**: `Loyalty Management 0X` (0X is the sequence number assigned to you by instructor. - e.g.: 01)
    + **API Name**: `LoyaltyManagement0X`
    + **API Short Description**: `Custom API for Loyalty Management 0X`
Click on “Create” on the bottom right.

![](../common/images/mobile/403-Create_Custome_API_with_RAML.png)

4. **Copy the values of "API Name" and replace the value of properties called "API" in the "Mobile_App_Settings_Sample.json" file from Lab 401.**  Save the JSON file for later use.

```
{
      "baseUrl": "https://mcs-gse00011678.mobileenv.us2.oraclecloud.com:443",
      "applicationKey": "9722de7f-4ecf-443f-8e0e-714b2f6e0f9c",
      "backendId": "4a9d0d32-8aad-48fb-b803-5315459dce9f",
      "anonymousToken": "R1NFMDAwMTE2NzhfTUNTX01PQklMRV9BTk9OWU1PVVNfQVBQSUQ6Smk3cXBld3lrczlfbmI=",
      "API":"LoyaltyManagementAPI0X",
            --> Replace the value inside double quotes with the value of "API Name" in previous step.
      "senderID":"925757644219"
}

```

5. Define additional endpoint for the Loyalty Management API
   - Now the custom API just created is automatically open for you. Switch to the “Endpoints” tab to define the additional endpoint.
![](../common/images/mobile/403-Define_Additional_Endpoint.png)

   - Adding resource: Click on “+ New Resource”.
![](../common/images/mobile/403-Endpoint_Add_Resource.png)

   - The new resource is added to the bottom of the existing endpoints page. Scroll down to the end.
![](../common/images/mobile/403-Locate_Added_Endpoint.png)

   - Enter `offer/{id}` as the “Resource Path” and `Offer` as the “Display Name” and click on “Methods”. This endpoint (a URI resource) is for getting the specific offer information by offer ID.
![](../common/images/mobile/403-New_Resource.png)

   - Adding method: you can see that {id} entered in previous step has be recognized as a URI Resource Path Parameter “id”. Click on “+ Add Method” and select “GET”.
![](../common/images/mobile/403-Adding_Method.png)

   - Enter `Get offer details` as the “Description” and `Get offer details` as the “Display Name” for the method. Click on “Responses” link at the bottom.
![](../common/images/mobile/403-Adding_Method_Info.png)

    - Adding response: Click on "Responses" and the "Add Response".
![](../common/images/mobile/403-Adding_Response.png)

![](../common/images/mobile/403-Adding_Response_Add.png)

    - Adding response media type: Click on "Add Media Type".
![](../common/images/mobile/403-Adding_Response_Add_Media_Type.png)

    - Adding sample response: MCS will to create a mockup implementation for this endpoint method using the sample body when provided. This is the one of good features to enable parallel development of mobile application without external services. Make sure the "Media Type" dropdown is set to "application/json" and then in the "Example" text area, paste the following code:
   
```
	{
		"id": 10001,
		"name": "Our new aroma roast",
		"points": 10000,
		"message": "Try special brew today and enjoy 10% off with 10,000 points",
		"productid": 20001,
		"productname": "Aroma Beans",
		"productprice": 21,
		"productimage": "20001.jpg",
		"productdesc": "Blend of incomparable Balance of sweetness, aroma and body. Composed of 50% Arabica and 50% Robusta."
	}
	
```

    - Scroll to the top of the page and click on “Save”.
![](../common/images/mobile/403-Adding_Sample_Response.png)

    - For your information: Now we have created all endpoints for the Loyalty Management Custom APIs. The below is the list of endpoints for your reference.

    | Resource Path     | Display Name          | Method | Request Type     | Response Media Type |
    | ----------------- | --------------------- | ------ | ---------------- | ------------------- |
    | offer/{id}/qr	    | Offer QR code         | GET    | N/A	        | image/png           |
    | offer	            | Offers	            | GET    | N/A	        | application/json    |
    | offer/{id}/accept | Accept an offer       | POST   | application/json | application/json    |
    | offer/{id}/reject | Reject an offer       | POST   | application/json | application/json    |
    | offer/notify      | Send noti. of offer   | POST   | application/json | application/json    |
    | offer/{id}        | Get Offer Details     | GET    | N/A	        | application/json    |


----
#### Implement the custom API for the Loyalty Management ####
Now that you have the API defined, it's time to implement the API with JavaScript code. You can get started by downloading a scaffold that provides stubs for the functions that you need to implement for each endpoint, as well as some sample code.

1. Download prebuilt implementation: We've provided a prebuilt implementation package for you which you can download by right clicking [loyaltymanagementapi_1.0.zip](../common/assets/mobile/loyaltymanagementapi_1.0.zip) and select "Save link as...".

2. Unzip the package, edit `/loyaltymanagementapi/package.json`, add your postfix the "name" and the "TestDriveACCSPtMgtConnectorAPI" to match your custom API name and the Product Information API connector name, such as
![](../common/images/mobile/403-Editing_Package_Json.png)

3. Edit the implementation.
   - Open `/loyaltymanagementapi/loyaltymanagementapi.js` with your text editor, replace the whole content with the source code below:

   - Change the endpoint url to match your own API: Search for `/mobile/custom/LoyaltyManagementAPI` and replace all occurrences with `/mobile/custom/LoyaltyManagementAPI0X`(0X is your own postfix, e.g.: 01).

   - Change the product information connector references in the code
     - Search for `TestDriveACCSPtMgtConnectorAPI` and replace all occurrences with `TestDriveACCSPtMgtConnectorAPI0X` (0X is your own postfix, e.g.: 01).


4. Repack and upload: Put "pakcage.json" file and `loyaltymanagementapi.js` file back into the original zip pack, then click on “Upload an implementation archive” and select the updated zip pack `loyaltymanagementapi_1.0.zip`.
![](../common/images/mobile/403-Upload_Impl_Pack.png)

6. When successfully done, you shall get a screen like the following:
![](../common/images/mobile/403-Impl_Upload_Pack_Success.png)


----
#### Set up Security for the custom API for the Loyalty Management ####
You need to assign a role to access the API. Before that, the API is not accessible by anyone. On page level navigation pane, select “Security”. Click in the Roles box and select the “Default” role. Scroll to the top and click “Save”.
![](../common/images/mobile/403-API_Security_Settings.png)

---
#### Associate the APIs with the loyalty management MBE ####
Before you can deploy the custom API, it has to be associated with the mobile backend (e.g.: `LoyaltyMgmt_MBE01`) you created in the previous lab. The mobile backend provides the security context for accessing the API, including the users that have permissions. In this lab, we will assign the complete custom API for "LoyaltyManagementAPI" that we provide.

1. Navigate to the MBE (e.g.: `LoyaltyMgmt_MBE01`) you created, and turn to the “APIs” tab. Click “Select APIs”.
![](../common/images/mobile/403-Select_API_MBE.png)


2. Enter `LoyaltymanagementAPI0X`(replace **“0X”** with your own postfix)  and click the  “+” icon to select the API.
![](../common/images/mobile/403-Select_Your_API.png)


3. You will see it got added to the right.
![](../common/images/mobile/403-Added_API_ToMBE.png)


4. Please see the result as below:
![](../common/images/mobile/403-API_AddToMBE_Result.png)


---
#### Test the Custom API for loyalty management ####

Now you can test your custom API.

1. Finding your base URI and endpoint URI(e.g.: `https://mcs-gse00011678.mobileenv.us2.oraclecloud.com/mobile/custom/LoyaltyManagementAPI01/offer`), let’s take `Get offer details` endpoint as an example.
![](../common/images/mobile/403-Test_Get_URL.png)

2. [Install Postman and use Chrome to access.](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop) and launch Postman to test `Get offer details` API.
![](../common/images/mobile/403-Test_Postman_UI.png)

3. Change the endpoint URI parameter placeholder with `10001`, as is shown below then choose `Basic Auth` from Authorization type dropdown list.
![](../common/images/mobile/403-Test_Postman_Setting.png)

4. Enter MCS username and password (MCS credential in the Access Document), and click on “Update Request”.
![](../common/images/mobile/403-Test_MCS_Credential.png)

5. Click on “Headers” and you can see the “Authorization” header has been generated for you based on your settings in the “Authorization” tab.
![](../common/images/mobile/403-Test_Authorization_Header.png)

6. Add 2 headers, one is `Oracle-Mobile-Backend-ID`, value is the actual MBE id that you can find in the settings tab of your MBE. The other one is `Accept`:`application/json`.
![](../common/images/mobile/403-MBE_Settings_ID.png)

![](../common/images/mobile/403-Test_Adding_2Headers.png)

7. Click on “Send” and you shall see the response at the bottom of the page as below.
![](../common/images/mobile/403-Test_Result.png)


You have finished this lab successfully.

[Procced to Next - 404: Set up Push Notification and Test Push Notification to mobile app](404-MobileLab.md)

or

[Back to Mobile Service and Application Home](README.md)
