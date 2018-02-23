# ORACLE Cloud Test Drive #
-----
## 102: 在Oracle Developer Cloud Service中定义持续集成“构建”和“部署”配置 ##

### 2.2.1	介绍 ###
本教程演示如何:
- 使用Oracle开发云服务将忠诚度管理应用程序部署到Java Cloud Service,忠诚度管理应用程序是一个使用简单JSP页面构建的JEE Web应用程序，用于使营销经理能够创建优惠活动。  

### 关于练习 ###
在这个练习中，我们将:
- 为忠诚度管理配置构建作业 - 一个JEE应用程序
- 配置Java Cloud Service - Developer Cloud Service中的WebLogic Server部署
- 使用开发云服务构建和部署忠诚度管理应用程序

### 先决条件 ###
+ Oracle公有云服务帐户，包括开发云服务和Java云服务
+ [为忠诚度管理JEE应用程序创建Oracle开发者云服务项目](101-JavaAppsLab.md)

----

#### 2.2.4.1	配置忠诚度管理应用程序的构建作业 ###

1. 继上一个实验101之后，一旦项目供应就绪，我们就可以创建构建作业，将忠诚度管理 - JEE应用程序编译并打包为Java云服务所需的格式.

2. 选择左侧菜单上的Build条目，然后单击New Job按钮.

![alt text](images/102/05.new.job.png "Create new build job")

3. 为新工作输入名字LoyaltyManagementBuild。 选择创建一个自由风格的作业选项并保存。 在新创建的作业的主配置页面上，确保**默认（执行环境中的默认Java版本）**是选定的JDK。.

![alt text](images/102/06.job.main.png "Configure job")

4. 切换到 **Source Control** 标签页并且选择 **Git**. 
在git的属性部分中，选择列表中提供的唯一一个可用的Git存储库.
在分支部分，在列表中添加并选择**master**选项。 这是为了确保只有**Master**分支版本将被使用。 保留高级设置默认。

![alt text](images/102/07.job.scm.png "Configure source control")

5. 单击 **Triggers** 选项卡以配置**SCM polling schedule**. 选择 **Based on SCM polling schedule**. 这确保了如果源代码库中的任何文件已经改变，那么构建将被触发。

![alt text](images/102/07.scm.trigger.png "Configure source control")

6. 更改为 **Build Steps** 选项卡并添加**Maven 3**构建步骤. 输入 **clean install** 作为目标 和输入 **loyalty/pom.xml** 到 POM File field. (如果“构建步骤”选项卡长时间显示正在**加载...** ，请保存构建配置，然后重新打开并继续。)

![alt text](images/102/08.job.maven.png "Add build step")

7. 最后切换到Post Build选项卡，并检入 **Archive the artifacts** 选项. 输入 **loyalty/target/\*.war** 到 **Files To Archive** 字段.

![alt text](images/102/09.job.post.png "Post build")

8. 点击**Save** 以更新新的作业配置. 要检查构建作业 请在作业的详细信息页面上单击**Build Now**. 一旦工作完成，检查存档的工件。 它应该是以下内容: `loyalty.war`

![alt text](images/102/10.build.artifacts.png "Build artifacts")

请注意构建作业包含一个额外的构建步骤，将主要忠诚度管理Web应用程序源文件打包成一个JEE Web应用程序归档（WAR）文件loyalty.war。 该归档文件是将Java Web应用程序部署到JCS所需的格式。

#### 配置Java云服务部署 ####

9. 现在，创建部署配置，以便在成功构建作业后直接部署到Java Cloud Service。 
在DevCS切换到 **Deploy** 页  并且创建 **New Configuration** 

![alt text](images/102/11.new.deploy.png "New deploy configuration")

10.	设置以下属性.

- **Configuration Name**: 任何名称来标识部署配置 - 我们使用 **loyalty**.
- **Application Name**:JCS中的应用程序名称。 这将决定应用程序的URL上下文路径 - 我们使用 **loyalty**.
- **Deployment Target**: 单击**New** 并选择Java Cloud Service并定义连接属性，例如**版本**，**协议**，**主机**，**HTTPS端口**和**凭证**.  
  [\(Find out the Java Cloud Service Host and HTTPS Port.\)](java.cloud.md).  
  Java Cloud Service - WebLogic管理员用户名和密码，分别为weblogic和Welcome_1，或由教师单独提供。
- **Type**: 选择 **Automatic** 意味着成功执行构建作业后自动部署。 选择您以前创建的作业及其工件进行部署。
- **Job**: The **LoyaltyManagementBuild** 在本实验的早期阶段定义的LoyaltyManagementBuild构建步骤.
- **Arifact**: **loyalty/target/loyalty.war**, 这是**Job**选择后的唯一选项.

![alt text](images/102/12.deploy.config.png "Deployment Configuration")

![alt text](images/102/13.jcs.config.png "JCS Configuration")

![alt text](images/102/13.cert.png "Certificate Warning")   
  如果看到证书警告，请在连接到此JCS实例时选中接受此证书，然后单击**确定**

![alt text](images/102/13.cluster.png "deploy to cluster")   
  **检查**ctdCluster，然后单击[**OK**]将应用程序部署到Java Cloud Service群集

11. 点击 **Save**. 

#### 建立和部署忠诚度管理应用程序 ####

12. 要立即启动到Java Cloud Service的部署，有两个选项。 您可以使用新创建的Deployment配置启动部署过程。 点击齿轮图标，然后选择 **Start**.

![alt text](images/102/14.deploy.start.png "Deployment Start")

13. 其他选项是启动一个新的生成作业执行，这将成功构建后部署工件。 返回到**Build**页面，然后单击属于“忠诚度管理”应用程序构建作业的扳手图标。

![alt text](images/102/15.build.now.png "Build Now") 

14. 这两种方式都在Java Cloud Service上部署JEE应用程序。 您可以在“部署”页面上检查部署结果。 部署准备就绪后（可能需要一段时间），请单击“部署到JCS”链接。

![alt text](images/102/16.deploy.ready.png "Deploy ready")

15.这将打开WebLogic Server管理控制台。 使用提供的WebLogic Admin用户名和密码登录，即分别使用weblogic和Welcome_1。

![alt text](images/102/17.jcs.console.png)"WebLogic Console")

16.登录后，点击左侧导航菜单上的部署。 您应该在“部署摘要”列表中看到您的“忠诚度管理”应用程序的忠诚度。

![alt text](images/102/17.deployment.png "Deployments")

17. 忠诚度管理应用程序的URL应采用以下格式：:  
    `https://**<JCS WLS instance IP Address>**/loyalty/jsp/welcome.jsp`, JCS WLS实例IP地址与在步骤12中在DevCS中部署到JCS目标相同.

![alt text](images/102/18.sample.app.png "Loyalty Management Application")

18. 还有很多其他的选项可以触发这个部署过程。 例如，构建可以由源更改触发，也可以安排到一天的特定时间。  

您已完成本实验部分。

[Procced to Next - 103: Continuous Integration & Delivery (CICD): Using Brackets, Commit and Push Code Changes to Oracle Developer Cloud Service](103-JavaAppsLab.md)

or

[Back to JavaAppsLab Home](README.md)
