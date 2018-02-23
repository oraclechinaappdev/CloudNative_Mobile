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

9. Expand the left nagivation tree and open `welcome.jsp` file (Under loyalty->src->main->webapp->jsp).  
On the main window, locate line 73 of welcome.jsp source code.

![](images/103/10.brackets.change.png)

14. Modify the following part:

  	<h2>Welcome to the Loyalty Manager !!</h2>

To what you would like to see on the page. For example:

	<h2><font color="red">APAC Test Drive</font> - Welcome to the Loyalty Manager !!</h2>

![](images/103/11.brackets.change1.png)

15. Save the file. (Press `Ctrl-S` or choose from pull-down menu `File` > `Save`)

![](images/103/12.brackets.save.png)

16. Check the box next to Commit to select all modified files - this means the checkbox below (welcome.jsp) will automatically be checked.  
Click `Commit` button.

![](images/103/13.brackets.commit.png)

17. In the pop-up enter the comment: `Changed header` and then click `OK` button. This will commit the changes to your LOCAL GIT REPOSITORY.

![](images/103/14.brackets.commit1.png)

18. Click `Git Push` icon.

![](images/103/15.brackets.commit2.png)

19. In the pop-up window, leave all defaults and click `OK` button at the bottom.

![](images/103/15.brackets.commit3.png)

20. Once Git Push completes, click `OK` button.

![](images/103/16.brackets.done.png)

#### Continuous Integration & Delivery (CICD) ####

18. Now change back to the browser and check the Build page in the Oracle Developer Cloud Service project. You should see that a new build (in our case: *LoyaltyManagementBuild*) has been fired by the Git changes.

![](images/103/21.png)

19. Once the job is done change to the tab to Deploy and you can see that a new deployment has been started too. If you remember the Deployment was configured to redeploy every time when a new successful build artifact is ready.

![](images/103/22.png)

20. Now check the changes of the home page of the Loyalty Management application. You should see the changes (red text) on the application's home page.  
    The Loyalty Management application URL should be in the format of:  
	`https://**<JCS WLS instance IP Adress>**/loyalty/jsp/welcome.jsp`, the JCS WLS instance IP address is the same as **Deploy to JCS** target in DevCS.

![](images/103/23.png)

You have finished this lab section.

[Back to JavaAppsLab Home](README.md)
