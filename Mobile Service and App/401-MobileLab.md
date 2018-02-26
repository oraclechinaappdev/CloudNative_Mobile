
# ORACLE Cloud Test Drive #
-----
## 401: 导入MBE包并为外部服务配置连接器 ##

### Introduction ###
![](../common/images/mobile/402-Connectors_Overview.png)

连接器允许您声明性地创建API，以简化对后端系统（如企业中间件）和Web服务的使用的访问和标准化。 Oracle MCS提供了不同类型的连接器，以简化与不同类型的后端系统（包括REST连接器，SOAP连接器，Oracle集成云服务（ICS）连接器和Oracle Fusion Application连接器）的集成。 在本实验中，您将使用REST连接器来集成在微服务和集成实验室中创建的三个REST服务。

一旦创建了连接器，就可以将其用于自定义API（例如，稍后将创建的Loyalty Mgmt APi），并将其暴露给移动应用程序。

![](../common/images/mobile/402-Connectors_Mechanism.png)

### 关于本实验 ###
在这个实验中有3个连接器被创建，其中2个与ACCS上的微服务集成以查询报价并生成QR码，而最后一个连接器与ICS上的服务集成以接受或拒绝报价并更新现有的CRM。

要创建上述3个连接器，您将：:
- 导入包含3个连接器的MBE软件包，以及稍后将验证和配置的自定义API和移动后端r.
- 配置连接器以使用正确的URL和凭证与后端服务集成.
- 以“Process Offer”连接器为例，测试并验证连接器的结果

### 先决条件 ###
- 完成“微服务”和“集成”实验室，分别在ACCS和ICS上提供服务.

#### 导入MBE包 ####

1. 通过访问文档中的移动云服务（MCS）身份域ID和凭证登录到Mobile Cloud Service。 您应该使用管理员用户签署移动云服务，并使用移动用户签署到Cafe Supremo移动应用程序.

2. 在仪表板屏幕中，点击“移动环境服务”.
![](../common/images/mobile/400-MobileEnvService.png)

3. 在服务详细信息屏幕上，单击“服务实例URL”链接访问MCS门户.
![](../common/images/mobile/400-MCS_ServiceInstanceURL.png)

4. 在MCS Portal中，点击位于服务介绍页面左上角的汉堡包图标。 从导航窗格中，选择“应用程序” - >“包”，然后单击“新导入”绿色按钮.
![](../common/images/mobile/401-New_Import_Package.png)

5. 点击“选择一个包文件”，并选择正确的后缀分配给你的MBE包文件“package-LoyaltyMgmt_MBE0X.zip”.
![](../common/images/mobile/401-Import_Package_Select_File.png)

6. 文件上传完成后，点击“下一步”.
![](../common/images/mobile/401-Import_Package_File_Validated.png)

7. 7.	在“确认”步骤中，显示包的内容。 该软件包应该包括Mobile Backend'LoyaltyMgmt_MBE0X'，客户'MyAndroidClient0X'，API'LoyaltyMgmt0X'，API实现'LoyaltyMgmt03'，以及3个连接器'GenerateQRCode0X'，'ProcessOffer0X'和'QueryOffers03'。 确保每个要导入的对象中的后缀都是正确的。 点击下一步
![](../common/images/mobile/401-Import_Package_Confirm.png)

8. 在“导入结果”步骤中，验证所有对象都已成功导入，但用户领域“Default”已经存在。 点击下一步'。
![](../common/images/mobile/401-Import_Package_Results.png)

9. 在“策略”步骤中，选择策略“* .connector / GenerateQRCode0X（1.0）.Connector_Endpoint”，然后单击“编辑”.
![](../common/images/mobile/401-Import_Package_Select_GenerateQRCode_Endpoint.png)

10.将自定义值设置为部署在ACCS上的QR码服务的主机URL，例如 `https://qrcodegenerator-<ACCS_DOMAIN_NAME>.apaas.<DATACENTER>.oraclecloud.com`. 点击“保存”.
![](../common/images/mobile/401-Import_Package_Update_GenerateQRCode_Endpoint.png)

11. 回到“策略”步骤，选择策略'* .connector / QueryOffers0X（1.0）.Connector_Endpoint'并点击'编辑'.
![](../common/images/mobile/401-Import_Package_Select_QueryOffers_Endpoint.png)

12. 将自定义值设置为部署在ACCS上的要约服务的主机URL，例如 `https://offer-<ACCS_DOMAIN_NAME>.apaas.<DATACENTER>.oraclecloud.com`. 点击“保存”
![](../common/images/mobile/401-Import_Package_Update_QueryOffers_Endpoint.png)

