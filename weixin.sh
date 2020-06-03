#!/bin/bash
corpid='ww652c00e8b8a5583a'
corpsecret='YLPqMdYmgPHGPstNkk7-39bD2goL2Lzv6DE5pWBYOZY'
agentid='1000002'			
user="$1"					
title="$2"					
content="$3"		
token=$(curl -s https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=$corpid\&corpsecret=$corpsecret |sed -nr 's#.*token":"(.*)","e.*#\1#p')
post=$(curl -s https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=$token -d  "{ \
   \"touser\": \"$user\", \
   \"msgtype\": \"text\", \
   \"agentid\": $agentid, \
   \"text\": { \
       \"content\": \"$title
-------------------------------------------------------------------------------
$content\" \
   }, \
   \"safe\":\"0\" \

}")

