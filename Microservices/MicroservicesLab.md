Update: July 5, 2017

## 0.1 介绍

此实验室是亚太地区云测试驱动器的一部分，是关于创建微服务的第二个实验室

## 0.2 目标

- 从外部的Git仓库导入代码
- 使用开发人员云服务和Oracle应用程序容器云服务构建和部署项目

## 0.3 所需的工件

- 以下实验需要Oracle公有云帐户，该帐户将由您自己应用或由您的教师提供.
- IDE环境和GIT客户端在您的本地计算机上的实验室。 说明假定您在本地主机中使用“Brackets编辑器”。 前面的实验中已经介绍了安装Brackets Editor的细节，在这里也可以找到[here](../Java%20Apps/brackets.md).

## 0.4 特别提示

- 复制粘贴时请注意。 在复制信息之前或之后的其他WHITE SPACE可能会导致错误.

# 1. 创建Offer REST API微服务

## 1.1 创建初始 Git仓库 - Offer REST API

1. 如果您尚未登录到开发者云服务，请登录。 如果您位于Cloud Dashboard中，则可以使用Developer Cloud Service汉堡菜单导航到DevCS.

![](images/001.dashboard.png)

2. 开发者云服务登陆页面应该显示我们在之前的实验中创建的项目。 只需点击项目名称，然后导航到项目主页面.

![](images/001.landing.png)

3. **如果您已经在Developer Cloud Service中，则可以通过单击左侧导航面板中的“项目”来转到项目主页面**  

![](images/002.createrepo.png)

4. 在REPOSITORIES部分的右侧，单击New Repository创建一个新的Git Repository.

5. 5.	在New Repository向导中输入以下信息，然后单击**Create**.

	- **Name:** `OfferMicroservice`
	- **Description:** `Microservice to provide REST API of Offer Details`
	- **Initial content:** `Import existing repository`
	- **Enter the URL:** `https://github.com/APACTestDrive/OfferMicroservice.git`

```diff
-请注意，复制粘贴时，您没有在信息之前或之后添加额外的空白区域
```

![](images/003.newrepo.png)

6. 现在，您已经在Developer Cloud Service中创建了一个新的Git存储库，该存储库基于现有的存储库

![](images/004.repo.png)

## 1.2 创建默认的构建和部署过程 – offer REST API

现在，我们在开发人员云服务托管的Git存储库中有源代码，我们需要创建一个构建过程，只要向主分支提交，就会触发这个过程。 我们将在本节中设置一个**shell Script**构建过程。.

### 1.2.1创建默认构建过程 - 提供REST API

1. 单击导航面板上的**Build**以访问构建页面，然后单击 **[+ New Job]**

![](images/005.navibuild.png)

2. 在New Job弹出窗口中，输入Offer REST API Build for Job Name，然后单击Save.

```diff
-请注意，您没有在信息之前或之后添加额外的空白区域
```

![](images/006.newbuildjob.png)

3. 现在被放入作业配置屏幕.

![](images/007.newjob.png)

4. 单击源代码管理选项卡。 选择Git单选按钮。 在存储库部分，从URL下拉列表中选择OfferMicroservice.git.

![](images/008.srcctrl.png)

  ****注意**：请确保您为Offer REST API Microservice选择了Git存储库.

5. 点击触发器标签。 检查基于SCM轮询时间表.

![](images/009.trigger.png)

6. 单击Build Steps选项卡，单击Add Build Step并选择Execute shell.

![](images/010.steps.png)

7.  在Command textarea中，输入：npm install

![](images/011.npm.png)

8.  点击Post Build选项卡。 检查存档的文物。 对于要归档的文件，请输入** / target / *并验证GZIP被选择为压缩类型。

![](images/012.post.png)

9. 单击保存以完成配置.

![](images/013.save.png)

10. 构建应该在1-2分钟内自动启动。 如果没有自动启动，请点击 **[Build Now]** 按钮.

![](images/014.buildnow.png)

11. 状态将改变为类似于下面的图表.

![](images/015.queue.png)

在构建作业开始之前，您可能需要等待几分钟。

![](images/016.running.png)

12. 构建将需要几分钟才能完成。在继续下一步之前，等待构建完成 - **因为我们需要构建工件来创建部署配置**。

![](images/017.complete.png)

