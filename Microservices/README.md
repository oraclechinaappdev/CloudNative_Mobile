# Oracle APAC Cloud Test Drive

Last Update: July 10, 2017

## Microservice Lab

本实验向您介绍如何使用Oracle Application Container Cloud Service为Microserivces准备环境并开发Mircoserivces。

### 介绍

虽然微服务体系结构没有标准，但是业界大多同意一些微服务体系结构应遵循的设计要点和特征，下面将会提到：

- 几个，小型，简约，独立的服务
- 预计失败
- 为扩展而设计
- 通过消息传递调用的解耦功能
- 无状态的本质
- 完全自动部署DevOps / NoOps

有一些常见的用例可以采用微服务，比如

- 通过在外围添加微服务来扩展现有的单一应用程序
- 将现有的模块化应用程序分解为微服务风格
- 从头开始构建新的微服务式应用程序

因此，微服务的示例要求将是,

- 可伸缩的，有弹性的，多语言的
-	自动化的DevOps
-	应用性能监测和诊断工具
- 容器支持简单和可扩展
- 服务消费API优先
- 移动第一/现代Web UX  

**微服务允许公司以更快，更灵活的方式开发，部署和更新部分应用程序，从而以更及时和灵活的方式应对新的市场需求和竞争.**

微服务架构（MSA）确保服务的敏捷开发和部署。但是，组织采用MSA会遇到不同的挑战。下图列出了一些这样的挑战/要求.

![](images/000.challenges.png)

## Oracle Application Container Cloud Service(甲骨文应用容器云服务)

[Oracle Application Container Cloud Service](https://cloud.oracle.com/en_US/application-container-cloud)是Oracle AppDev产品组合中的一项云服务，可让您将Java SE，Node.js，PHP，Python和/或Ruby应用程序部署到Oracle云中.   

![](images/000.architecture.png)

Oracle Application Container Cloud Service具有以下主要功能:

- Java SE，Node.js，PHP，Python和Ruby应用程序的预配置环境.
-	Java SE高级功能，如Java Flight Recorder，Java Mission Control，高级内存管理以及持续和及时的安全更新.
-	支持所有Java框架和容器（如Spring，Play，Tomcat和Jersey）的开放平台.
-	支持基于Java虚拟机（JVM）的语言，如JRuby。 您可以运行在此服务上使用Java虚拟机的任何语言.
-	来自Oracle的企业级支持.
-	基于Web的用户界面和REST API.

![](images/000.accs.png)

另外，您可以选择与其他Oracle云服务集成。 您可以在本地系统上开发应用程序，也可以使用Oracle开发人员云服务.

## Oracle Developer Cloud Service(甲骨文开发者云)

[Oracle Developer Cloud Service](https://cloud.oracle.com/en_US/application-container-cloud) 一个基于云的开发平台，支持敏捷开发方法和DevOps自动化。 这个托管团队开发和交付平台包括问题跟踪，代码版本管理，wiki，敏捷开发工具，持续集成和交付自动化。

![](images/000.devcs.png)

## 关于今天的练习

我们将使用开发者云服务在未来1小时内在Application Container Cloud中创建和部署2个微服务 :smile:.
- 利用现有的第三方Git仓库
- 在Developer Cloud Service中创建构建和部署作业
- 使用IDE与开发者云服务
- 在您的应用程序中利用数据库云服务
- 部署在应用程序容器云服务上
![](images/000.todaylab.png)   



## [Start The Lab](MicroservicesLab.md)
