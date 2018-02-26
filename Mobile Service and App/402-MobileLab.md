# ORACLE Cloud Test Drive #
-----
## 402: 验证并测试自定义的API和实现 ##

### 介绍 ###
![](../common/images/mobile/mcsgs_dt_003_customapi.png)

您可以创建自定义REST API来构建可供移动应用程序使用的服务库。 自定义API对于汇总来自其他来源的数据，添加任何相关的业务逻辑以及以移动友好的方式返回结果以用于移动应用程序尤其有用。
![](../common/images/mobile/mcsgc_dt_004_api.png)

### 关于练习 ###
在之前的实验中，您已经创建了3个连接器来与外部服务集成，包括ACCS上的微服务以查询报价并生成QR码，ICS上的服务接受或拒绝报价并更新现有的CRM。 您可能还记得，这些连接器不直接暴露在移动应用程序中。 创建连接器以访问服务后，可以将其用于自定义API（例如LoyaltyMgmt API）中，然后您可以使用标准REST调用从移动应用程序或外部系统调用这些API。 定制API“LoyaltyMgmt0X”包含在MBE软件包中，并已经被导入到之前实验室的MCS中。

在这个实验中，你将会:
- 验证自定义API的定义
- 测试自定义API

### 先决条件 ###
- MBE软件包已经在之前的实验室中成功导入（实验室401）
- 以前的实验室（实验室401）已经正确配置了3个连接器

----
#### 验证用于忠诚度管理的自定义API的定义 ####
在本实验中，您将检查在以前的实验中使用MBE软件包导入的用于忠诚度管理的自定义API的端点，安全设置和实现。. 

1. 在导航窗格中，选择“应用程序” - >“API”。 输入“0X”（0X是分配给您的后缀）来搜索由您创建的自定义API。 选择“LoyaltyMgmt 0X”（0X是分配给你的后缀）并点击“打开”
![](../common/images/mobile/402-API_Navigate_and_Open.png)

2. 确保“API名称”的值是“LoyaltyMgmt0X”（0X是分配给您的后缀）.
![](../common/images/mobile/402-API_Verify_API_Name.png)

3. 复制“API名称”的值，并替换“Mobile_App_Settings_Sample.json”文件中的属性“API”的值。 保存文件供以后使用.
![](../common/images/mobile/402-API_Copy_To_Json.png)

4. 切换到“端点”选项卡，将显示在此自定义API中定义的端点列表。 点击“紧凑模式”按钮切换到“紧凑模式”。 您可以在紧凑模式下检查所有端点列表。.
![](../common/images/mobile/402-API_Check_Endpoints.png)

5. 了解您的信息：现在您已经为忠诚度管理自定义API定义了所有终端。 以下是供您参考的端点列表.

    | Resource Path     | Display Name          | Method | Request Type     | Response Media Type |
    | ----------------- | --------------------- | ------ | ---------------- | ------------------- |
    | offer/{id}/qr	    | Offer QR code         | GET    | N/A	        | image/png           |
    | offer	            | Offers	            | GET    | N/A	        | application/json    |
    | offer/{id}/accept | Accept an offer       | POST   | application/json | application/json    |
    | offer/{id}/reject | Reject an offer       | POST   | application/json | application/json    |
    | offer/notify      | Send noti. of offer   | POST   | application/json | application/json    |
    | offer/{id}        | Get Offer Details     | GET    | N/A	        | application/json    |

6. 您可以定义安全策略以允许用户和角色访问此API。 在这个实验中，我们允许匿名访问这个API。 切换到“安全”选项卡，确保“需要登录”选项被关闭，所以API允许匿名访问.

   ![](../common/images/mobile/402-API_Verify_Security.png)

7. 在定义了自定义API之后，将自动生成一个模拟服务，以允许移动开发人员开始使用该API，而无需等待服务开发人员完成实现该服务。 在这个实验中，API实现已经和MBE包一起导入。 切换到“实施”选项卡，单击以展开“LoyaltyMgmt0X的依赖项”。 确保名为“LoyaltyMgmt0X”的实现设置为“默认”，并且您可以在依赖项列表中找到连接器“GenerateQRCode0X”，“QueryOffers0X”和“ProcessOffer0X”（0X是分配给您的后缀）.
![](../common/images/mobile/402-API_Verify_Implementation.png)


----
#### 测试忠诚度管理的自定义API ####
现在您已经完成验证自定义API的定义和实现，您可以继续进行测试。

1. 点击自定义API屏幕右上角的“测试”按钮
![](../common/images/mobile/402-API_Open_Test.png)

2. 在API测试控制台中，显示可用于此API的端点列表。 以“获取优惠二维码”服务为例，点击左侧端点列表中的“Get offer QR code”.
![](../common/images/mobile/402-API_Test_Select_Endpoint.png)

3. 设置值为10001的“id”参数，并在“Mobile Backend”下拉列表中选择LoyaltyMgmt_MBE0X（0X是分配给您的后缀），将“Authentication Method”保留为Default。 点击“Test Endpoint”按钮来测试服务.
![](../common/images/mobile/402-API_Test_Prepare_Request.png)

4. 您应该得到响应代码“200”和内容类型“image / png”的响应。 这是您在ACCS上部署的“生成QR码”服务返回的QR码图像。.
![](../common/images/mobile/402-API_Test_Result.png)


你已经成功完成了这个实验.

[Procced to Next - 403: Set up Push Notification and configure the mobile app](403-MobileLab.md)

or

[Back to Mobile Service and Application Home](README.md)