### 1.2.2 创建默认部署流程 - 提供REST API

1. 1.	单击部署访问部署页面，然后单击 **[+ New Configuration]** 按钮。.

![](images/018.navideploy.png)

2. 输入以下数据:

	- **Configuration Name:** OfferAPIDeploy
	- **Application Name:** offer

```diff
-请注意，在复制粘贴时，您没有在信息的前面或后面添加额外的空白区域
```

![](images/019.deployname.png)

3. 在**Deployment Target**的右侧旁边 , 点击 **[New]** 按钮 并且选择 **Application Container Cloud...**

![](images/020.deployaccs.png)

4. 4.	输入以下信息并单击**Test Connection**.

	- **Data Center:** `你的数据中心, e.g. em2, em3, etc`
	- **Identity Domain:** `你的身份域`, e.g. gse00012345, etc
	- **Username:** `登陆MyService的用户名`, e.g. lisa.jones, etc - that is the username you are using.
	- **Password:** `用户的密码`, 即您使用的密码

![](images/021.accsconn.png)

5. 如果成功，请单击 **[Use Connection]** 按钮 

![](images/022.useconn.png)

6. 在“ACCS属性”中设置

	- **Runtime** to `Node`
	- **Subscription** to `Hourly`
	- Set **Type** to `Automatic` and **CHECK** Deploy stable build only

  **再次检查 Runtime 是Node**

![](images/023.deploynodejs.png)

7. 从**Job**中选择，该名称应该与上面的构建作业匹配，例如 提供REST API构建`

8.从Artifact中选择，该名称应与上面的存档工件和源代码的package.json相匹配，例如target/ offer.zip。

![](images/024.deployjobname.png)

9.  **检查** the `Include ACCS Deployment` box 然后添加下面的json.

```json
{
	"memory":"1G",
	"instances":"1",
	"services": [
	{
	  "identifier": "DBService",
	  "type": "DBAAS",
	  "name": "apacctddb",
	  "username": "loyalty",
	  "password": "Welcome_1"
	}
	]
}
```

![](images/024.json.png)

10. 填写完上述信息后，点击**Save** 按钮.

![](images/025.deploysave.png)

11. 在部署作业中，单击齿轮下拉菜单并选择**Start **

![](images/026.deploystart.png)

12. 部署作业将被放入队列进行处理。 等待直到消息 **Starting application** 变成 **Last deployment succeeded**.如果部署失败，请向导师寻求帮助。

![](images/027.deploysuccess.png)

## 1.3  登录到Oracle Application Container Cloud Service

1. 导航回到Oracle公有云MyService。. 点击 **Dashboard** 返回到主要Cloud Service仪表板.

![](images/028.dashboard.png)

2. 在应用程序容器云服务（ACCESS）上，单击汉堡按钮并选择**Open Service Console**

![](images/029.accsgoto.png)

3. 在ACCS服务控制台上，您可以查看所有已部署的应用程序，包括我们新创建的 **Offer**.

![](images/030.accsconsole.png)

## 1.4 检查ACCS服务绑定到DBCS

1. 单击 **[ Offer ]** 查看ACCS应用程序详细信息

![](images/031.accsoffer.png)

2. 检查第二个选项卡，部署

![](images/032.bindings.png)

3. 在 **Service Bindings** 部分, 你应该看到数据库绑定。 ** 你不需要改变任何东西** 

![](images/033.addbinding.png)


## 1.5 验证工作的服务

1. 在您的应用程序面板中，您应该看到您的应用程序的基本URL。就像 https://offer-{your-identity-domain}.apaas.{your-data-center}.oraclecloud.com

![](images/037.url.png)

2.将该网址复制并粘贴到新选项卡的地址栏中，以启动该应用程序.

 请注意，您需要REST端点和**Offer ID** 才能生成QR码。

 最终的网址应该如下所示

https://offer-{your-identity-domain}.apaas.{your-data-center}.oraclecloud.com/ptmgt/v1/offers/10001

![](images/038.browser.png)

```diff
+ 您可能需要复制您提供API的OWN网址，例如.
+   https://offer-{your-identity-domain}.apaas.{your-data-center}.oraclecloud.com/ptmgt/v1/offers/
+   https://offer-{your-identity-domain}.apaas.{your-data-center}.oraclecloud.com/
+ 并放入，例如 记事本
+   您需要稍后使用，例如 Lab 401.
```

3. 你应该能够从微服务获得提供的细节.

![](images/039.result.png)

4. 恭喜！ 你已经完成了第一个微服务。 让我们继续看QR码微服务，它实际上与第1部分非常相似。

# 2. 创建QR码生成器 微服务

## 2.1 创建初始 Git仓库 - Offer REST API

1. 如果您尚未登录到开发者云服务，请登录。.
2. 2.	在左侧导航面板中，单击**Project**

![](images/101.project.png)

3. 3.	在REPOSITORIES部分的右侧，单击New Repository创建一个新的Git Repository。.

![](images/102.newrepo.png)

4. 4.	在New Repository向导中输入以下信息，然后单击**Create**.

  - **Name:** `QRCodeMicroservice`
  - **Description:** `Microservice to generate Offer QR Code. The QR Code will contains an URL of the actual Offer.`
  - **Initial content:** `Import existing repository`
  - **Enter the URL:** `https://github.com/APACTestDrive/QRCodeMicroservice.git`

