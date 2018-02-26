# ORACLE Cloud Test Drive #
-----
## 303: 完成一个集成 - 一个业务编排流程 ##

### 介绍 ###
本教程演示如何:
- 在集成云服务（ICS）上完成集成流程 

### 关于今天的练习y ###
在这个练习中，我们将:
- 使用REST和SOAP端点探索ICS集成流程，并沿集成流程完成剩余的数据映射
- 使用基于Web的点击，配置，拖放技术来探索整合资源细节，并在ICS仪表板上定义数据映射

### 先决条件 ###
- Oracle公有云服务帐户，包括集成云服务
- 已经配置ICS中的SOAP和REST连接 (302-IntegrationsLab.md)

#### 完成一个'编排'整合n ####

1. 使用导航窗格，单击左上角的汉堡包菜单图标以显示导航窗格，然后单击集成.

![](images/303/01.home_hamburger_integrations.png)

2. 显示集成摘要页面.  
从列表中找到名为XXX_ICS_INTMGT（1.0）的实体，单击右侧的汉堡菜单图标并选择编辑.

![](images/303/02.integration_edit.png)

3. 显示先前导入的集成流程XXX_ICS_INTMGT（1.0）的集成业务流程编辑器。 这是一个未完成的流程，其中接下来的步骤将完成剩余的部分.

![](images/303/03.integration_existing.png)

4. 在进行任何更改之前，让我们回顾一下在导入过程中预建的内容.  
单击以选择名为ProcessOrder的第一个节点，然后在弹出菜单中单击编辑“笔”按钮.

![](images/303/04.integration.processoffer.png)

5. 显示配置Oracle REST端点对话窗口.  
本页面总结了导入的集成流程的接口，即如何通过REST请求和适当的JSON格式的响应与此流程进行交互。
点击右上方的<返回按钮查看剩余的细节.  


![](images/303/05.integration.rest.summary.png)

6. 此页面总结了有效负载的详细信息，您可以随时在此页面上查看详细信息，而无需进行任何更改。 点击中间的<<< inline >>>链接.

![](images/303/05.integration.rest.response.payload.png)

7. 显示Response Sample Json Payload的形式。 请注意，导入期间已提供的示例响应有效内容格式为:  
`{"activityid": "elit aliqua aliquip", "imgurl": "minim ipsum"}`  
Click `Cancel` button at bottom to return.

![](images/303/05.integration.rest.response.payload1.png)

8. 点击右上方的<返回按钮查看剩余的细节.

![](images/303/05.integration.rest.response.png)
9. 本页面总结了请求的有效负载细节，可以随时在此页面上浏览详细信息，而无需进行任何更改。 请注意，导入期间已提供的示例请求负载格式为:  
`{"customerid": 21767684, "offerid": 49531393, "productid": 28916305,   "accepted": true}`  
点击右上方的<返回按钮查看剩余的细节。

![](images/303/05.integration.rest.request.png)

10. 最后，显示“欢迎使用Oracle REST端点配置向导”页面，并总结此REST端点接口的整体设置.  
请勿更改任何内容，并单击右上角的取消按钮以返回编排流程。

![](images/303/05.integration.rest.endpoint.png)

11. 单击以选择第二个名为Map to CustomerSer ...的节点，然后在弹出菜单中单击编辑** Pen **按钮.

![](images/303/06.integration.map.png)

12. 显示映射到CustomerServiceActivity页面.  
请注意，左侧的Source树中的某些字段上有一些绿色的单选按钮，右侧的Target树中的某些字段上有一些绿色的tick单选按钮。 这意味着已经在这些源和目标字段实体之间配置和使用了映射。 （在导入过程中已经完成）
例如，目标树下的customerId已经被映射到源树中的相同名称字段实体customerId。
现在，我们来探索Target下的第二个字段activityName，点击如下所示在Mapping列下接受的名为f（x）的文本，接受的offerid。


![](images/303/06.integration.map1.png)

13. 将显示Build Mappings对话框窗口。 映射已经导入，并使用以下映射完成:  
`<xsl:value-of select = 'concat("Offer ID: ", /nssrcmpr:execute/nsmpr0:request-wrapper/nsmpr0:offerid, " of acceptance ", /nssrcmpr:execute/nsmpr0:request-wrapper/nsmpr0:accepted)`  
这是什么意思？ 这个映射将采用来自请求有效载荷的offerid和可接受的字段，将字符串改变并连接成一个示例字符串，如提供ID：10001的接受真
完成审核后，点击右下角的关闭按钮。



![](images/303/06.integration.map2.png)

14. 回到映射到CustomerServiceActivity页面，点击下面的Mapping列下面的文字f（x），productid.

![](images/303/06.integration.map3a.png)

15. “生成映射”对话框窗口显示为导入的映射：  
`<xsl:value-of select = 'concat("Offer for product ID: ", /nssrcmpr:execute/nsmpr0:request-wrapper/nsmpr0:productid)'>`  
完成审核后，点击右下角的关闭按钮。

![](images/303/06.integration.map3.png)

16. 回到映射到CustomerServiceActivity页面，点击下面的Mapping列下的最后一个字段文本f（x）。

