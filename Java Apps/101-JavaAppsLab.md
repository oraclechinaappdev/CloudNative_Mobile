# ORACLE Cloud Test Drive #
-----
## 101: 使用初始GitHub存储库创建Oracle开发人员云服务忠诚度管理应用程序项目 ##

### 介绍 ###
本教程演示如何:
- 使用现有的外部Git存储库创建Oracle开发人员云服务项目 - GitHub

### 关于今天的运动 ###
在这个练习中，我们会:
- 为忠诚度管理系统创建一个新的开发者云服务项目
- 创建一个新的开发人员云服务Git存储库来存储忠诚度管理Java应用程序源代码
- 将存储在Github中的外部Git存储库克隆到上面的Developer Cloud Service Git存储库创建中

### 先决条件 ###
- 包含开发人员云服务的Oracle公有云服务帐户（如果您没有，请与教师联系）

----

#### 登录到Oracle Cloud ####

1. 打开浏览器并转到 [cloud.oracle.com](https://cloud.oracle.com). 点击 **Sign In**.
![cloud.oracle.com](images/sign-in/sign.01.cloud.oracle.com.png)

2. 根据你的环境的数据中心选择 `Traditional Cloud Account`, 然后选择    
    `Public Cloud Service - EMEA`   
or    
    `Public Cloud Servce - US`    
  点击 **My Services** 按钮.
![](images/sign-in/sign.02.select.datacenter1.png)

3.进入 **Developer Cloud Service \(DevCS\)** 身份领域并且点击 **Go**. 身份领域和相关凭证应由教师提供.
![](images/sign-in/sign.03.identity.domain.png)

4. 输入带有Service Administrator 角色的用户  DevCS username and password . 点击 **Sign In**.
![](images/sign-in/sign.04.credentials.png)

5.成功登录后，您将看到您的仪表板.  
在仪表板上，有不同服务的预定义图块. 如果 **Developer Cloud Service** 标题没有出现, 点击 **Customize Dashboard** 并且标记 **developer** 服务以便在仪表板上显示.
![](images/sign-in/sign.05.dashboard.new.png)
![](images/sign-in/sign.06.customize.png)

#### 创建Oracle开发人员云服务项目 ####

6.现在，找到Developer Service磁贴，然后点击汉堡包图标.在下拉菜单中点击 **Open Service Console**.

![](images/101/01.dashboard.new.png)

7. 登陆进入 Oracle Developer Cloud Service 并创建一个新项目.

![alt text](images/101/02.new.project.png)

8. 输入项目的名称并设置所需的属性.   
	**Name:** `APAC Cloud Test Drive`   
	**Description:** `APAC Cloud Test Drive project hub`   
	and click **Next**

![](images/101/02.new.project.detail.png)

9. 选择 *Empty Project*作为模板并点击 **Next**

![](images/101/03.emptyproject.png)

10. 选择 `MARKDOWN`作为Wiki标记并单击 **Finish**

![](images/101/04.finish.png)

11. **等待** 为开发人员云服务项目进行了预配置.

![](images/101/05.wait.png)

12. 项目准备就绪后，您将看到项目主屏幕. 在右侧窗格中,确保你在 `Repositories` 标签. 点击 [ **+ New Repository** ] 按钮 去创建新的 Git 仓库.

![](images/101/06.newrepo.png)

13.为New Repository输入以下信息   
   Name: `LoyaltyManagement`   
	 Initial content: select `Import existing repository`   
   进入并且复制 `https://github.com/APACTestDrive/LoyaltyManagement.git` 作为存储库地址.   
点击 [ **Create** ] 按钮

![](images/101/07.repoinfo.png)

14. 您现在已经创建了一个新的Git存储库，其中存储了基于现有存储库的开发人员云服务中的源代码.

![](images/101/08.repocreated.png)


您已完成本实验部分.

[Procced to Next - 102: Define Continuous Integration 'Build' and 'Deploy' Configuration in Oracle Developer Cloud Service](102-JavaAppsLab.md)

or

[Back to JavaAppsLab Home](README.md)
