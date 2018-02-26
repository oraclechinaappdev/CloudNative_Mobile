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

1. 通过双击Brackets 桌面图标，[开始]菜单按钮或计算机中对应的快捷方式，启动Brackets 文本编辑器。

![](images/110.startbrackets.png)

2. 在文件下拉菜单中，选择打开文件夹

![](images/111.open.png)

3. 选择所需的文件夹以将源代码存储在本地硬盘中，例如 d：\ oracle，点击右上角的[创建文件夹] - 这将在您选择的文件夹下创建一个新的文件夹。

![](images/112.createfolder.png)

4. 4.	输入QRCodeMicroservice作为文件夹名称。 然后单击名称旁边的任何空格（例如，在大小列中）

![](images/113.gotofolder.png)

5. 点击[打开]按钮打开新创建的项目文件夹。

![](images/114.opennew.png)

6. 回到Developer Cloud Service，在你的QRCodeMicroservice Git Repository中。 点击HTTP显示Git HTTP URL，点击Copy按钮复制URL。

![](images/115.copyurl.png)

7. 回到Bracket编辑器，点击编辑器右侧的GIT图标。

![](images/116.gitbutton.png)

8. 在Git面板中，点击[Clone]

![](images/117.gitclone.png)

9. 粘贴您从Developer Cloud Service复制的GIT URL。 用户名应该自动填充。 输入密码并选择将凭证保存到远程URL

10. 点击 [OK] 按钮

![](images/118.gitlogin.png)

11. 等待Brackets 将您的远程项目克隆到本地文件夹。

![](images/119.gitwaitclone.png)

12. 你现在有一个Git仓库的本地副本。

![](images/120.cloned.png)

### 2.2.2 编辑源代码以适合您的环境

1. 在Brackets中打开server.js文件（双击）

![](images/121.openjs.png)

2. 在第12行中，将URL更改为您的身份域，即您在第1.5节中使用的内容。 如您所见，这是Offer REST API Microservice的URL

![](images/122.line12.png)

3. 保存文件。 （Ctrl-S或从下拉菜单中选择File> Save）

![](images/123.save.png)

### 2.2.3 创建一个新的分支并且提交

1. 在左侧导航面板中，选择主控并单击创建新分支...

![](images/124.branch.png)

2. 在弹出窗口中，输入ChangeURL作为分支名称，然后单击确定

![](images/125.changeurl.png)

3. 选中提交旁边的复选框，选择所有已修改的文件 - 这意味着下面的复选框（server.js）将被自动选中。

![](images/126.commitcheck.png)

4. 点击提交

![](images/127.commit.png)

5. 在弹出的输入注释“modify source code to use correct URL”，然后单击确定。 这将会改变你的LOCAL GIT REPOSITORY。 （您可以忽略代码检查问题，您可以在确认之前查看代码更改）

![](images/128.commitmsg.png)

6. 点击Git Push图标。

![](images/129.push.png)

7. 在弹出窗口中，保留所有默认值，然后单击确定。

![](images/130.pushok.png)

8. 一旦Git推完成，点击确定

![](images/131.pushdone.png)

9. 您已将更改推送到开发人员云服务。 如果你愿意，你可以去Developer Cloud Service检查推送的分支。 你会这样的。

![](images/132.newbranch.png)

### 2.2.4 在开发者云服务中创建合并请求并更新代码。

1. 在开发人员云服务中，单击代码选项卡。 如果您没有查看QRCodeMicroservice仓库，请更改为QRCode仓库。  

![](images/141.checkbranch.png)

2. 选择ChangeURL分支

![](images/142.changeurlbranch.png)

3. 一旦你在ChangeURL分支。 你应该能够查看我们最近从Brackets分支的提交。

![](images/143.changes.png)

4. 现在，可以创建合并请求来合并代码 - 单击合并请求以进入合并请求面板。

![](images/144.mergereq.png)

5. 然后单击新建合并请求按钮。

![](images/145.newmerge.png)

6. 在新的合并请求中输入以下信息，然后单击下一步

  - **Repository:** `QRCodeMicroservice.git`
  - **Target Branch:** `master`
  -	**Review Branch:** `ChangeURL`

![](images/146.createreq.png)

7. 输入以下信息到详细信息中，然后单击下一步

  - **Summary:** `Merge Request for branch ChangeURL`
  - **Reviewers:** `Choose the user you are working on` (e.g. Cloud Admin, John Dunbar, etc)

![](images/147.req2.png)

8. 查看请求并单击[+Create]按钮。

![](images/148.reqcreate.png)

9. 现在，合并请求已经创建。 我们将在下一部分中批准这个请求。

### 2.2.5 合并分支

1. 点击合并请求。 选择我们刚刚创建的请求，我们可以查看请求。

![](images/151.requestdetails.png)

2. 请求加载后，选择更改文件选项卡。 查看更改。 您可以在批准请求之前添加您的评论。

![](images/152.changedfiles.png)

3. 如果你喜欢，你可以点击[批准]按钮添加评论

![](images/153.approve.png)

4. 输入一些意见，例如 批准，然后单击确定。

![](images/154.approvmsg.png)

5. 您可以看到请求现在已被审阅者批准。 单击合并按钮继续合并
![](images/155.clickmerge.png)

6. 保留默认值或输入您想要的评论。 如果选中删除分支，则合并后将删除ChangeURL分支。 点击创建一个合并提交按钮。

![](images/156.commitmerge.png)

7. 现在代码合并已经提交，我们可以构建微服务。	

![](images/157.merged.png)

## 2.3 创建默认的构建和部署过程 - QR码生成器
现在，我们在开发人员云服务托管的Git存储库中有源代码，我们需要创建一个构建过程，只要向主分支提交，就会触发这个过程。 我们将在本节中设置一个shell脚本构建过程。

