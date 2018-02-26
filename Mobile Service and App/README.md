
# ORACLE Cloud Test Drive #

## 介绍 ##
我们在日常生活中非常依赖移动服务。 由于这一趋势，企业迫切希望能够建立更多的移动应用程序，以改善客户体验，实现卓越运营并在业务中实现更高的业务价值。 因此，可以说移动是数字化转型的关键。 移动应用程序开发更加符合实际 - 让我们看看移动应用程序开发在业务和技术方面面临的挑战是什么。

### 移动技术的挑战 ###
除了业务挑战，企业在开发移动应用程序方面还有一些困难。 要开发移动应用程序，我们需要具备以下方面的专业知识:
+ 开发并支持多种平台（Android，iOS，Windows等）
+ 为开发，测试和生产准备环境
+ 如何监控和分析移动服务
+ 到不同的后端的安全和身份协议和政策
+ 与各种后端整合
+ 你用什么工具来构建它们?
![](../common/images/mobile/Technical_Challenges_in_Mobile.PNG)

## Oracle移动解决方案战略 ##
为了克服上述挑战，Oracle鼓励开发人员使用任何可用的流行工具 - 无论是iOS和Android的本地开发，还是第三方和开放式框架，如Ionic，Angular，Sencha和Xamarin。 我们称之为“移动客户端不可知论者”。 甲骨文还整合了提供数据同步，存储，位置服务，消息传递，访问本地服务（如相机，通讯录，GPS等）的移动服务。低代码，无代码开发的趋势 - Oracle支持这种名为MAX（Mobile 应用程序加速器）作为移动云服务（MCS）的一部分。
![](../common/images/mobile/Oracle_Mobile_Solution_Strategy.PNG)

总之，Oracle提供了端到端的解决方案，可以帮助您克服重大的业务和技术挑战

### Oracle移动服务 ###
在这里您可以通过访问Oracle MCS（移动云服务）来查看哪些移动服务已经准备就绪，如下所示:
+ 开箱即用的移动服务（平台API）：我们提供分析，推送通知，离线数据同步，位置，对象存储，数据库，应用策略，API管理，集成管理，安全性和用户等预构建，测试和优化的移动服务 管理，以及智能机器人等更多功能即将到来.
+ 除了平台API之外，您还可以开发定制的API和代码来扩展您的移动服务。 （例如：SNS集成，Google Map集成，外部系统集成等）。换句话说，移动应用程序可以调用自定义API以及平台API来交互各种数据源.
+ 对于客户端IDE来开发移动应用程序，我们可以支持任何IDE以及像Oracle MAX（低代码开发），JET（基于JavaScript的混合应用程序开发）和MAF（基于Java的混合应用程序开发）的移动框架

![](../common/images/mobile/Oracle_Mobile_Services.PNG)

如果您想了解更多有关上述移动服务的详细信息，请参阅 [the following link](https://docs.oracle.com/en/cloud/paas/mobile-cloud/index.html).

### 关于练习 ###
移动开发的难点在于整合和管理所有的服务器端服务。 在本练习中，您将看到如何轻松地启用/开发移动服务，如推送通知，API创建和与外部服务的集成，以实现使用Oracle MCS（移动云服务）进行忠诚度管理的“Cafe Supremo”移动应用程序.

对于忠诚度管理移动应用程序，您可以使用平台API（开箱即用的移动服务）和自定义API（通过本实验室的下列作业）进行外部集成，使其一切工作并良好地一起玩.
- 导入MBE（Mobile BackEnd）包并配置连接器以集成外部服务，包括ACCS上的微服务以查询提供并生成QR代码，以及ICS上的服务接受或拒绝报价并更新现有的CRM.
- 验证端点和自定义API的实现。 自定义API被导入到MBE包中，并利用连接器与外部服务进行交互.
- 设置推送通知，并将Cafe Supremo移动应用程序配置为使用导入的MBE.
- 跟踪客户的行为，如“用户提供接受”使用自定义分析报告。 [注]这部分是可选的。 您可以先跳过此部分，然后在完成所有其他部分之后再回来.

![](../common/images/mobile/CTD_About_Lab_Mobile.PNG)


### 先决条件 ###
- 带上你的Android手机.
- 确保您从教师处收到MBE包文件“package-LoyaltyMgmt_MBE0X.zip”。 文件名中的“0X”应与访问文档中分配给您的后缀匹配。 如果您没有MBE包文件，或者文件名与分配给您的后缀不匹配，请联系指导员以获取正确的文件.
- 在本实验结束时，您将配置您的移动应用程序以使用您自己创建的MBE.您将收集文件“Mobile_App_Settings_Sample.json”中的所有设置. 您可以通过右键单击此链接[this link](../common/assets/mobile/Mobile_App_Settings_Sample.json) 载该文件的示例，然后选择“将链接另存为...”.一旦你收集了这个文件中的所有设置，你将创建一个二维码来表示使用 [online QR code generator](http://www.qr-code-generator.com/) 的设置.
- 在您的Android手机上安装“Cafe Supremo”移动应用程序。 如果您的手机上安装了QR码扫描器，请通过扫描手机中的以下二维码来安装移动应用程序。

   ![](../common/images/mobile/400-Install_App_QRcode.png)

否则，请通过右键单击此[this link](../common/assets/mobile/Cafe_Supremo.apk?raw=true).  选择“保存链接为...”下载。 按照以下说明安装移动应用程序。

1. 将设备连接到电脑，然后将名为“Cafe_Supremo.apk”的Android APK文件复制到设备的SD卡或内部存储器中.

   ![](../common/images/mobile/401-Install_App_1.png)

2. 在您的Android设备中启用未知来源：转到“设置”>>“安全”>>选中“未知来源”框。 （仅供参考，Android版本的菜单略有不同。）

   ![](../common/images/mobile/401-Install_App_2.png)

3. 在Android设备上打开文件管理器 

   ![](../common/images/mobile/401-Install_App_3.png)

4. 转到放置“Cafe_Supremo.apk”文件的相同位置，然后单击要安装的文件。 下面的图片显示Android APK文件，以防您将其放在名为“下载”的文件夹中.

   ![](../common/images/mobile/401-Install_App_4.png)

5. 按“安装”按钮。

   ![](../common/images/mobile/401-Install_App_5.png)

6. 通过点击“CONFIRM”按钮，允许“CaféSupremo”移动应用程序需要的所有权限。 现在您已经完成了移动应用程序的安装。

   ![](../common/images/mobile/401-Install_App_6.png)


---
# Lab Exercise: #
Let's explore the Mobile Service and Application Lab. Please click the below link to start your lab.

## 401: 导入MBE包并为外部服务配置连接器 ##

[Click Here.](401-MobileLab.md)

## 402: 验证并测试自定义的API和实现 ##

[Click Here.](402-MobileLab.md)

## 403: 设置推送通知并配置移动应用程序 ##

[Click Here.](403-MobileLab.md)

## 404: 跟踪客户行为[可选] ##

[Click Here.](404-MobileLab.md)

or

[Back to Cloud Test Drive Home](../README.md)
