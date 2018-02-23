# ORACLE Cloud Test Drive #
-----
## 103:持续集成和交付（CI/CD）：使用Brackets，提交和推送代码更改到Oracle开发云服务 ##

### 介绍 ###
您可以从集成开发环境（IDE）或文本编辑器（如Brackets，Oracle Enterprise Pack for Eclipse（OEPE），Oracle JDeveloper和NetBeans IDE）访问Oracle开发云服务项目。 支架可以与Oracle开发云服务进行连接和交换，从而方便地在编辑器中公开最常见的云开发任务。

本教程演示如何:
- 使用带有Brackets的Oracle开发云服务执行简单的持续集成和交付

### 关于今天的练习 ###
在这个练习中，我们将:
- 从Brackets连接Oracle开发云服务，检出并更新项目源代码
- 提交并将更新后的Brackets源代码返回到开发云服务
- 查看Developer Cloud Service所做的持续集成和交付结果

### 先决条件 ###
+ [Create Oracle Developer Cloud Service project for Loyalty Management JEE application and deployed to Java Cloud Service WebLogic Server Container](102-JavaAppsLab.md)
+ [Installed Brackets and Git extension](brackets.md)

----

#### 连接并从Developer Cloud Service获取源代码 ####

1. 启动Brackets 文本编辑器, 在 `File` 下拉菜单, 选择 `Open Folder`.

![](images/103/02.openfolder.png)

2. 导航到选择目标目标目录以存储JEE源代码, 例如: `D:\oracle`
   创建一个 `New Folder`,然后将该新文件夹命名为 `LoyaltyManagement`.  
   保持 `LoyaltyManagement` 文件夹被选中 并点击底部的 `Select Folder` 按钮.

![](images/103/03.selectfolder.png)

3. 返回到开发云服务仪表板中的, 在你的 **LoyaltyManagement** Git 仓库.点击HTTP显示Git HTTP URL, 点击右边的方块复制按钮复制URL。

![](images/103/04.devcs.git.png)

4. 回到Bracket编辑器，点击编辑器右侧的GIT图标。

![](images/103/05.brackets.git.png)

5. 在“Git”面板中，单击“克隆”。

![](images/103/06.brackets.clone.png)

6. 粘贴您从Developer Cloud Service复制的GIT URL. 用户名应该自动填充. 输入密码并选择将凭证保存到远程URL。点击底部的确定按钮。

![](images/103/07.brackets.clone1.png)

7. 等待Brackets将您的远程项目克隆到本地文件夹.

![](images/103/08.brackets.clone2.png)

8. 你现在有一个Git仓库的本地副本。

![](images/103/09.brackets.clone3.png)

#### 提交和推送代码更改 ####

9. 展开左侧导航树并打开welcome.jsp文件（在loyalty-> src-> main-> webapp-> jsp下）。在主窗口中，找到welcome.jsp源代码的第73行

![](images/103/10.brackets.change.png)

10. 修改以下部分：

  	<h2>Welcome to the Loyalty Manager !!</h2>

到你想在页面上看到， 例如：

	<h2><font color="red">APAC Test Drive</font> - Welcome to the Loyalty Manager !!</h2>

![](images/103/11.brackets.change1.png)

11. 保存文件。 （按Ctrl-S或从下拉菜单File> Save中选择）

![](images/103/12.brackets.save.png)

12. 选中提交旁边的复选框，选择所有已修改的文件 - 这意味着下面的复选框（welcome.jsp）将自动被选中。
    点击提交按钮。

![](images/103/13.brackets.commit.png)

13. 在弹出的输入评论：更改标题，然后单击确定按钮。 这将会改变你的LOCAL GIT REPOSITORY。

![](images/103/14.brackets.commit1.png)

14. 点击Git Push图标。

![](images/103/15.brackets.commit2.png)

15. 在弹出窗口中，保留所有默认值，然后单击底部的确定按钮。

![](images/103/15.brackets.commit3.png)

16. 一旦Git推完成，点击确定按钮。

![](images/103/16.brackets.done.png)

#### 持续集成和交付(CI/CD) ####

18. 	现在回到浏览器并检查Oracle Developer Cloud Service项目中的Build页面。你应该看到一个新的构建（在我们的例子中：LoyaltyManagementBuild）已经被Git变更触发了.

![](images/103/21.png)

19. 作业完成后，切换到“部署”选项卡，您可以看到新部署也已启动。 如果您还记得部署已配置为每当新的成功构建工件准备就绪时重新部署。

![](images/103/22.png)

20. 	现在检查忠诚度管理应用程序主页的变化。 您应该在应用程序的主页上看到更改（红色文本）。
    忠诚度管理应用程序的URL应采用以下格式:  
	`https://**<JCS WLS instance IP Adress>**/loyalty/jsp/welcome.jsp`, the JCS WLS instance IP address is the same as **Deploy to JCS** target in DevCS.

![](images/103/23.png)

你已经完成了这个实验部分。

[Back to JavaAppsLab Home](README.md)
