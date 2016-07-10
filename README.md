# letsencrypt-fast
The fastest way to test/generate/renew Let's Encrypt SSL certificates!!! 
Requires root access and a live webserver to run the script at.
The script must run on the live web server.
IT DOES NOT stop the server from running in order to validate!

These scripts are based on the excellent work of the people at https://zerossl.com/

Contains two (2) bash scripts:
- install.sh that will install and create the appropriate directories
- le.sh that handles all the SSL certificate generation/renewing

**The install.sh script is for an Ubuntu/Debian Linux flavour.**

If you need to install zerossl for another flavour just navigate here: https://zerossl.com/installation.html

**Steps to install**
- ```wget https://github.com/davidoster/letsencrypt-fast/blob/v1.0.0/install.sh```
- ```sudo chmod 744 ./install.sh```
- ```./install.sh```

**_Usage_**

**Arguments**

- a. domain = just the name of the domain without the TLD (.xyz) part
- b. www.domain.com,domain.com = the name of the domains you want to register. They need to be comma (,) separated
- c. operation = valid operations are: -t for testing, -l for true generation, -r for auto renewal on 7 days before expiration

**Running**

_For testing_

```./le.sh domain www.domain.com,domain.com /path/to/webdomain/files/ -t```

_For real generation_

```./le.sh domain www.domain.com,domain.com /path/to/webdomain/files/ -l```

_For renewal_ **(does it 7 days before expiration automatically)**

```./le.sh domain www.domain.com,domain.com /path/to/webdomain/files/ -r```

This is a script to help people create their --!FREE!-- SSL certificate for their site(2) in a very fast and convenient way.
It uses the approach from https://zerossl.com/ and installs various Perl packages in order to work.
For questions or enhancements : info [at] eletter [dot] gr

**Courtesy of http://eLetter.gr for public unrestricted use!**
