# ORACLE Cloud Test Drive #
-----
## Rapid Connect Applications by Oracle Integration Cloud Service ##

### About this tutorial ###
**Oracle Integration Cloud Service (ICS)** is a complete, secure, but lightweight integration solution that enables you to connect your applications in the cloud. It simplifies connectivity between your applications and connects both your applications that live in the cloud and your applications that still live on premises. Oracle Integration Cloud Service provides secure, enterprise-grade connectivity regardless of the applications you are connecting or where they reside.

![](images/00/00.ics.png)

Oracle Integration Cloud Service provides native connectivity to Oracle Software as a Service (SaaS) applications, such as Oracle Sales Cloud, Oracle RightNow Cloud, and so on. Oracle Integration Cloud Service adapters simplify connectivity by handling the underlying complexities of connecting to applications using industry-wide best practices. You only need to create a connection that provides minimal connectivity information for each system. Finally, the visual data mapper enables you to quickly create direct mappings between the trigger and invoke data structures. From the mapper.

Once you integrate your applications and activate the integrations to the runtime environment, the dashboard displays information about the running integrations so you can monitor the status and processing statistics for each integration. The dashboard measures and tracks the performance of your transactions by capturing and reporting key information. You can manage business identifiers that track fields in messages and manage errors by integrations, connections, or specific integration instances.

The key features of Oracle Integration Cloud Service include:

Project creation, configuration, and user management

1. **Connect**
    - Auto-Associated SaaS connections
	- Native SaaS Adaptors
	- Secure On-Premises Integration
	- Open Adapter SDK
2. **Design**
    * Intuitive Visual Designer and Mobile Ready - Rich Point and click browser-based designer to build integrations anywhere - on your computer or your favorite tablet
    * Oracle Recommends™ - Smart Data Mapper provides accurate recommendations using Oracle Recommends™
    * Business User Friendly - Business friendly terminology combined with videos and tutorials for ease of use
    * API-Ready - Publish your integrations as an API for external consumption
3. **Monitor and Manage**
    - End to End Visibility - Simple and powerful search to help you zero in on transactions of interest. Comprehensive drill-down capabilities for detailed auditing and analysis
    - Monitor KPIs - Real-time insight into key performance indicators on a high-performance visual dashboard
    - Robust Error Management - Rapidly detect and diagnose errors for corrective action
4. **Accelerate**
    - Pre-Built Integrations - Portfolio of pre-built integrations available for immediate use as-is, or customizable for your business requirements
    - Cloud Marketplace - Pre-built adapters and integrations, published by Oracle and Oracle partners

This tutorial shows how to connect to different applications to serve frontend mobile consumers using Oracle Integration Cloud Service. Once ICS receives a request from mobile consumer, it routes to CRM to perform customer activity log about acceptance of a product offer, and then it returns QR code image URL if user accepted the offer.

This tutorial demonstrates how to:

- Configure Connection definiton to a Simple Object Access Protocol (SOAP) based Customer Relationship Management (CRM) service and Expose into Representational State Transfer (REST) based service
- Configure Integration flow to interconnect service endpoints, mapping request and response data attributes and orchestrate decision logic
- Monitor integration flow transaction and endpoint status, performance statistics and business identifiers

### Prerequisites ###

- Oracle Public Cloud Service account including Integration Cloud Service

----

#### Navigating Oracle Integration Cloud Service ####

1. [Sign in](sign.in.to.oracle.cloud.md) to [https://cloud.oracle.com/sign-in](https://cloud.oracle.com/sign-in). First select your datacenter then provide the identity domain and credentials. After a successful login you will see your Dashboard. Find the **integration** services tile and click the hamburger icon. In the dropdown menu click **Open Service Console**.

![](images/00/01.dashboard.png)

2. If you cannot find the **integration** services tile, click **Customize Dashboard** button at top right corner of browser, and then select **Show** at the integration section of the **Customize Dashboard** dialog window.

![](images/00/02.dashboard.png)

3. On Service Console opened, the ICS home page is displayed as following:

![](images/00/03.home.png)

  \*Close the `Guide Me` Quick Tour if running by click **Got it!** button at the bottom, we don't need it during the lab exercise.

![](images/00/04.ics_overlays.png)

4. The home page provides links to the primary development features of Oracle Integration Cloud Service: connections, integrations, monitoring, lookups, packages, agents, adapters, and libraries.

![](images/00/05.ics_designer_portal.png)

5. Using the Navigation Pane, click ![](images/00/06.main_hamburger.png) in the upper left corner to show the navigation pane.

![](07.navigation_pane.png)

The navigation pane provides you with access to all the development features in the Oracle Integration Cloud Service.


#### Define Connection for CRM Customer Activity Service and REST Service Exposure ####

6. Go to *Connection* Summary Page by click on the `Connection` green icon.

![](images/00/08.home_conn.png)

Alternative, you can go to *Connection* Summary Page by click the hamburger icon at the top left corner, click `Designer` and then `Connections`

![](images/00/09.home_hamburger.png)

![](images/00/10.home_hamburger_designer.png)

![](images/00/11.home_hamburger_connections.png)



#### Create Integration - An Orchestration Integration Flow ####



#### Testing the service and Monitoring with ICS Dashboards ####