### 2.3.1 创建默认的构建流程 - QR码生成器

1. 单击导航面板上的“Build”以访问生成页面

![](images/161.navibuild.png)

2. 点击 [+ New Job]

![](images/162.createnewbuild.png)

3. 在新建作业弹出窗口中，输入作业名称的QR Code Generator Build，然后单击保存。

```diff
-Please BE CAREFUL that you have not added extra white space before or after the information when copy-n-paste
```

![](images/163.newjob.png)

4. 您现在被放入作业配置屏幕。

![](images/164.buildscreen.png)

5. 单击源代码管理选项卡。 选择Git单选按钮。 在存储库部分，从URL下拉列表中选择QRCodeMicroservice.git。

	**注意:** 确保你选择了QR Code Microservice的Git仓库。.

![](images/165.srcctrl.png)

6. 点击Triggers标签。 检查基于SCM轮询时间表。

![](images/166.trigger.png)

7. 单击Build Steps选项卡，单击Add Build Step并选择Execute shell。

![](images/167.stage.png)

8. 在Command textarea中，输入：npm install

![](images/168.npm.png)

9. 点击Post Build选项卡。 检查存档的文物。 对于要归档的文件，请输入** / target / *并验证GZIP被选择为压缩类型。

![](images/169.pb1.png)

10. 单击保存以完成配置。

![](images/170.pbsave.png)

11. 构建应该在1-2分钟内自动启动。 如果没有自动启动，请点击[Build Now]按钮。

![](images/171.now.png)

12. 状态将改变为类似于下图。

![](images/172.queue.png)

构建阶段：请等待 - 可能需要几分钟时间才能将作业更改表格排队等待运行

![](images/173.building.png)

13. 构建将需要几分钟才能完成。 在继续下一步之前，等待构建完成 - 因为我们需要构建工件来创建部署配置。

![](images/174.buildsuccess.png)

### 2.3.2 创建默认的部署过程 - QR码生成器

1. 单击部署访问部署页面

![](images/181.navideploy.png)

2. 点击 [+ New Configuration] 按钮

![](images/182.newdeploy.png)

3. 输入以下数据：

  - **Configuration Name:** QRCodeGeneratorDeploy
  - **Application Name:** qrcodegenerator

![](images/183.createdeploy.png)

4. 由于您在Offer REST API Microservice中创建了部署，因此可以重新使用同一个目标。

  在部署目标中，选择上面创建的相同的Deploy Target。 它应该与Application Container Cloud em2 / your-identity-domain / your-user-name类似

![](images/184.dc.png)

5. 窗口部署到应用程序容器云将弹出，确认信息并输入密码，然后单击[测试连接]按钮。   

  - **Data Center:** `your datacenter, e.g. em2, em3, etc`
  - **Identity Domain:** `your identity domain, e.g. gse00012345, etc`
  - **Username:** `username to login to MyService, e.g. cloud.admin, etc`
  - **Password:** `password of the cloud user`

![](images/185.test.png)

6. 一旦测试成功，请点击使用连接

![](images/186.testgood.png)

7. 在“ACCS属性”中设置

  - **Runtime** to `Node`
  - **Subscription** to `Hourly`
  - Set **Type** to `Automatic` and **CHECK** `Deploy stable build only`

**确保您选择Node作为Runtime**

![](images/187.choosenode.png)

8. 从作业中选择，该名称应该与上面的构建作业匹配，例如QR Code Generator Build。 从工件中选择，该名称应与上面的存档工件和源代码的package.json相匹配，例如target/qrcodegenerator.zip 

![](images/188.choosejob.png)

9. 选中Include ACCS Deployment框，然后输入下面的json

```json
{
	"memory":"1G",
	"instances":"1"
}
```

![](images/024.json.11.png)

10. 填写完上述信息后，点击保存按钮。

![](images/189.depsave.png)

11. 在部署作业中，单击齿轮下拉菜单并选择“开始”

![](images/190.start.png)

12. 部署作业将被放入队列进行处理。 等待直到消息启动应用程序更改为上次部署成功。 如果部署失败，请向导师寻求帮助。
![](images/191.deployed.png)

## 2.4 登录到Oracle Application Container Cloud Service

1. 导航回到Oracle公有云选项卡。 点击信息中心返回到主要Cloud Service仪表板。

2. 在应用程序容器云服务（ACCESS）上，单击汉堡按钮并选择打开服务控制台

![](images/192.accs.png)

3. 在ACCS服务控制台上，您可以查看所有已部署的应用程序，包括我们新创建的qrcodegenerator。

![](images/193.accsqr.png)

4. 复制URL并将其粘贴到新选项卡的地址栏中以调出应用程序。

  请注意，您需要REST端点和商品ID才能生成QR码。

  最终的网址应该如下所示

	https://qrcodegenerator-{your-identity-domain}.apaas.{your-data-center}.oraclecloud.com/ctdqr/v1/offer/10001

![](images/194.qrurl.png)		

5. 浏览器中的QR码将如下所示

![](images/195.codepic.png)

```diff
+ 您可能需要复制你的QR码API的网址
+   https://qrcodegenerator-{your-identity-domain}.apaas.{your-data-center}.oraclecloud.com/ctdqr/v1/offer/
+   https://qrcodegenerator-{your-identity-domain}.apaas.{your-data-center}.oraclecloud.com
+ 并放入，例如 记事本
+   您需要稍后使用，例如 实验室304步骤27。
```

**可选步骤：** 如果您使用QR码阅读器（例如移动应用程序），则可以解码QR码

![](images/196.reader.png)

# 恭喜！ 你已经完成了微服务实验室。

[go back to the Cloud Test Drive Main Page](../README.md)
