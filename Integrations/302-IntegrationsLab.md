# ORACLE Cloud Test Drive #
-----
## 302: 导入和定义CRM客户活动服务和REST服务暴露的连接 ##

### 介绍 ###
本教程演示如何:
- 为REST触发器服务公开导入和定义ICS连接并调用外部SOAP服务

### 关于今天的练习 ###
在这个练习中，我们将:
- 使用基于Web的点击和配置技术分别导入和定义ICS连接资源：SOAP和REST.

### 先决条件 ###
- Oracle公有云服务帐户，包括集成云服务
- 由教师分发的集成档案文件（IAR）名称为XXX_ICS_INTMGT_01_lab.iar

#### 导入集成云服务项目工件 ####

1. 点击集成蓝色图标，进入集成摘要页面.

![](images/302/01.home_integrate.png)

或者，您也可以点击左上角的汉堡包图标进入集成摘要页面，点击设计器，然后点击集成。

![](images/302/02.home_hamburger.png)

![](images/302/03.home_hamburger_designer.png)

![](images/302/01.home_hamburger_integrate.png)

2. 点击右上角的导入，导入集成？ 出现对话窗口。 点击浏览按钮

![](images/302/02.integration_import.png)

3. 浏览并打开机器本地目录以选择先前由教师提供的IAR文件，然后单击导入按钮.

![](images/302/02.integration_import1.png)

4. 您应该找到一个关于集成已导入成功的绿色对话框文本区域和集成列表中显示的名为XXX_ICS_INTMGT（1.0）的新导入实体.

![](images/302/02.integration_import2.png)

您已成功导入一组部分预构建的工件。 我们将穿过已经建成的东西，完成剩下的部分。

#### 定义CRM客户活动服务的SOAP连接 ####

5. 点击左上角的汉堡包图标，点击设计器，然后点击连接.

![](images/302/04.home_hamburger_connections.png)

6. 在Connections的主页中，您应该能够找到分别名为XXX_CRM_CustomerService和XXX_ICSINTMGT_ProcessOffer的新导入的连接实体.

![](images/302/05.connection_import.png)

7. 接下来，在XXX_CRM_CustomerService连接的行上，点击右侧的汉堡包菜单图标，然后选择如下所示的编辑.

![](images/302/05.connection_import1.png)

8. 显示XXX_CRM_CustomerService连接详细信息页面。 如前所述，这是一个基于SOAP协议的连接，它将调用一个服务端点。 我们将要定义这个连接细节.

![](images/302/07.connection_initial.png)

9. 向下滚动到连接属性部分，单击配置连接按钮.

![](images/302/05.connection_import2.png)

10. 显示连接属性对话窗口。 通过提供以下格式的属性值来填写WSDL URL:
    * **http://\<Your Java Cloud Service Instance IP Address\>/crm/CustomerServicePort?WSDL**  
	*\*如果您忘记了您的JCS实例IP地址，请点击这里 [Click Here!](../../Java%20Apps/java.cloud.md)*  
	将其他属性留空，因为它们是可选的，在本练习中不需要.
	
![](images/302/08.connection_properties.png)

11. 保持其他属性设置不变。 单击确定按钮保存所做的更改.  
请注意，没有选择安全策略，因为这是端点接口所要求的.  

12. 在SOAP Connection页面的顶部，点击右上角的Test，显示Test Confirmation对话窗口.  
	点击验证和测试按钮.

![](images/302/10.connection_test.png)

13. 你应该找到一个关于连接测试成功的绿色对话框.

![](images/302/11.connection_testresult.png)

14. 接下来，点击右上角的保存.

![](images/302/12.connection_save.png)

15. 保存更改？ 出现对话窗口警告重新激活集成，只需点击保存确认并关闭对话框

![](images/302/12.connection_save1.png)

16. 您应该找到一个关于连接已成功保存的绿色对话框文本区域.  
    单击关闭退出并返回到连接摘要页面.

![](images/302/13.connection_saveresult.png)

17. 与CRM客户服务的SOAP连接已更新并准备好被*调用*.  

#### 定义ICS服务暴露的REST连接 ####

18. 现在我们要更新XXX_ICSINTMGT_ProcessOffer连接.  
    但是，这次Connection并不是要调用任何端点服务，而是由前端客户端调用的* trigger *，即移动客户端触发这个REST连接服务。
确保你仍然在Connections Summary Page上。 如果不是，请先按照步骤1操作。
在XXX_ICSINTMGT_ProcessOffer连接的行上，单击右侧的汉堡包菜单图标，然后选择如下所示的编辑

	
![](images/302/14.connection_rest.png)

19. 这一次显示了XXX_ICSINTMGT_ProcessOffer连接详细信息页面，由于REST触发器类型的连接，该页面更简单.

![](images/302/16.connection_initial1.png)

20. 在“REST连接”页面上，单击右上角的“测试”.
你应该找到一个关于连接测试成功的绿色对话框。

![](images/302/18.connection_test1.png)

21. 接下来，点击右上角的保存。 
同样，保存更改？ 出现对话窗口警告重新激活集成，单击保存确认并再次关闭对话框。

![](images/302/20.connection_save2.png)

22. 您应该找到一个关于连接已成功保存的绿色对话框文本区域  
    单击关闭退出并返回到连接摘要页面。
![](images/302/19.connection_save1.png)

23. 两个连接只是准备就绪，SOAP连接 - *调用* CRM客户服务和REST连接 - *触发* ICS处理优惠分别。

[Procced to Next - 303: Complete an Integration - An Orchestration Integration Flow](303-IntegrationsLab.md)

or

[Back to Integrations Lab Home](README.md)