```diff
-请注意，复制粘贴时，您没有在信息之前或之后添加额外的空白区域
```

![](images/103.repoclone.png)

5. 现在，您已经在Developer Cloud Service中创建了一个新的Git存储库，该存储库基于现有的存储库。

![](images/104.repocreated.png)

## 2.2 修改示例程序代码以反映您自己的环境

### 2.2.1 克隆项目到 Bracket 文本编辑器

本实验室假定您已经直接连接到公共互联网，即不在代理之后

1. Start Brackets Text Editor, by double click the **Brackets** desktop icon, [Start] Menu button, or the correspond short-cut in your computer.

![](images/110.startbrackets.png)

2. In the **File** pull-down menu, choose **Open Folder**

![](images/111.open.png)

3. Select a desired folder to store the source code in your local harddisk, e.g. **d:\oracle** in the left hand side and click **[Create Folder]** at the top right hand corner - `this will create a new folder under the folder you've selected`.

![](images/112.createfolder.png)

4. Enter **QRCodeMicroservice** as the folder name. Then Click any space (e.g. in the size column) next to the name

![](images/113.gotofolder.png)

5. Click **[ Open ]** button to open the newly created project folder.

![](images/114.opennew.png)

6. Back in **Developer Cloud Service**, in your **QRCodeMicroservice Git Repository**. Click **HTTP** to display the Git HTTP URL, click the **Copy** button to copy the URL.

![](images/115.copyurl.png)

7. Back in the Bracket editor, click on **GIT** icon on the right hand side of the editor.

![](images/116.gitbutton.png)

8. In the Git panel, click **[ Clone ]**

![](images/117.gitclone.png)

9. Paste the GIT URL that you copied from Developer Cloud Service. Username should be populated automatically. Enter the password and select **Save credentials to remote url**

10. Click **[OK]** button

![](images/118.gitlogin.png)

11. Wait for Brackets to clone your remote project to local folder.

![](images/119.gitwaitclone.png)

12. You now have a local copy of the Git Repository.

![](images/120.cloned.png)

### 2.2.2 Edit the source code to fit your environment

1. Open the server.js file (double click) in Brackets

![](images/121.openjs.png)

2. In line 12, change the URL to your identity domain, i.e. what you have used in **Section 1.5**. As you can see, this is the URL of the **Offer REST API Microservice**

![](images/122.line12.png)

3. Save the file. (**Ctrl-S** or choose from pull-down menu **File > Save**)

![](images/123.save.png)

### 2.2.3 Create a new Branch and Commit

1. In the left hand navigation panel, select **master** and click **Create new branch...**

![](images/124.branch.png)

2. In the pop-up window, enter `ChangeURL` for branch name and click **Ok**

![](images/125.changeurl.png)

3. Check the box next to **Commit** to select all modified files - this means the checkbox below (server.js) will automatically be checked.

![](images/126.commitcheck.png)

4. Click **Commit**

![](images/127.commit.png)

5. In the pop-up enter the **comment** `modify source code to use correct URL` and click **OK**. This will commit the changes to your LOCAL GIT REPOSITORY. (You can ignore the code inspection problems. You can review the code changes before confirmation)

![](images/128.commitmsg.png)

