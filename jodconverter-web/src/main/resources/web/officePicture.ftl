<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>PDF图片预览</title>
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="js/lazyload.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
     <script src="https://cdn.bootcss.com/iframe-resizer/4.1.1/iframeResizer.contentWindow.js"></script>
    <style>
        .container{
            width: 100%;
            height: 100%;
        }
        .img-area{
            float: left;
            width: 100%;
            margin-top: 2% ;
            border: 1px solid #e0e0e0;
            background: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,.1);
        }
        .my-photo{
            width: 100%;
        }

    </style>
</head>
<body bgcolor="#ffffff">
<div class="container">
    <#list imgurls as img>
        <div class="img-area">
            <img class="my-photo" alt="loading" title="查看大图" style="cursor: pointer;" data-src="${img}" src="${img}" onclick="changePreviewType('allImages')">
        </div>
    </#list>
</div>

<#--<img src="images/right.png" style="position: fixed; cursor: pointer; top: 40%; right: 60px; z-index: 999;" alt="使用PDF预览" title="使用PDF预览" onclick="changePreviewType('pdf')"/>-->
<#--  <span class="fa fa-file-pdf-o fa-4x" style="position: fixed; cursor: pointer; top: 40%; right: 50px; z-index: 999;" title="使用PDF预览" onclick="changePreviewType('pdf')"></span>  -->
<script>
    window.onload=checkImgs;
    window.onscroll = throttle(checkImgs);
    function changePreviewType(previewType) {
        var url = window.location.href;
        if (url.indexOf("officePreviewType=image") != -1) {
            url = url.replace("officePreviewType=image", "officePreviewType="+previewType);
        } else {
            url = url + "&officePreviewType="+previewType;
        }
        if ('allImages' == previewType) {
            window.open(url)
        } else {
            window.location.href = url;
        }
    }
</script>
</body>
</html>