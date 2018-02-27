# ORACLE Cloud Test Drive #
-----
## 403: 设置推送通知并配置移动应用程序 ##

### 介绍 ###
您可以使用通知服务（MCS平台API的一部分）将通知发送给在移动后端注册的应用程序的用户。 将移动后端设置为通知后，发送通知的过程对于iOS，Android和Windows应用程序都是相同的。 您通过获取适当的供应商证书并将其注册到应用程序的移动后端来设置通知。 另外，您可以在移动应用程序中编写自己的代码来处理推送通知。 MCS还可以将推送通知服务暴露给其他应用程序，以便应用程序 用于活动管理的Java应用程序可以通过调用MCS公开的推送通知服务向最终用户发送推送通知.
![](../common/images/mobile/mcsgs_dt_006_notifications.png)

### 关于该练习 ###
在这个练习中，我们将:
- 创建通知配置文件
- 配置移动应用程序以使用您的移动后端
- 测试通知

### 先决条件 ###
- 在Android设备上安装了Cafe Supremo应用程序

----
#### 创建通知配置文件 ####
通知配置文件定义推送通知提供程序发送推送通知所需的一个或多个证书。 在本实验中，您将创建一个通知配置文件并将其与客户端应用程序（Cafe Supremo移动应用程序）相关联，以便MCS可以向Cafe Supremo移动应用程序发送推送通知。

1. 在导航窗格中，选择“应用程序” - >“移动后端”。 输入“0X”（0X是分配给您的后缀）来搜索您导入的移动后端。 选择“LoyaltyMgmt_MBE0X”（0X是分配给你的后缀）并点击“打开”。
![](../common/images/mobile/403-Navigate_To_MBE.png)

2. 切换到“客户”选项卡，您应该看到一个名为“MyAndroidClient0X”的客户端（0X是分配给您的后缀）由您导入。 没有与客户端关联的通知配置文件。 点击客户端“MyAndroidClient0X”。
![](../common/images/mobile/403-Select_Client.png)

3. 显示客户端的设置。 向下滚动查看客户端的“应用程序密钥”。
![](../common/images/mobile/403-Client_Settings.png)

4. 复制“应用程序密钥”的值并替换“Mobile_App_Settings_Sample.json”文件中的属性“applicationKey”的值。 保存文件供以后使用。
![](../common/images/mobile/403-Copy_ApplicationKey_To_Json.png)

5. 切换到“MyAndroidClient0X”客户端的“配置文件”选项卡，然后单击“新建配置文件”按钮来创建通知配置文件。
![](../common/images/mobile/403-Begin_New_Profile.png)

6.输入FCM0X（0X改变分配给您的后缀，例如：03）作为名称，粘贴 `AAAA14t0nbs:APA91bHtR-V_lZEcMgaEFIJd_UrybuBjNyPG4N0ZoA33UqbZ9CywL_e2FnIfoS9lvPV5gut3Mm_ZMoex7PE1-YL-7ACaP3CnrDYpl8Qq3_jfsO3HMJYS-Mzr_X-xWpgdqWswVHsSUgDX` as the "API Key" and `925757644219` 作为 Sender ID. 保持 `Google Messaging (GCM or FCM)` 作为 "Notification Service" 和 `XMPP` as the "Send Method", 然后点击“创建”（这是Google生成的密钥）。

   ![](../common/images/mobile/403-Create_New_Profile.png)

7. 他的通知配置文件已经创建并与您的客户端“MyAndroidClient0X”相关联。 点击导航栏中的<LoyaltyMgmt_MBE0X>链接返回到移动后端。
![](../common/images/mobile/403-Profile_Navigate_Back.png)

8. 验证您的客户端是“启用通知”
![](../common/images/mobile/403-Client_Notification_Enabled.png)


---
#### 配置移动应用程序以使用您的移动后端 ####
您应该将移动应用配置为与您的移动后端一起工作，然后才能在应用上运行任何测试。 您将使用文件Mobile_App_Settings_Sample.json收集配置移动应用程序所需的设置。

1. 切换到移动后台的“设置”标签，在移动后台设置中查找“Mobile Backend ID”，“ Anonymous Key”和“Base URL”的值。
![](../common/images/mobile/403-MBE_Settings.png)

