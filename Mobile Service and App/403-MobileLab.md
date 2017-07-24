# ORACLE Cloud Test Drive #
-----
## 403: Develop Custom APIs and Custom Code to extend mobile services ##

### Introduction ###
![](../common/images/mobile/mcsgs_dt_003_customapi.png)

You can create custom REST APIs to build up a library of services that can be used by your mobile applications. Custom APIs are particularly useful for aggregating data from other sources, adding any relevant business logic, and returning results in a mobile-friendly way for mobile applications.
![](../common/images/mobile/mcsgc_dt_004_api.png)

### About the Exercise Today ###
In the previous lab, we've created 3 connector APIs to integrate with external services for offer information query, QR code creation and offer result update. As you might remember, those connector APIs are not directly exposed to mobile applications. Once you create  connector APIs to access the services, you can use them in custom APIs (e.g. Loyalty Managment API), which you can then call from your mobile applications or external systems using standard REST calls. So, in this lab, we will create a custom API for 3 connector APIs.

In this exercise, we will:
- Create the custom API and define its endpoints for loyalty management. We need the custom API with several endpoints for offer information query, QR code creation and offer result (e.g. reject or accept) update.
- Implement the custom API: In this lab, we will provide code snippets for API implementation. Just follow the instructions and you can make it.
- Set up Security for the custom API
- Associate the APIs with the loyalty management MBE.
- Test the Customer API for loyalty management

### Prerequisites ###
- Loyalty management MBE created in the previous lab. (400 lab)
- 3 Connector APIs we created in the previous lab (402 lab)
- A RAML file for the custome API with some of endpoints for your use. It can be downloaded from [this link](../common/assets/mobile/) for your use in the lab. Go to the link, downloada a file called `loyaltymanagementapi.raml`, and save it to your local PC.
- Chrome Postman to test custom APIs
- Any text file editor

----
#### Create the custom API and define its endpoints for loyalty management ####
In this lab, you will create a custom API for loayalty managment. In fact, we need to define serveral endpoints for the custome API for offer information query, QR code creation and offer result update. Creating endpoints are the same jobs. For your convenience, we will create our own custom API using a RAML file for other endpoints and then manually create one additional endpoint. So, here you will create one endpoint for the query of the specific offer information. 

1. From the navigation pane, select “Applications” -> “APIs”, click on “+ New API” and select “API” from the dropdown list.
![](../common/images/mobile/403-New_API.png)

2. Click on “Upload a RAML document” link and choose the RAML file (`loyaltymanagementapi.raml`) you download.
![](../common/images/mobile/403-RAML_upload.png)

3. When uploaded successfully, enter name and description and click on “Create” as below:
    + **API Display Name**: `Loyalty Management 0X` (0X is the sequence number assigned to you by instructor. - e.g.: 01)
    + **API Name**: `LoyaltyManagement0X` 
    + **API Short Description**: `Custom API for Loyalty Management 0X`
Click on “Create” on the bottom right.

![](../common/images/mobile/403-Create_Custome_API_with_RAML.png)

4. Define additional endpoint for the Loyalty Management API
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

    - Adding sample response: MCS will use the below sample body to create a mockup implementation for this endpoint method. This is the one of good features to enable parallel development of mobile application without external services. In the "Example" text area, paste the following code:
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

    - For your information: Now we have created all endpoints for the Loayaly Management Custom APIThe below is the list of endpoints for your reference.

    | Resource Path     | Display Name          | Method | Request Type     | Response Media Type |
    | ----------------- | --------------------- | ------ | ---------------- | ------------------- |
    | offer/{id}/qr	| Offer QR code         | GET    | N/A	            | image/png           |
    | offer		| Offers	        | GET    | N/A	            | application/json    |
    | offer/{id}/accept | Accept an offer       | POST   | application/json | application/json    |
    | offer/{id}/reject | Reject an offer       | POST   | application/json | application/json    |
    | offer/notify      | Send noti. of offer   | POST   | application/json | application/json    |

