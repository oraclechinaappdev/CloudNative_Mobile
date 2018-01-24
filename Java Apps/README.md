# ORACLE Cloud Test Drive #
-----
## 1. DevOps - 1.	DevOps - 通过Oracle开发云服务持续集成和持续交付JEE ##

### 1.1	介绍 ###
本实验是亚太地区云试驾的一部分，是在敏捷项目生命周期内创建，构建和部署JEE应用程序的第一个实验。
本节介绍通过使用WebLogic Server管理控制台将应用程序部署和取消部署到Oracle Java Cloud Service实例。

#### 1.2	关于练习 ####

![](images/jcs.scope.png)

在此练习中，我们将在未来1小时内使用开发者云服务:
+ 获取JEE应用程序源代码并将其部署到Java Cloud Service中的WebLogic Server
+ 从代码更改开始，简单的“持续集成和交付”

**1.3	实验假设**
+ 营销经理将使用“忠诚度管理”应用程序根据选定的一组客户创建活动报价
+ 您是拥有此应用程序的“应用程序架构师”，他最近对代码进行了小修改并实施了更改
+ 忠诚度管理数据库，表格和数据已准备好可被应用程序连接和使用
+ WebLogic Server实例是在Java Cloud Service中配置的

现代开发团队的目标是以更短的周期交付软件，质量更好。敏捷开发方法有助于快速处理不断变化的业务需求，并缩短向客户交付工作软件的周转时间。通过开发阶段精简软件交付使得持续集成和交付自动化技术变得流行。这些技术经常被用来优化整个DevOps周期。

![](images/business.value.png)

**Oracle开发云服务（DevCS）** 提供了一个集成的基于云的平台，可简化实施这些现代化的开发和操作技术。 DevCS是一个基于云的软件开发平台即服务（PaaS），也是您的应用程序开发基础架构的托管环境。 它提供了一个开源的基于标准的解决方案，通过与Hudson，Git，Maven，Issue和Wiki的集成来有效地管理应用程序开发生命周期。 使用Oracle开发者云服务，您可以将您的应用程序源代码提交到Oracle Cloud上的Git存储库，跟踪在线分配的问题和缺陷，使用wiki页面共享信息，同行评审源代码以及监视项目构建。 在成功测试之后，您可以将项目部署到Oracle Java Cloud Service - SaaS Extension，公共可用的Oracle Java Cloud Service实例，Oracle Application Container Cloud Service实例或本地生产环境。

![](images/00.dcs.png)

1.4	Oracle Developer Cloud Service的主要功能包括：
+ 项目创建，配置和用户管理
+ 使用Git进行版本控制和源代码管理
+ 使用Maven存储应用程序依赖关系和库
+ 使用Hudson持续建立整合
+ 使用Wiki进行文档协作
+ 问题跟踪系统跟踪任务，缺陷和功能
+ 代码审查后，版本库分支合并
+ 部署到 Oracle Java Cloud Service - SaaS Extension, Oracle Java Cloud Service, and Oracle Application Container Cloud Service

Oracle开发云服务可作为可从Web浏览器和集成开发环境（IDE）（如括Brackets，Oracle Enterprise Pack for Eclipse（OEPE），Oracle JDeveloper和NetBeans IDE访问的Web界面提供。
DevCS由各种组件组成，包括Git，Hudson，Maven，基于浏览器的IDE，问题跟踪器，Wiki，代码片段和代码审查。
所有组件都在一个项目中提供，这是由Oracle开发云服务提供的一系列功能和服务。


### 1.5	本教程演示如何: ###
- 使用初始 [GitHub](https://github.com) 存储库创建Oracle开发云服务（DevCS）忠诚度管理应用程序项目
- 在Oracle开发云服务中定义持续集成的“构建”和“部署”配置
- 持续集成和交付（CICD）：使用Brackets，提交和推送代码更改到Oracle开发云服务

### 1.6	先决条件 ###

- 以下实验需要由教师提供的Oracle公有云帐户.  
- 你还需要安装一个轻量级的IDE  - [Brackets](http://brackets.io/). Brackets安装程序将由教师提供，也可以从 [GitHub HERE](https://github.com/adobe/brackets/releases) 下载.  
- 你需要有一个Git客户端. 如果您已经使用Github Desktop，Eclipse或其他IDE，则可能已经安装了Git. Git安装程序将由教师提供，或者您可以从 [这里](https://git-scm.com/downloads)下载
- *[点击这里查看支架安装细节](brackets.md)*
- *[点击这里获取Git安装细节](gitclient.md)*

# 2.	实验练习: #

## 101: 使用初始GitHub存储库创建Oracle开发云服务忠诚度管理应用程序项目 ##

[Click Here.](101-JavaAppsLab.md)

## 102: 在Oracle Developer Cloud Service中定义持续集成“构建”和“部署”配置 ##

[Click Here.](102-JavaAppsLab.md)

## 103:持续集成和交付（CICD）：使用Brackets，提交和推送代码更改到Oracle开发云服务 ##

[Click Here.](103-JavaAppsLab.md)

or

[回到云试驾主页](../README.md)
