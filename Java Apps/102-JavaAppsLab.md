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

- **Configuration Name**: any name to identify deployment configuration - we use **loyalty**.
- **Application Name**: application name in JCS. This will determine the application's URL context path - we use **loyalty**.
- **Deployment Target**: click **New** and select Java Cloud Service and define connection properties such as **Version**, **Protocol**, **Host**, **HTTPS Port** and **credentials**.  
  [\(Find out the Java Cloud Service Host and HTTPS Port.\)](java.cloud.md).  
  Java Cloud Service - WebLogic Admin Username and Password, i.e. `weblogic` and `Welcome_1` respectively, or provided by instructor separately.
- **Type**: select **Automatic** which means auto deploy after a successful execution of the build job. Select your previously created job and its artifact to deploy.
- **Job**: The **LoyaltyManagementBuild** Build Step defined in early stage of this lab.
- **Arifact**: **loyalty/target/loyalty.war**, this is the only option available after **Job** is selected.

![alt text](images/102/12.deploy.config.png "Deployment Configuration")

![alt text](images/102/13.jcs.config.png "JCS Configuration")

![alt text](images/102/13.cert.png "Certificate Warning")   
  If you see the certificate warning, **Check** `Accept this certificate when connecting to this JCS instance` and click [**OK**]

![alt text](images/102/13.cluster.png "deploy to cluster")   
  **Check** `ctdCluster` and click [**OK**] to deploy the application to the Java Cloud Service cluster

11. Click **Save**. 

#### Build and deploy the Loyalty Management Application ####

12. To initiate a deployment to Java Cloud Service now there are two options. You can Start deployment process using the newly created Deployment configuration. Click gear icon and select **Start**.

![alt text](images/102/14.deploy.start.png "Deployment Start")

13. Other option is to fire a new Build Job execution which will deploy artifact after a successfull build. Go back to **Build** page and click the wrench icon belongs to Loyalty Management application build job.

![alt text](images/102/15.build.now.png "Build Now") 

14. Both way deploys JEE application on Java Cloud Service. You can check the deployment result on the **Deploy** page. Once the deploy is ready (this may take a while) click the **Deploy to JCS** link.

![alt text](images/102/16.deploy.ready.png "Deploy ready")

15. This opens the WebLogic Server Administration Console. Login with provided WebLogic Admin Username and password, i.e. `weblogic` and `Welcome_1` respectively.

![alt text](images/102/17.jcs.console.png)"WebLogic Console")

16. Once logged on, click **Deployments** on left navigation menu. You should see your Loyalty Management application **loyalty** in the Summary of Deployments list.

![alt text](images/102/17.deployment.png "Deployments")

17. The Loyalty Management application URL should be in the format of:  
    `https://**<JCS WLS instance IP Address>**/loyalty/jsp/welcome.jsp`, the JCS WLS instance IP address is the same as **Deploy to JCS** target in DevCS at step 12.

![alt text](images/102/18.sample.app.png "Loyalty Management Application")

18. There are many other options to trigger this deploy process. For example build can be triggered by source changes or can be scheduled to specific time of the day.  

You have finished this lab section.

[Procced to Next - 103: Continuous Integration & Delivery (CICD): Using Brackets, Commit and Push Code Changes to Oracle Developer Cloud Service](103-JavaAppsLab.md)

or

[Back to JavaAppsLab Home](README.md)