----
#### Implement the custom API for the Loyalty Management ####
Now that you have the API defined, it's time to implement the API with JavaScript code. You can get started by downloading a scaffold that provides stubs for the functions that you need to implement for each endpoint, as well as some sample code.

1. On page level navigation pane, select “Implementation”. Click on “JavaScript Scaffold” to download the mockup implementation which is a zip file named `loyaltymanagementapi0X_1.0.zip`. (OX is your postfix. e.g.: 01)
![](../common/images/mobile/403-Impl_JS_Download.png)

2. Unzip the scaffold in your PC, you will see files as below:
![](../common/images/mobile/403-Impl_JS_Scaffold.png)

Take a look at the file named like `loyaltymanagementapi0X.js` (OX is your postfix. e.g.: 01) and the package.json.

3. Reference Connectors: You will need to reference the connectors in "package.json" file in order to use them in your custom API (`LoyaltyManagementAPI0X`). Add the 3 connectors in "connectors" part of "package.json" file you’ve created in the previous section, as below. **[Note]** Please mind your postfix).

	```
	"name" : "loyaltymanagementapi01",
	"version" : "1.0",
	"description" : "API for Loyalty Management 01.",
	"main" : "loyaltymanagementapi01.js",
	"oracleMobile" : {
	   "dependencies" : {
		"apis" : { },
		"connectors" : {
			"/mobile/connector/TestDriveICSConnectorAPI01":"1.0",
			"/mobile/connector/TestDriveACCSPtMgtConnectorAPI01":"1.0",
			"/mobile/connector/TestDriveACCSCtdQRConnectorAPI01":"1.0"
		}
	   }
	}

	```

4. Edit `loyaltymanagementapi0X.js` (OX is your postfix. e.g.: 01) to add implementation logic.
In this lab, we will provide the implementation logic for the Loyalty Management API for the lab simplicity.

   - Open `loyaltymanagementapi0X.js` (OX is your postfix. e.g.: 01) with your text editor, replace the whole content with the source code below:
   
	```
		/**
 		* The ExpressJS namespace.
 		* @external ExpressApplicationObject
 		* @see {@link http://expressjs.com/3x/api.html#app}
 		*/
	```
/**
 * Mobile Cloud custom code service entry point.
 * @param {external:ExpressApplicationObject}
 * service
 */