13. 回到“策略”步骤，选择策略'* .connector / ProcessOffer0X（1.0）.Connector_Endpoint'并点击'编辑'.
![](../common/images/mobile/401-Import_Package_Select_ProcessOffer_Endpoint.png)

14. 将自定义值设置为部署在ICS上的“Process Offer”服务的完整服务网址，例如. `https://integration-<ICS_DOMAIN_NAME>.integration.<DATACENTER>.oraclecloud.com/integration/flowapi/rest/C0X_ICS_INTMGT/v01/processoffer`. 点击“保存”.
![](../common/images/mobile/401-Import_Package_Update_ProcessOffer_Endpoint.png)

15. 返回到“策略”步骤，验证是否已成功为所有三个连接器端点策略设置了新值，然后单击“更新”完成导入包。
![](../common/images/mobile/401-Import_Package_Complete_Update_Policies.png)


#### 配置凭证以访问ICS上的“Process Offer”服务 ####
部署在ICS上的“Process Offer”服务被配置为在“集成”实验室中使用“基本身份验证”。 要与“Process Offer”服务集成，您应该在MCS上配置ICS凭证，以便MCS上的连接器有权访问ICS上的“Process Offer”。

1. 从导航窗格中，单击“管理”打开“管理”页面。 向下滚动到底部并点击“钥匙和证书”打开“CSF钥匙和证书”框
![](../common/images/mobile/401-CSF_Navigate_To_CSF.png)

2. 在“CSF Keys＆Certificates”框中的“CSF Keys”选项卡下，选择“ICS0X”（0X是分配给您的后缀），将“Short Description”设置为“ICS0X”（0X是分配给的后缀 您），并将用户名和密码设置为您在“集成”实验室中使用的ICS域的凭证。 点击“保存并关闭”按钮。
![](../common/images/mobile/401-CSF_Update_CSF.png)

#### 测试连接器'Process Offer' ####

一旦连接器完全导入并完成配置，您就可以测试连接器。 在本实验中，您将测试连接器的“Process Offer”。

1. 在导航窗格上，选择“应用程序” - >“连接器”。 输入“0X”（0X是分配给您的后缀）来搜索由您创建的连接器。 选择“Process Offer 0X”（0X是分配给你的后缀）并点击“打开”
![](../common/images/mobile/401-Test_Connector_Open_ProcessOffer.png)

2. 在“常规”步骤中，确保“API名称”设置为“ProcessOffer0X”（0X是分配给您的后缀），然后单击“下一步”。
![](../common/images/mobile/401-Test_Connector_ProcessOffer_General.png)

3. 在“描述符”步骤中，确保将“远程URL”设置为ICS上“流程提供”服务的完整服务URL，例如. `https://integration-<ICS_DOMAIN_NAME>.integration.us2.oraclecloud.com/integration/flowapi/rest/C0X_ICS_INTMGT/v01/processoffer`. 点击下一步'.
![](../common/images/mobile/401-Test_Connector_ProcessOffer_Descriptor.png)

4. 在“规则”步骤中，单击“下一步”，因为没有使用规则. 

5. 在“安全”步骤中，确保选择安全策略“oracle / http_basic_auth_over_ssl_client_policy”，并将csf-key设置为“ICS0X”（0X是分配给您的后缀）。 点击下一步.
![](../common/images/mobile/401-Test_Connector_ProcessOffer_Security.png)

6. 点击“是”保存.

   ![](../common/images/mobile/401-Test_Connector_ProcessOffer_Save.png)

7. 在“Test”步骤中，选择POST作为HTTP方法，在“HTTP Body”中输入 `{"customerid": 66890169,  "offerid": 10001,  "productid": 20001,  "accepted": false}` .
![](../common/images/mobile/401-Test_Connector_ProcessOffer_Test_1.png)

8. 从“身份验证”部分的下拉列表中选择您创建的移动后端（例如：LoyaltyMgmt_MBE0X），然后单击“测试端点”.
![](../common/images/mobile/401-Test_Connector_ProcessOffer_Test_2.png)

9. 您将在页面底部看到一个HTTP 200 OK响应，并将其全部设置.
![](../common/images/mobile/401-Test_Connector_ProcessOffer_Test_Result.png)


你已经成功完成了这个实验.

[Procced to Next - 402: Verify and test custom APIs and implementation](402-MobileLab.md)

or

[Back to Mobile Service and Application Home](README.md)
