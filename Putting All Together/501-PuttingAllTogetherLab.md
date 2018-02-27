# ORACLE Cloud Test Drive #
-----
## 501: 更新从JEE应用程序发送推送通知到移动云服务的设置 ##

### 介绍 ###

在实验室4 - 移动服务和应用程序完成后，您应该能够在Android设备上运行“咖啡厅Supremo”应用程序，并配置所有必要的移动后端服务。 使用Cafe Supremo应用程序的客户可以登录，探索个性化的推广和菜单。
客户不是定期检查最新的促销优惠，而是积极地通知客户。 一个基于应用程序的推送通知将发送给那些已经安装了“咖啡厅Supremo”应用程序，由市场营销经理创建一个新的报价。 因此，我们需要通过调用消息通知API将忠诚度管理JEE应用程序连接到移动云服务（MCS）。


![](images/501/final.scope.work.png)

### 关于本练习 ###
在这个练习中，我们将:
- 修改JEE应用程序中的推送通知设置
- 调用MCS API将推送通知从JEE应用程序发送到移动设备

### 先决条件 ###
+ 先前完成的所有4个实验练习: [Java Apps](../Java%20Apps/README.md), [Microservices](../Microservices/README.md), [Integration](../Integrations/README.md) and [Mobile](Mobile%20Service%20and%20App/README.md)


----

#### 准备移动设备以接收推送通知 ####

1. 在上一个实验 [404: Set up Push Notification and Test Push Notification to mobile app](../Mobile Service and App/404-MobileLab.md)结束时, 您应该能够从您的 移动设备通过来自MCS的测试通知，如下所示。 （如果不能完成实验练习404，请与指导老师核对）

![](../common/images/mobile/401-MCS_Notification_Result.png)
![](../common/images/mobile/401-MobileApp_Notification_Result.png)

2. 启动移动应用程序并输入教师提供的用户名和密码，然后单击登录按钮.

![](images/501/09.mobile.login.png)

3. 登录成功后，显示欢迎页面。 您的移动设备现在准备好接收推广活动提供的通知.

![](images/501/10.mobile.welcome.png)

#### 修改Java应用程序推送通知配置

1. 转到忠诚度管理应用程序的主页。 忠诚度管理应用程序的URL应采用以下格式:  
`https://**<JCS WLS instance IP Adress>**/loyalty/jsp/welcome.jsp`  

  点击页面底部的 [ **Configure Push Notification** ] URL

![](images/501/101.javaapp.png)

2. 根据您的环境更新MCS通知设置 - 这些值可以在您之前在实验404步骤2中准备的Mobile_App_Settings_Sample.json中找到.
    - MCS Base URL: `your MCS baseUrl, https://{your-mcs-instance}.mobileenv.us2.oraclecloud.com:443`     
    - Mobile Backend ID: `backendId in the json file`    
    - MCS Anonymous Key: `anonymousToken in the json file`    
    - Custom API Name: `API in the json file, LoyaltyMAnagementAPIXX`    

   你的json文件应该看起来类似于这个 - 当然值是不同的
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

    复制粘贴到Web表单时，请小心
      - 不要添加空格   
      - 您复制并粘贴全部的值    
  点击 [ **SAVE** ]按钮保存您的新设置.

![](images/501/102.push.png)

3. 一旦推送通知设置被保存，您可以继续下一个实验室.

![](images/501/103.save.png)


您的忠诚度管理JEE应用程序现在可以创建活动报价并通知客户移动设备。

你已经完成了这个实验部分。

[Procced to Next - 502: End-to-End Testing](502-PuttingAllTogetherLab.md)

or

[Back to Putting All Together Lab Home](README.md)
