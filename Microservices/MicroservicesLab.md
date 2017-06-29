Update: June 29, 2017

## Introduction

This lab is part of the APAC Cloud Test Drive and is the 2nd lab about creating microservices

## Objectives

- Import Code from external Git Repository
- Build and Deploy project using Developer Cloud Service and Oracle Application Container Cloud Services

## Required Artifacts

- The following lab requires an Oracle Public Cloud account that will either be applied by yourself or supplied by your instructor. You will need to install an IDE environment and GIT client in your local lab.

# Create Initial QR Code Generator Microservice

## Create Initial Git Repository

- Login to Developer Cloud Service if you haven't done so.
- In the left hand navigation panel, click **Project**
- On the right side in the **REPOSITORIES** section, click on **New Repository** to create a new Git Repository.
- In the New Repository wizard enter the following information and click **Create**.

	**Name:** `QRCodeMicroservice`

	**Description:** `Microservice to generate Offer QR Code. The QR Code will contains an URL of the actual Offer.`

	**Initial content:** `Import existing repository`

	**Enter the URL:** `To be confirmed by Chol Ho`

- You have now created a new Git repository stored within the Developer Cloud Service that is based on an existing repository

## Create Default Build and Deployment Process

Now that we have the source code in our Developer Cloud Service managed Git Repository, we need to create a build process that will be triggered whenever a commit is made to the master branch. We will setup a **shell script** build process in this section.

### Create Default Build Process

- Click **Build** on the navigation panel to access the build page and click **[+ New Job]**

- In the New Job popup window, enter `QR Code Generator Build` for Job Name and click **Save**.

- You are now placed into the job configuration screen.

- Click the **Source Control** tab. Select **Git** radio button. In the Repositories section, select **QRCodeMicroservice.git** from the URL drop down.

	**Note:** Make sure you select the Git repository for the QR Code Microservice.

- Click **Triggers** tab. Check **Based on SCM polling schedule**.

- Click the **Build Steps** tab, click **Add Build Step** and select **Execute shell**.

- In the Command textarea, enter: `npm install`

- Click the **Post Build** tab. Check **Archive the artifacts**. For File to Archive, enter `**/target/*` and verify **GZIP** is chosen as the Compression Type.

- Click **Save** to complete the configuration. A build should start automatically within 1-2 minutes. If it dows not start automatically, click on the **[ Build Now ]** button. The status will change to something similar to the following diagram.

- The build will take serval minutes to complete. Wait for the build to complete before continue to the next step - ** as we need the build artifact to create the deployment configuration**.

### Create Default Deployment Process

- Click **Deploy** to access the Deployments page and click the **[+ New Configuration]** button.

- Enter the following data:

	**Configuration Name:** QRCodeGeneratorDeploy

	**Application Name:** qrcodegenerator

- Next to the right hand side of **Deployment Target**, click the **[New]** button and select **Application Container Cloud...**

- Enter the following information and click **Test Connection**. If successful, click **[Use Connection]** button  

	**Data Center:**

	**Identity Domain:**

	**Username:**

	**Password:**