![](images/303/06.integration.map4a.png)

17. “生成映射”对话框窗口显示为导入的映射:  
`<xsl:value-of select = 'fn:current-data()'>`  
这是Integration Cloud Service提供的开箱即用功能，您可以通过展开左下角的“映射组件”树来随时查找此功能（位于功能 - >日期类别下）和许多其他功能。
完成审核后，点击右下角的关闭按钮。


![](images/303/06.integration.map4.png)

18. 回到映射到CustomerServiceActivity页面，点击右上角的关闭按钮。

![](images/303/06.integration.map5.png)

19. 返回编排流程，单击以选择名为CustomerServiceActivity的第三个节点，然后在弹出菜单中单击编辑“笔”按钮.

![](images/303/07.integration.soap.png)

20. 显示Configure SOAP Endpoint对话窗口。 由于基于SOAP的接口的性质，没有可用的其他页面可以配置.  
只需查看此页面，然后单击右上角的取消按钮即可。

![](images/303/07.integration.soap1.png)

21. 返回编排流程，单击以选择名为IF Accept Offer的第四个节点，然后在弹出菜单中单击编辑“笔”按钮。

![](images/303/08.integration.if.png)

22. 22.	显示Accept Offer页面。 注意在文本区域提供了一个小写（接受）=“true”的逻辑决策，左边Source下的接受字段旁边有一个绿色的勾号单选按钮。
该函数根据接受的小写字符串值计算返回结果true或false，其中结果用于确定消息如何流向IF或ELSE路径。
完成审阅后，点击右上角的关闭。


![](images/303/08.integration.logic.png)

23. 在if或其他条件下，将返回不同的响应数据。 现在，if路径中还剩下一个任务来完成整个集成流程。

![](images/303/34.integration.if.difference.png)

24. 为了在客户接受要约时处理正确的反应，我们需要确认if路径上缺少应答数据的映射。  
单击右侧窗格中的Actions，然后拖动Map并将其放到IF Accept Offer节点和两个切换线的连接点之间的集成流程中，这些连接点出现在下方的+图标中。

![](images/303/35.integration.if.add1.png)

![](images/303/35.integration.if.add2.png)

25.一旦映射正确放下，数据映射对话窗口就会显示出来。
    展开左窗格中的Source，将$ CustomerServiceActivity - > addCustomerActivityResponse下的返回字段拖放到右侧窗格中的activityid上。
点击imgurl继续进行数据映射。

    
![](images/303/36.integration.if.map.png)

26. 26.	显示Build Mappings窗口对话框.  
    在左窗格中的Source下展开“映射组件”，然后展开“函数” - >“字符串”。
    拖动函数fx concat并将其拖放到 - 在此处拖放或键入值...在右侧窗格中的映射下。
  
	
![](images/303/37.integration.if.map1.png)

27. 点击字string1，输入QR码的URL，但不包括“'符号，即 `'https://qrcodegenerator-<Your Application Container Cloud Identity Domain Hostname>/ctdqr/v1/offer/'`, 请注意不要忘记 把单引号放在URL的前面和末尾。 （从“微服务”实验室获得的主机名）
    接下来，展开左窗格中的Source，拖动offerid字段并将其放到string2上。 一个字符串被自动插入。 （这是'offerid'的XSLT变量表示）
单击保存，然后单击底部的关闭按钮返回上一个屏幕。


![](images/303/38.integration.if.map2.png)

28. 数据映射应如下所示。 单击验证，然后单击关闭。

![](images/303/39.integration.if.map3.png)

29. Process Offer集成流程开发已经完成。

![](images/303/40.integration.flow.complete.png)

30. 点击汉堡包图标，然后选择右上角的跟踪

![](images/303/42.integration.tracking.png)

31. 显示“跟踪业务标识符”对话窗口。 
    	消息的运行时事务跟踪需要业务标识符，尤其是当数百和数千个消息通过ICS运行时。
	注意跟踪业务标识符：customerid，offerid和productid已被映射。 屏幕如下所示。
	点击跟踪设置完成后底部的取消按钮关闭对话框。


![](images/303/43.integration.tracking.identifier1.png)

32. 点击保存并关闭按钮分别返回到ICS仪表板主屏幕。

![](images/303/43.integration.edit.done.png)

33.在“集成摘要”页面上，单击新创建的集成的“切换”按钮，激活集成？ 显示对话窗口.  
    选中“启用跟踪”和“包含有效内容”以供稍后测试，但建议不要在提供生产流量时启用。
   点击底部的激活按钮。


![](images/303/44.integration.activate.png)

34. 等待几分钟的集成激活.  
   一旦完成，告诉集成的绿色横幅已成功激活，结果如下所示：

![](images/303/45.integration.activate.done.png)

35. 从浏览器保存或复制到剪贴板的唯一网址：: `https://integration-xxxxxxxxxxx.integration.xxx.oraclecloud.com:443/integration/flowapi/rest/XXX_ICS_INTMGT/`

36. 集成服务现在已经准备好进行测试.

[Procced to Next - 304: Testing the service and Monitoring with ICS Dashboards](304-IntegrationsLab.md)

or

[Back to Integrations Lab Home](README.md)