2. 复制移动后端设置中的值，并替换“Mobile_App_Settings_Sample.json”文件中的目标属性的值。 您应该复制并替换以下属性。

| From Property in MBE Settings | To Property in JSON File |
|-------------------------------|--------------------------|
| Mobile Backend ID             | backendId                |
| Anonymous Key                 | anonymousToken           |
| Base URL                      | baseUrl                  |

3. 复制移动用户名和密码的值，以替换“Mobile_App_Settings_Sample.json”文件中的“LoginUser”和“LoginPassword”属性的值。 这允许Cafe Supremo移动应用程序在移动应用程序的登录表单中将“LoginUser”和“LoginPassword”设置为默认的用户名和密码。 最后你的“Mobile_App_Settings_Sample.json”文件应该是这样的。
![](../common/images/mobile/403-Final_JSON.png)

4. Cafe Supremo移动应用程序允许通过扫描QR码来读取新的设置。 您将使用“Mobile_App_Settings_Sample.json”文件中的设置生成QR码，并从移动应用扫描QR码。 

5. 从您的网络浏览器，去http://www.qr-code-generator.com/ ， 点击文本按钮，显示自由文本文本区域
![](../common/images/mobile/01.qr.site.png)

6. 将设置复制到您自己的“Mobile_App_Settings_Sample.json”文件中，并将其粘贴到自由文本文本区域，然后单击创建QR代码按钮。 QR码图像将在窗口的右侧生成。
![](../common/images/mobile/02.qr.result.png)

7. 从您的移动设备上，打开应用程序' Cafe Supremo'

   ![](../common/images/mobile/03.mobile.app.png)

8. 不要登录。 点击左上角的汉堡包菜单，然后点击“设置”

   ![](../common/images/mobile/05.mobile.settings.png)

9. 在打开的“设置”页面上，单击中间QRCode按钮的“读取设置”按钮

   ![](../common/images/mobile/06.mobile.qr.png)

10. 当QR扫描仪运行时，将您的移动设备朝向步骤6中创建的QR码图像。您可能需要调整移动设备和屏幕之间的距离，直到扫描仪摄像头能够识别QR图像。

   ![](../common/images/mobile/07.mobile.cam.png)

11. 在成功扫描QR码后，您的JSON文件中的所有设置将自动填充到下面的移动应用程序设置页面中。 点击保存设置和注销按钮。 然后您将返回到主屏幕。

   ![](../common/images/mobile/08.mobile.qr.result.png)

12. 登录表单中的“用户名”和“密码”已经预先填写好，就像你在JSON文件中的设置一样。 如果用户名和密码正确，点击登录按钮登录。 否则，您可以手动输入用户名和密码。

   ![](../common/images/mobile/09.mobile.login.png)

13. 登录成功后，显示欢迎页面。 您的移动设备现在准备好接收推广活动提供的通知。

   ![](../common/images/mobile/10.mobile.welcome.png)

---
#### 测试通知 ####
1. 切换到手机后台的“通知”标签，并点击“4 TEST”下方的图标.

   ![](../common/images/mobile/403-Navigate_To_Notification.png)

2. 点击“管理设备”.

   ![](../common/images/mobile/403-Test_Manage_Devices.png)

3. 您将看到已注册到此移动后端的设备。 点击“关闭”并返回到“测试”屏幕。

   ![](../common/images/mobile/403-Manage_Devices.png)

4. 在发送通知之前，请确保您的“Cafe Supremo”移动应用程序正在Android设备的后台运行.

5. 输入通知” You can use your points to buy products! – 10001”发送选项现在，点击“发送”。 请注意，如果没有设备注册，您将会收到错误信息。

   ![](../common/images/mobile/403-Notification_Test_Screen.png)

6. 如果您至少注册了一个设备，则会在页面顶部弹出一个成功消息，通知将显示在设备的通知区域中.

   ![](../common/images/mobile/403-Notification_Sent.png)

   ![](../common/images/mobile/401-MobileApp_Notification_Result.png)


[Procced to Next - 404: Track customer behaviors (Optional)](404-MobileLab.md)

or

[Back to Mobile Service and Application Home](README.md)
