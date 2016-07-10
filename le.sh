#!/bin/bash
#clear
echo "Usage(testing): le.sh domain www.domain.com,domain.com /path/to/webdomain/files/ -t";
echo "Usage(live): le.sh domain www.domain.com,domain.com /path/to/webdomain/files/ -l";
echo "Usage(renewal - 7 days before expiration automatically): le.sh domain www.domain.com,domain.com /path/to/webdomain/files/ -r";
echo;
sw="/root/software";
skeys="/root/software/keys";
cd $skeys
if [[ $1 = "" ]]; then
	echo "First argument: domain is required!";
	cd $sw
	exit
else
	if [[ -d "$1.keys" ]]; then
		cd $1.keys;
	else
		mkdir $1.keys && cd $1.keys
	fi
	if [[ $4 = "-t" ]]; then
		if [[ $2 = "" ]]; then 
			echo "Domain name(s) is/are required!"; 
			exit 
		fi
		if [[ $3 = "" ]]; then 
			echo "Path to webdomain files is required!"; 
			exit 
		fi
		echo "Testing...";
		if [[ ! -d $3.well-known/acme-challenge/ ]]; then
			mkdir -p $3.well-known/acme-challenge/
		fi
		echo `le.pl --key account.key --csr $1.csr --csr-key $1.key --crt $1.crt --domains "$2" --path $3.well-known/acme-challenge/ --generate-missing --unlink`
		cd $sw
		exit
	fi
	if [[ $4 = "-l" ]]; then
                if [[ $2 = "" ]]; then
                        echo "Domain name(s) is/are required!";
                        exit
                fi
                if [[ $3 = "" ]]; then
                        echo "Path to webdomain files is required!";
                        exit
                fi
                echo "Generating live certificates...";
                if [[ ! -d $3.well-known/acme-challenge/ ]]; then
                        mkdir -p $3.well-known/acme-challenge/
                fi
                echo `le.pl --key account.key --csr $1.csr --csr-key $1.key --crt $1.crt --domains "$2" --path $3.well-known/acme-challenge/ --generate-missing --unlink --live`
		cd $sw
                exit
        fi
	if [[ $4 = "-r" ]]; then
                if [[ $2 = "" ]]; then
                        echo "Domain name(s) is/are required!";
                        exit
                fi
                if [[ $3 = "" ]]; then
                        echo "Path to webdomain files is required!";
                        exit
                fi
                echo "Renewing...";
                if [[ ! -d $3.well-known/acme-challenge/ ]]; then
                        mkdir -p $3.well-known/acme-challenge/
                fi
                echo `le.pl --key account.key --csr $1.csr --csr-key $1.key --crt $1.crt --domains "$2" --path $3.well-known/acme-challenge/ --generate-missing --unlink --renew 7 --live`
		cd $sw
                exit
        fi
	echo "You didn't supply all the required arguments!";
        cd $sw
        exit
fi