#!/bin/bash


set -x 
set -e
set -o pipefail

#varsion 1 
###############
#This is the script for reporting the usage of the aws resources in your accout
#Author Varun Nalluri 


#describes the instance in your accout 
aws ec2 describe-instances


#describes the vpc's in your accout 
aws ec2 describe-vpcs

#list the users in your accout 
 aws iam list-users 
