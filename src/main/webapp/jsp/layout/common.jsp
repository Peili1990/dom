<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<link rel="stylesheet" type="text/css" href="${baseUrl}css/common.css">
<link rel="stylesheet" href="${baseUrl}assets/css/amazeui.min.css">
<link href="${baseUrl}mobiscroll/css/mobiscroll.custom-2.6.2.min.css" rel="stylesheet" type="text/css">
<script src="${baseUrl}js/common/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${baseUrl}assets/js/fastclick.min.js" type="text/javascript"></script>
<script src="${baseUrl}assets/js/amazeui.min.js" type="text/javascript"></script>
<script src="${baseUrl}js/common/common.js" type="text/javascript"></script>
<script src="${baseUrl}js/common/frame.min.js" type="text/javascript"></script>
<script src="${baseUrl}mobiscroll/js/mobiscroll.custom-2.6.2.min.js" type="text/javascript"></script>

<div class="am-modal am-modal-loading am-modal-no-btn" tabindex="-1" id="my-modal-loading">
  <div class="am-modal-dialog">
    <div class="am-modal-hd"></div>
    <div class="am-modal-bd">
      <span class="am-icon-warning"></span>
    </div>
  </div>
</div>

<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">维多利亚的噩梦</div>
    <div class="am-modal-bd"></div>
    <div class="am-modal-footer">
      <span class="am-modal-btn">确定</span>
    </div>
  </div>
</div>

<div class="dw-hidden" role="alert"></div>