6. Click **Git Push** icon.

![](images/129.push.png)

7. In the pop-up window, leave all defaults and click **Ok**.

![](images/130.pushok.png)

8. Once Git Push completes, click **Ok**

![](images/131.pushdone.png)

9. You have push the changes to Developer Cloud Service. If you like, you can go to **Developer Cloud Service** to check the pushed branch. You will something like this.

![](images/132.newbranch.png)

### 2.2.4 Create Merge Request in Developer Cloud Service to uptake the code

1. In Developer Cloud Service, click on **Code** tab. If you are not viewing the QRCodeMicroservice repo, change to the QRCode Repo.  

![](images/141.checkbranch.png)

2. Select ChangeURL branch

![](images/142.changeurlbranch.png)

3. Once you are in the ChangeURL branch. You should be able to view the recent commit that we made to branch from Brackets.

![](images/143.changes.png)

4. Now, a merge request can be created to merge the code - click on **Merge Requests** to go the merge request panel.

![](images/144.mergereq.png)

5. and then click on the **New Merge Request** button.

![](images/145.newmerge.png)

6. Enter the following information into the new merge request and click **Next**

  - **Repository:** `QRCodeMicroservice.git`
  - **Target Branch:** `master`
  -	**Review Branch:** `ChangeURL`

![](images/146.createreq.png)

7. Enter for following information into **Details** and click **Next**

  - **Summary:** `Merge Request for branch ChangeURL`
  - **Reviewers:** `Choose the user you are working on` (e.g. Cloud Admin, John Dunbar, etc)

![](images/147.req2.png)

8. Review the request and click **[+ Create]** button.

![](images/148.reqcreate.png)

9. Now, the merge request has been created. We will approve the request in the next section.

### 2.2.5 Merge the Branch

1. click on the **Merge Request**. Select the request we just created and we can review the request.

![](images/151.requestdetails.png)

2. Once the request has loaded, select **Change Files** tab. Review the changes. You can add your comment before approve the request.

![](images/152.changedfiles.png)

3. if you like you can click the **[Approve]** button to add comments

![](images/153.approve.png)

4. Enter some comments, e.g. `approved` and click **OK**.

![](images/154.approvmsg.png)

5. You can see the request is now approved by reviewer. Click **Merge** button to proceed merging

![](images/155.clickmerge.png)

6. leave the defaults OR enter your desired comment. If you check **Delete branch**, the ChangeURL branch will be deleted after the merging. Click on **Create a Merge Commit** button.

![](images/156.commitmerge.png)

7. Now the code merge had been committed and we can build the microservice. 	

![](images/157.merged.png)

## 2.3 Create Default Build and Deployment Process - QR Code Generator

Now that we have the source code in our Developer Cloud Service managed Git Repository, we need to create a build process that will be triggered whenever a commit is made to the master branch. We will setup a **shell script** build process in this section.

### 2.3.1 Create Default Build Process - QR Code Generator

1. Click **Build** on the navigation panel to access the build page

![](images/161.navibuild.png)

2. Click **[+ New Job]**

![](images/162.createnewbuild.png)

3. In the New Job popup window, enter `QR Code Generator Build` for Job Name and click **Save**.

```diff
-Please BE CAREFUL that you have not added extra white space before or after the information when copy-n-paste
```

![](images/163.newjob.png)

4. You are now placed into the job configuration screen.

![](images/164.buildscreen.png)

5. Click the **Source Control** tab. Select **Git** radio button. In the Repositories section, select **QRCodeMicroservice.git** from the URL drop down.

	**Note:** Make sure you select the Git repository for the QR Code Microservice.

![](images/165.srcctrl.png)

6. Click **Triggers** tab. Check **Based on SCM polling schedule**.

![](images/166.trigger.png)

7. Click the **Build Steps** tab, click **Add Build Step** and select **Execute shell**.

![](images/167.stage.png)

8. In the Command textarea, enter: `npm install`

![](images/168.npm.png)

9. Click the **Post Build** tab. Check **Archive the artifacts**. For File to Archive, enter `**/target/*` and verify **GZIP** is chosen as the Compression Type.

![](images/169.pb1.png)

10. Click **Save** to complete the configuration.

![](images/170.pbsave.png)