module.exports = function (service) {

    /**
     *  The file samples.txt in the archive that this file was packaged with contains some example code.
     */

    service.get('/mobile/custom/LoyaltyManagementAPI/offer', function (req, res) {
        var result = {};
        var statusCode = 200;
        if (statusCode == 200) {
            var acceptType = req.accepts(['application/json']);
            if (acceptType == 'application/json') {
                result = [{
                    "id": 10001,
                    "name": "Our new aroma roast",
                    "points": 10000,
                    "message": "Try special brew today and enjoy 10% off with 10,000 points",
                    "productid": 20001,
                    "productname": "Aroma Beans",
                    "productprice": 21,
                    "productimage": "20001.jpg",
                    "productdesc": "Blend of incomparable Balance of sweetness, aroma and body. Composed of 50% Arabica and 50% Robusta."
                },{
                    "id": 10002,
                    "name": "Fresh brewed everyday",
                    "points": 20000,
                    "message": "Purchase special brew between 3-5pm and receive 20% off with 20,000 points",
                    "productid": 20002,
                    "productname": "Valentine",
                    "productprice": 20,
                    "productimage": "20002.jpg",
                    "productdesc": "Specialty coffee roasted in small batches by people who care. The specialty part means we only choose to roast top-tier, rigorously-graded, traceable coffees."
                },{
                    "id": 10003,
                    "name": "Upgrade your iced coffee",
                    "points": 5000,
                    "message": "Stop in today and treat yourself to an upgraded iced coffee with 5,000 points",
                    "productid": 20003,
                    "productname": "Coffee Break",
                    "productprice": 15,
                    "productimage": "20003.jpg",
                    "productdesc": "Celebrates the rich flavor of espresso. It is a simple drink, yet we prepare it with care. Baristas pour two espresso shots, and then quickly pour hot water over the top to produce a light layer of crema."
                }];
            }
        }
        res.status(statusCode).send(result);
    });

    service.get('/mobile/custom/LoyaltyManagementAPI/offer/:id', function (req, res) {
        req.oracleMobile.connectors.TestDriveACCSPtMgtConnectorAPI.get('/ptmgt/v1/offers/' + req.params.id, { outType: 'stream' })
            .on('error', function (error) {
                console.log('Error getting offer details.');
                res.send(error.status, error.message)
            })
            .pipe(res);
    });

    service.get('/mobile/custom/LoyaltyManagementAPI/offer/:id/qr', function (req, res) {
        req.oracleMobile.connectors.TestDriveACCSCtdQRConnectorAPI.get('/ctdqr/v1/offer/' + req.params.id, { outType: 'stream' })
            .on('error', function (error) {
                console.log('Error getting offer QR code.');
                res.send(error.status, error.message)
            })
            .pipe(res);
    });
    service.post('/mobile/custom/LoyaltyManagementAPI/offer/notify', function (req, res) {
        var notification = {
            message: req.body.message + ' - ' + req.body.offerid,
            users: req.body.users
        };
        if (req.body.message.startsWith('Custom')) {
            notification = req.body;
        }

        req.oracleMobile.notification.post(notification, {
            mbe: req.oracleMobile.mbe.getMBE().name,
            version: req.oracleMobile.mbe.getMBE().version
        }).then(
            function (result) {
                res.send(result.statusCode, result.result);
            },
            function (error) {
                res.send(error.statusCode, error.error);
            });
    });

    service.post('/mobile/custom/LoyaltyManagementAPI/offer/:id/accept', function (req, res) {
        var events = [];
        events.push({
            name: 'context',
            type: 'system',
            timestamp: timestamp()
        });
        events.push({
            name: 'AcceptOffer',
            type: 'custom',
            component: 'Offers',
            timestamp: timestamp(),
            properties: {
                offerId: req.params.id
            }
        });
        var acceptReq = {
            "offerid": req.params.id,
            "productid": req.body.productid,
            "accepted": true
        };
        processoffer(events, acceptReq, req, res);
    });

    service.post('/mobile/custom/LoyaltyManagementAPI/offer/:id/reject', function (req, res) {
        var events = [];
        events.push({
            name: 'context',
            type: 'system',
            timestamp: timestamp()
        });
        events.push({
            name: 'RejectOffer',
            type: 'custom',
            component: 'Offers',
            timestamp: timestamp(),
            properties: {
                offerId: req.params.id
            }
        });
        var rejectReq = {
            "offerid": req.params.id,
            "productid": req.body.productid,
            "accepted": false
        };
        processoffer(events, rejectReq, req, res);
    });

    var processoffer = function (events, reqBody, req, res) {
        req.oracleMobile.ums.getUser().then(
            function (result) {
                reqBody.customerid = result.result.username;
                events[1].properties.userName = result.result.username;
                req.oracleMobile.analytics.postEvent(events).then(function () {
                    req.oracleMobile.connectors.TestDriveICSConnectorAPI.post('', JSON.stringify(reqBody), { contentType: "application/json", accept: "application/json" }).then(
                        function (result) {
                            res.status(result.statusCode).send(result.result);

                        }, function (error) {
                            console.log('Error processing offer.');
                            res.send(500, error);
                        }
                    );
                });
            },
            function (error) {
                res.send(error.statusCode, error.error);
            }
        );
    };

    var timestamp = function (date) {
        var pad = function (amount, width) {
            var padding = "";
            while (padding.length < width - 1 && amount < Math.pow(10, width - padding.length - 1))
                padding += "0";
            return padding + amount.toString();
        }
        date = date ? date : new Date();
        var offset = date.getTimezoneOffset();
        return pad(date.getFullYear(), 4)
            + "-" + pad(date.getMonth() + 1, 2)
            + "-" + pad(date.getDate(), 2)
            + "T" + pad(date.getHours(), 2)
            + ":" + pad(date.getMinutes(), 2)
            + ":" + pad(date.getSeconds(), 2)
            + "." + pad(date.getMilliseconds(), 3)
            + (offset > 0 ? "-" : "+")
            + pad(Math.floor(Math.abs(offset) / 60), 2)
            + ":" + pad(Math.abs(offset) % 60, 2);
    };
};

	```

   - Change the endpoint url to match your own API: Search for `/mobile/custom/LoyaltyManagementAPI` and replace all occurrences with `/mobile/custom/LoyaltyManagementAPI0X`(0X is your own postfix, e.g.: 01).
   
   - Change the connector references in the code
     - Search for `TestDriveICSConnectorAPI` and replace all occurrences with `TestDriveICSConnectorAPI0X`(0X is your own postfix, e.g.: 01).
     - Search for `TestDriveACCSPtMgtConnectorAPI` and replace all occurrences with `TestDriveACCSPtMgtConnectorAPI01` (01 is your own postfix).
     - Search for `TestDriveACCSCtdQRConnectorAPI` and replace all occurrences with `TestDriveACCSCtdQRConnectorAPI01`(01 is your own postfix).


----
#### Set up Security for the custom API for the Loyalty Management ####
You need to assign a role to access the API. Before that, the API is not accessible by anyone. On page level navigation pane, select “Security”. Click in the Roles box and select the “Default” role. Scroll to the top and click “Save”.
![](../common/images/mobile/403-API_Security_Settings.png)

---
#### Associate the APIs with the loyalty management MBE ####
Before you can deploy the custom API, it has to be associated with the mobile backend(e.g.: `APAC_Test_Drive_Loyalty_Management_MBE01`) you created in the previous lab. The mobile backend provides the security context for accessing the API, including the users that have permissions. In this lab, we will assign the complete custom API for "LoyaltyManagementAPI" that we provide.

1. Navigate to the MBE(e.g.: APAC_Test_Drive_Loyalty_Management_MBE01) you created, and turn to the “APIs” tab. Click “Select APIs”.
![](../common/images/mobile/403-Select_API_MBE.png)


2. Enter `LoyaltymanagementAPI0X`(replace **“0X”** with your own postfix)  and and click the  “+” icon to select the API.
![](../common/images/mobile/403-Select_Your_API.png)


3. You will see it got added to the right.
![](../common/images/mobile/403-Added_API_ToMBE.png)


4. Please see the result as below:
![](../common/images/mobile/403-API_AddToMBE_Result.png)


---
#### Test the Customer API for loyalty management ####

Now you can test your custom API. 

1. Finding your base URI and endpoint URI(e.g.: `https://mcs-gse00011678.mobileenv.us2.oraclecloud.com/mobile/custom/LoyaltyManagementAPI01/offer`), let’s take `Get offer details` endpoint as an example.
![](../common/images/mobile/403-Test_Get_URL.png)

