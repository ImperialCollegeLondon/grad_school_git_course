---
title: Setup
---

Completing this course requires you to have access to computer with some
software prerequisites installed. If you are attending a delivery of this course
in person through the Graduate School you have the option of using your own
laptop or an ICT managed PC at the workshop venue. For instructions on setting
up your own Laptop please see below. All attendees should join the Imperial
Research Software Community Slack workspace and create a GitHub account before
the workshop.

## Joining The Imperial Research Software Community Slack Workspace

[Slack](https://slack.com/intl/en-gb/) is a commonly used tool for teams and
communities to keep in touch. The Research Software Community at Imperial has a
dedicated Slack workspace for discussing issues related to research software.
We will use this as an area to share links and information and for you to ask
questions and request help. We hope that longer term you will find the Community
a valuable asset in your work.

* Please visit https://imperialsrscommunity.slack.com/ and select "create an
  account".
* Complete the sign-up steps (be sure to use your @imperial.ac.uk address).
  There is no need to install the Slack Desktop app as the workspace can be
  access through the browser.
* Once you're logged into the workspace, press "Channels" in the left-hand pane.
* In the search bar look for "grad-school-git-course" and select the entry
  from the results.
* Press "Join Channel" at the bottom of the page.

## Creating a GitHub Account

- Go to [https://github.com](https://github.com).
- Fill the form with your details. **Use your Imperial College email account!**
- Select the Free plan.
- Complete the questionnaire (Optional) or click on **Skip this step**.
- You should receive an email shortly to verify your address. Click **Verify
  email address** in that email.
- Congratulations! Now you have a GitHub account!

## Using Your Own Laptop

The below instructions can be used to setup the required software for your own
laptop. For ICT managed PC's setup steps will be covered during the
workshop. Please note that due to time constraints we are unable to support you
in setting up your laptop if you come to the workshop without the below
prerequisites installed and working. In this case you will need to use one of
the PC's provided.

### Git

Please follow the relevant instructions depending on your operating system.

#### Windows


1. Download the Git for Windows installer.
1. Run the installer and follow the steps below:
   1. Click on "Next" four times (two times if you've previously installed Git). You don't need to change anything in the Information, location, components, and start menu screens.
   1. From the dropdown menu select "Use the nano editor by default" and click on "Next".
   1. Ensure that "Git from the command line and also from 3rd-party software" is selected and click on "Next". (If you don't do this Git Bash will not work properly, requiring you to remove the Git Bash installation, re-run the installer and to select the "Git from the command line and also from 3rd-party software" option.)
   1. Ensure that "Use the native Windows Secure Channel library" is selected and click on "Next".
   1. Ensure that "Checkout Windows-style, commit Unix-style line endings" is selected and click on "Next".
   1. Ensure that "Use Windows' default console window" is selected and click on "Next".
   1. Ensure that "Enable file system caching" and "Enable Git Credential Manager" are selected and click on "Next".
   1. Click on "Install".
   1. Click on "Finish".
1. If your "HOME" environment variable is not set (or you don't know what this is):
   1. Open command prompt (Open Start Menu then type cmd and press [Enter])
   1. Type the following line into the command prompt window exactly as shown:
   
   1. setx HOME "%USERPROFILE%"
   1. Press [Enter], you should see SUCCESS: Specified value was saved.
   1. Quit command prompt by typing exit then pressing [Enter]

This will provide you with both Git and Bash via the program Git Bash. You
should be able to launch Git Bash from the Start Menu. Within the window that
launches enter the command `git --version` and press enter. You should see
output similar to the below:
```
git version 2.23.0.windows-1
```

#### MacOS

For OS X 10.9 and higher, install Git for Mac by downloading and running the
most recent "mavericks" installer from this list. Because this installer is not
signed by the developer, you may have to right click (control click) on the
.pkg file, click Open, and click Open on the pop up window. After installing
Git, there will not be anything in your /Applications folder, as Git is a
command line program. For older versions of OS X (10.5-10.8) use the most
recent available installer labelled "snow-leopard" available here.

To check the installation was successful open the "Terminal" app. In the window
that launches enter the command `git --version` and press enter. You should see
output similar to the below:
```
git version 2.25.0
```

#### Linux

If Git is not already available on your machine you can try to install it via
your distributions package manager. For Debian/Ubuntu run `sudo apt-get install
git` and for Fedora run `sudo dnf install git`.

To check the installation was successful open a new terminal. In the window that
launches enter the command `git --version` and press enter. You should see
output similar to the below:
```
git version 2.25.0
```

{% include links.md %}