11. A build should start automatically within 1-2 minutes. If it does not start automatically, click on the **[ Build Now ]** button.

![](images/171.now.png)

12. The status will change to something similar to the following diagram.

![](images/172.queue.png)

Building stage: please wait - it might takes a few minutes before the job change form queued to running

![](images/173.building.png)

13. The build will take serval minutes to complete. Wait for the build to complete before continue to the next step - **as we need the build artifact to create the deployment configuration**.

![](images/174.buildsuccess.png)

### 2.3.2 Create Default Deployment Process - QR Code Generator

1. Click **Deploy** to access the Deployments page

![](images/181.navideploy.png)

2. Click the **[+ New Configuration]** button.

![](images/182.newdeploy.png)

3. Enter the following data:

  - **Configuration Name:** QRCodeGeneratorDeploy
  - **Application Name:** qrcodegenerator

![](images/183.createdeploy.png)

4. **As you have created the deployment in the Offer REST API
Microservice, you can REUSE the same target**.

   In the **Deployment Target**, choose the **SAME** one you created above. It should be something similar to `Application Container Cloud` **em2 / your-identity-domain / your-user-name**

![](images/184.dc.png)

5. A window **Deploy to Application Container Cloud** will popup, confirm the information and **ENTER the password**, then click **[Test Connection]** button.   

  - **Data Center:** `your datacenter, e.g. em2, em3, etc`
  - **Identity Domain:** `your identity domain, e.g. gse00012345, etc`
  - **Username:** `username to login to MyService, e.g. cloud.admin, etc`
  - **Password:** `password of the cloud user`

![](images/185.test.png)

6. Once test is success, click **Use Connection**

![](images/186.testgood.png)

7. In the ACCS Properties, set

  - **Runtime** to `Node`
  - **Subscription** to `Hourly`
  - Set **Type** to `Automatic` and **CHECK** `Deploy stable build only`

**MAKE sure you select Node as the Runtime**

![](images/187.choosenode.png)

8. Select from the **Job**, this name should match the build job above, e.g. `QR Code Generator Build`. Select from the **Artifact**, this name should match the archive artifact above and the package.json of your source code, e.g. `target/qrcodegenerator.zip`  

![](images/188.choosejob.png)

9. Check `Include ACCS Deployment` box and enter the following json

```json
{
	"memory":"1G",
	"instances":"1"
}
```

![](images/024.json.11.png)

10. After fill in the above information, click **Save** button.

![](images/189.depsave.png)

11. In your deployment job, click the gear drop down and select **Start**

![](images/190.start.png)

12. The deployment job will be put into a queue for process. Wait until the message **Starting application** changes to **Last deployment succeeded**. Ask for help from your instructor if the deployment fails.

![](images/191.deployed.png)

## 2.4 Login to Oracle Application Container Cloud Service

1. Navigate back to the Oracle Public Cloud tab. Click **Dashboard** to return back to main Cloud Service Dashboard.

2. On the Application Container Cloud Service (ACCS) click the humburger button and select **Open Service Console**

![](images/192.accs.png)

3. On the ACCS Service Console you can view all the deployed applications including our newly create **qrcodegenerator**.

![](images/193.accsqr.png)

4. Copy the URL and paste it into the address bar of a new tab to bring up the application.

  Be reminded that you will need the REST endpoint and the **offer id** in order to generate a QR code.

  The final URL should looks like this

	https://qrcodegenerator-{your-identity-domain}.apaas.{your-data-center}.oraclecloud.com/ctdqr/v1/offer/10001

![](images/194.qrurl.png)		

5. the QR Code in the browser will look like this

![](images/195.codepic.png)

```diff
+ you might want to copy your OWN URLs for QR Code API
+   https://qrcodegenerator-{your-identity-domain}.apaas.{your-data-center}.oraclecloud.com/ctdqr/v1/offer/
+   https://qrcodegenerator-{your-identity-domain}.apaas.{your-data-center}.oraclecloud.com
+ and put it in, e.g. Notepad
+   You will need to use it later, e.g. Lab 304 Step 27.
```

**OPTIONAL STEP:** if you use a QR Code reader (e.g. Mobile App), you can decode the QR Code

![](images/196.reader.png)

# Congratulation! You've completed the Microservice Lab.

[go back to the Cloud Test Drive Main Page](../README.md)
