# ORACLE Cloud Test Drive #
-----
## 404: 跟踪客户行为[可选] ##

### 介绍 ###
![](../common/images/mobile/404-Analytics_Overview.png)

Oracle移动云服务（MCS）提供了一个分析API，可帮助您衡量应用程序性能和使用情况中的模式。作为业务开发经理或移动计划经理，您可以使用分析来了解如何改进您的应用程序。

MCS根据事件创建分析报告，描述用户如何与移动应用程序交互。移动应用程序开发人员可以通过在移动应用程序代码中引发事件来跟踪移动应用程序的全部用法在这个实验中，我们将看到如何跟踪“AcceptOffer”和“RejectOffer”等事件。移动后端接收来自移动应用程序的REST调用的事件。一个移动应用程序进行一次调用，其中包括一个JSON有效负载，用于描述事件以及诸如用户的位置，用户会话的开始和结束以及用户的移动设备的详细信息等上下文信息。如果您使用直接REST调用，或者使用移动客户端SDK为您构建一个负载，则可以自己制作有效负载。


![](../common/images/mobile/404-Analytics_Mechanism.png)


### 关于本练习 ###
在这个练习中，我们将:
- 查看移动应用程序的源代码片段来引发事件
- 了解如何检查MCS（移动云服务）中引发的事件

### Prerequisites ###
- Loyalty management MBE created in the previous lab.
- Cafe Supremo Mobile Application installation on your Android device

----

#### How to raise events from mobile applications ####
In this lab, you will not code for mobile application to create events. However, we'd like to give some ideas of how you can develop mobile application to create custom events. Oracle provides Event APIs as part of client SDK to create events upon offer accept/reject to raise events. The name of events could be any string you like, and you can add your custom attributes into the “properties” field which will be visible in the report creation wizard in MCS. Please refer to the below snippet of mobile client code to get an idea of how you can raise events from mobile applications.

    ```
    service.post('/mobile/custom/LoyaltyMgmt0X/offer/:id/accept', function (req, res) {
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
                userName: "jimSmith",
                  offerId: "10001"
            }
        });
        req.oracleMobile.analytics.postEvent(events)
    });

    service.post('/mobile/custom/LoyaltyMgmt0X/offer/:id/reject', function (req, res) {
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
                userName: "jimSmith",
                  offerId: "10001"
            }
        });
        req.oracleMobile.analytics.postEvent(events).then(function () {
            var rejectReq = {
                "offerid": req.params.id,
                "productid": req.body.productid,
                "accepted": false
            };
            processoffer(rejectReq, req, res);
        });
    });

    ```

---
#### How to check raised events in MCS ####
While MCS displays data gathered from all of the mobile backends by default, you can use the mobile and environment menus to isolate the activity for a particular mobile backend within a specific environment. MCS shows reports for all versions of a selected mobile backend, or API. Let's see how you can check raised events from mobile applications.

1. Navigate through “Analytics” -> “Events”, click on the “Select an event” dropdown list. When the Events are created via Events API as in previous step, you will see the events in the list. Select “AcceptOffer”.
![](../common/images/mobile/404-Analytics_Event_Check.png)


2. Now, you can see the reports for API Calls Count let you view the traffic for one, or many, APIs for a selected period of time. The report includes both successful and failed calls.
![](../common/images/mobile/404-Analytics_Event_Count.png)


3. You can also see the report for the select API ("AcceptOffer") by using filters like custom properties you defined in mobile applications as below:
    - Click "+" button to select a filter for your report.
    ![](../common/images/mobile/404-Analytics_Event_View_Filter.png)

    - Select the "userName".
    ![](../common/images/mobile/404-Analytics_Event_View2.png)

    - Choose the mobile user name for your report.
    ![](../common/images/mobile/404-Analytics_Event_View3.png)

    - Click the "Done".
    ![](../common/images/mobile/404-Analytics_Event_View4.png)

    - Now you can see the "AcceptOffer" event raised by the user you selected.
    ![](../common/images/mobile/404-Analytics_Event_View5.png)

4. Create reports based on Events and filter: You can keep an eye on the usage and health of your mobile applications on an ongoing basis by creating a suite of custom reports that you can run whenever you want. MCS enables you to create these reports by saving any filter definitions that you apply to the event, user, session, platform, and funnel reports. Click "My Reports" to see the reports you created.
![](../common/images/mobile/404-Analytics_Event_Report_Creation.png)


Congratulation! You have finished this lab section.

[Back to Mobile Service and Application Home](README.md)
