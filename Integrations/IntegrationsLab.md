# ORACLE Cloud Test Drive #
-----
## Define Continuous Integration 'Build' and 'Deploy' Configuration in Oracle Developer Cloud Service ##

### About this tutorial ###
**Oracle Integration Cloud Service is a complete, secure, but lightweight integration solution that enables you to connect your applications in the cloud. It simplifies connectivity between your applications and connects both your applications that live in the cloud and your applications that still live on premises. Oracle Integration Cloud Service provides secure, enterprise-grade connectivity regardless of the applications you are connecting or where they reside.

![](images/00/00.ics.png)

The key features of Oracle Developer Cloud Service include:

Project creation, configuration, and user management

+ Version control and source code management with Git
+ Storage of application dependencies and libraries with Maven
+ Continuous build integration with Hudson
+ Wiki for document collaboration
+ Issue tracking system to track tasks, defects, and features
+ Repository branch merge after code review
+ Deployment to Oracle Java Cloud Service - SaaS Extension, Oracle Java Cloud Service, and Oracle Application Container Cloud Service

Oracle Developer Cloud Service is available as a web interface accessible from a web browser and from Integrated Development Environments (IDEs) such as Oracle Enterprise Pack for Eclipse (OEPE), Oracle JDeveloper, and NetBeans IDE.

This tutorial shows how to deploy Loyalty Management application to Java Cloud Services using Oracle Developer Cloud Services.

The Loyalty Management application is a JEE web application serving simple JSP pages.

This tutorial demonstrates how to:

- Configure Build Job for the Loyalty Management - A JEE application
- Configure Java Cloud Service - WebLogic Server deployment in Developer Cloud Service
- Build and Deploy Loyalty Management Application using Developer Cloud Service

### Prerequisites ###

- Oracle Public Cloud Service account including Developer Cloud Service and Java Cloud Service

----

#### Open Oracle Developer Cloud Service Project ####

1. [Sign in](sign.in.to.oracle.cloud.md) to [https://cloud.oracle.com/sign-in](https://cloud.oracle.com/sign-in). First select your datacenter then provide the identity domain and credentials. After a successful login you will see your Dashboard. Find the Developer services tile and click the hamburger icon. In the dropdown menu click **Open Service Console**.

![](images/02/01.dashboard.png)