2. [Install Postman and use Chrome to access.](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop) and launch Postman to test `Get offer details` API.
![](../common/images/mobile/403-Test_Postman_UI.png)

3. Change the endpoint URI parameter placeholder with `10001`, as is shown below then choose `Basic Auth` from Authourization type dropdown list.
![](../common/images/mobile/403-Test_Postman_Setting.png)

4. Enter MCS username and password (MCS credential in the Access Document). and click on “Update Request”.
![](../common/images/mobile/403-Test_MCS_Credential.png)

5. Click on “Headers” and you can see the “Authorization” header has been generated for you based on your settings in the “Authorization” tab.
![](../common/images/mobile/403-Test_Authorization_Header.png)

6. Add 2 headers, one is `Oracle-Mobile-Backend-ID`, value is the actual MBE id that you can find in the settings tab of your MBE. The other one is `Accept`:`application/json`. 
![](../common/images/mobile/403-MBE_Settings_ID.png)

![](../common/images/mobile/403-Test_Adding_2Headers.png)

7. Click on “Send” and you shall see the response at the bottom of the page as below.
![](../common/images/mobile/403-Test_Result.png)


You have finished this lab successfully.

[Procced to Next - 404: Track customer behaviors](404-MobileLab.md)

or

[Back to Mobile Serivce and Application Home](README.md)


