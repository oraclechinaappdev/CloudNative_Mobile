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
- 查看移动应用程序的源代码片段来引发事件.
- 了解如何检查MCS（移动云服务）中引发的事件

----

#### 如何从移动应用程序中引发事件 ####
在本实验中，您将不会编写移动应用程序来创建事件。 不过，我们想就如何开发移动应用程序来创建自定义事件提供一些想法。 Oracle提供事件API作为客户端SDK的一部分，在提供接受/拒绝事件时创建事件。 事件的名称可以是您喜欢的任何字符串，您可以将自定义属性添加到“属性”字段中，该字段将在MCS中的报告创建向导中可见。 请参阅下面的移动客户端代码片段，以了解如何从移动应用程序中引发事件。

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
#### 如何检查MCS中引发的事件 ####
虽然MCS默认显示从所有移动后端收集的数据，但您可以使用移动和环境菜单来隔离特定环境中特定移动后端的活动。 MCS显示所选移动后端或API的所有版本的报告。 我们来看看如何从移动应用程序中检查引发的事件。

1. 浏览“分析” - >“事件”，点击“选择一个事件”下拉列表。 如上一步，通过事件API创建事件时，您将在列表中看到事件。 选择“AcceptOffer”。
![](../common/images/mobile/404-Analytics_Event_Check.png)


2. 现在，您可以看到“API调用计数”的报告让您查看一个或多个API在一段选定时间段内的流量。 该报告包括成功和失败的调用.
![](../common/images/mobile/404-Analytics_Event_Count.png)


3. 您还可以使用像在移动应用程序中定义的自定义属性那样的过滤器来查看选择API（“AcceptOffer”）的报告，如下所示：
点击“+”按钮为您的报告选择一个过滤器：
:
    - Click "+" button to select a filter for your report.
    ![](../common/images/mobile/404-Analytics_Event_View_Filter.png)

    - 选择“用户名”.
    ![](../common/images/mobile/404-Analytics_Event_View2.png)

    - 为您的报告选择移动用户名称.
    ![](../common/images/mobile/404-Analytics_Event_View3.png)

    - 点击“完成”.
    ![](../common/images/mobile/404-Analytics_Event_View4.png)

    - 现在您可以看到您选择的用户引发的“AcceptOffer”事件。
    ![](../common/images/mobile/404-Analytics_Event_View5.png)

4. 基于事件和过滤器创建报告：通过创建一套您可以随时运行的自定义报告，您可以持续关注移动应用程序的使用情况和健康状况。 MCS使您可以通过保存适用于事件，用户，会话，平台和渠道报告的任何过滤器定义来创建这些报告。 点击“我的报告”查看您创建的报告。
![](../common/images/mobile/404-Analytics_Event_Report_Creation.png)


恭喜！ 你已经完成了这个实验部分。

[Back to Mobile Service and Application Home](README.md)
