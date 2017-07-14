# letsencrypt-fast
The fastest way to test/generate/renew Let's Encrypt SSL certificates!!! 

**Requires root access** and a live webserver to run the script at.

**The script must run on the live web server.**

**It supports multiple domains/sites on the same server** to obtain a valid SSL certificate.

**IT DOES NOT** stop the server from running in order to validate!

If put on cron **it renews automatically 7 days before expiration**.


These scripts are based on the excellent work of the people at https://zerossl.com/


Contains two (2) bash scripts:
- install.sh that will install and create the appropriate directories
- le.sh that handles all the SSL certificate generation/renewing

**The install.sh script is for an Ubuntu/Debian Linux flavour.**

If you need to install zerossl for another flavour just navigate here: https://zerossl.com/installation.html


**Steps to install**
- ```wget https://raw.githubusercontent.com/davidoster/letsencrypt-fast/v1.0.0/install.sh```
- ```sudo chmod 744 ./install.sh```
- ```./install.sh```


**_Usage_**

  **Arguments**

  - domain = just the name of the domain without the TLD (.xyz) part
  - www.domain.com,domain.com = the name of the domains you want to register. They need to be comma (,) separated
  - path to web domain files = the full web path of your site, e.g. /var/html/www/
  - operation = valid operations are: -t for testing, -l for true generation, -r for auto renewal on 7 days before expiration

  **Running**

  _For testing_

    ```./le.sh domain www.domain.com,domain.com /path/to/webdomain/files/ -t```

  _For real generation_

    ```./le.sh domain www.domain.com,domain.com /path/to/webdomain/files/ -l```

  _For renewal_ **(does it 7 days before expiration automatically)**

    ```./le.sh domain www.domain.com,domain.com /path/to/webdomain/files/ -r```

**_Auto Renewal_**

  Run the above command in host's cron, e.g.

    ```0       18 * * 1,3,5    root    /root/software/le.sh domain domain.com,www.domain.com /path/to/domain/ -r > /dev/null 2>&1```


**_Certificate Files_**

  You can find the domain.crt and domain.key files under 

    ```/root/software/keys/domain.key``` and use these paths to your webserver,

  e.g. 

    ```/root/software/keys/domain.key/domain.crt```

    ```/root/software/keys/domain.key/domain.key```

  Also inside this directory you can find the **domain.csr** file along with the file **account.key** for the domain in let's encrypt systems.

This is a script to help people create their **FREE** SSL certificate for their site(s) in a very fast and convenient way.
It uses the approach from https://zerossl.com/ and installs various Perl packages in order to work.
For questions or enhancements : info [at] eletter [dot] gr

**Courtesy of http://eLetter.gr for public unrestricted use!**
