<?php
if(!is_file('install.lock')){
    $isInstall=false;
    exit("<a href='install.php'>点击安装</a>");
}else{
    $isInstall=true;
}
?><!doctype html>
<html lang="zh-cmn-Hans">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" />
    <meta name="renderer" content="webkit" />
    <meta name="force-rendering" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <!-- MDUI CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/mdui@1.0.2/dist/css/mdui.min.css" />
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <title>XFS-Install</title>
    <style>
    .copyright{
    box-sizing: border-box;
    width: 100%;
    padding: 20px 16px;
    position: fixed;
    bottom:0;
    left:0;
    }
    </style>
</head>

<body class="mdui-appbar-with-toolbar mdui-drawer-body-left mdui-color-pink-50">
    <!-- 导航栏 -->
    <div class=" mdui-appbar  mdui-appbar-fixed">
        <div class="mdui-toolbar mdui-color-pink">
            <a href="javascript:" class="mdui-typo-headline">XFS-Install</a>
            <a href="javascript:" class="mdui-typo-title">完美安装家</a>
            <div class="mdui-toolbar-spacer"></div>
        </div>
    </div>
    <div class="mdui-drawer" id="main-drawer">
        <div class="mdui-list" mdui-collapse="{accordion: true}" style="margin-bottom: 76px;">
            <div class="
            mdui-collapse-item
            ">
                <div class="mdui-collapse-item-header mdui-list-item mdui-ripple">
                    <i class="
                mdui-list-item-icon
                mdui-icon
                material-icons
                mdui-text-color-blue">near_me</i>
                    <div class="mdui-list-item-content">开始使用</div>
                    <i class="mdui-collapse-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
                </div>
                <div class="mdui-collapse-item-body mdui-list">
                    <a href="#introduction" class="mdui-list-item mdui-ripple">简介</a>
                    <a href="#download" class=" mdui-list-item mdui-ripple ">下载</a>
                    <a href="#install" class=" mdui-list-item mdui-ripple ">安装</a>
                    <a href="#use" class=" mdui-list-item mdui-ripple ">使用</a>
                    <a href="#compatibility" class=" mdui-list-item mdui-ripple">兼容性</a>
                </div>
            </div>
            <div class="mdui-collapse-item">
                <div class="mdui-collapse-item-header mdui-list-item mdui-ripple">
                    <i class=" mdui-list-item-icon mdui-icon  material-icons mdui-text-color-green">widgets</i>
                    <div class="mdui-list-item-content">功能</div>
                    <i class="mdui-collapse-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
                </div>
                <div class="mdui-collapse-item-body mdui-list">
                    <a href="#auto-check" class=" mdui-list-item mdui-ripple">自动检测</a>
                    <a href="#steps-install" class=" mdui-list-item mdui-ripple">有序安装</a>
                </div>
            </div>
            <div class=" mdui-collapse-item ">
                <div class="mdui-collapse-item-header mdui-list-item mdui-ripple">
                    <i class=" mdui-list-item-icon mdui-icon material-icons  mdui-text-color-purple">local_mall</i>
                    <div class="mdui-list-item-content">其他</div>
                    <i class="mdui-collapse-item-arrow mdui-icon material-icons">keyboard_arrow_down</i>
                </div>
                <div class="mdui-collapse-item-body mdui-list">
                    <a href="https://www.zhihu.com/people/xfs-xiaofeng" target="_blank" class=" mdui-list-item mdui-ripple">XFS-小风知乎主页</a>
                    <a href="https://space.bilibili.com/447758911" target="_blank" class=" mdui-list-item mdui-ripple">XFS-小风B站主页</a>
                </div>
                <div class="copyright"><p>© 2022 XFS-Installed</p><p>Powered by XFS-小风</p></div>
            </div>
        </div>
    </div>
    <div class="mdui-container-fluid ">
        <div class="mdui-typo">
            <h1 class="title mdui-text-color-pink-400"><b>开始使用</b></h1>
            <hr/>
        <div id="introduction" class="mdui-typo">
            <h3 class="title mdui-text-color-pink-400"><b>简介</b></h3>
            <p><kbd>XFS-Install</kbd>是XFS-小风创作的专注于安装含有SQL文件的程序,因为许多中小型程序都需要进行MySql安装,因此我开发了此款程序</p>
        </div>
        <div id="download" class="mdui-typo">
            <h3 class="title mdui-text-color-pink-400"><b>下载</b> https://github.com/xiaofengsoft/xfs-install</h3>
            <p><kbd class="mdui-color-red-a400">Gitee下载</kbd> https://gitee.com/xiaofengsb/xfs-install</p>
            <p><kbd>GitHub下载</kbd> </p>
        </div>
        <div id="install" class="mdui-typo">
            <h3 class="title mdui-text-color-pink-400"><b>安装</b></h3>
            <p>下载后会得到一个压缩包,直接解压到项目运行目录即可(内部含install文件夹)</p>
        </div>
        <div id="use" class="mdui-typo">
            <h3 class="title mdui-text-color-pink-400"><b>使用</b></h3>
            <p>如果你想使用该程序,那就把你导出的SQL文件下载后替换程序中的install.sql即可</p>
        </div>
        <div id="compatibility" class="mdui-typo">
            <h3 class="title mdui-text-color-pink-400"><b>兼容性</b></h3>
            <p>本程序采用HTML+PHP结构,使用MDUI前端框架,其中PHP采用7.2+版本,并要求支持PDO扩展</p>
        </div>
        </div>
        <hr/>
        <div class="mdui-typo">
            <h1 class="title mdui-text-color-pink-400"><b>功能</b></h1>
            <hr/>
            <div id="auto-check" class="mdui-typo">
                <h3 class="title mdui-text-color-pink-400"><b>自动检测</b></h3>
                <p>安装时会设置一个install.lock文件阻止安装,如果检测不到install.lock会提示安装,检测到则会显示该页面并提示已经安装</p>
                <p> <img alt="安装检查" title="安装检查" src="./check.png" style="cursor: pointer;"/></p>
                <p> <img alt="安装检查" title="安装检查" src="./warning.png" style="cursor: pointer;"/></p>
            </div>
            <div id="steps-install" class="mdui-typo">
                <h3 class="title mdui-text-color-pink-400"><b>有序安装</b></h3>
                <p>分步骤安装</p>
                <p> <img alt="安装步骤2" title="安装步骤2" src="./step-1.png" style="cursor: pointer;"/></p>
                <p> <img alt="安装步骤2" title="安装步骤2" src="./step-2.png" style="cursor: pointer;"/></p>
            </div>
        </div>
        <hr/>
    </div>

    <!-- MDUI JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/mdui@1.0.2/dist/js/mdui.min.js"></script>
    <script>
        <?php if($isInstall){ ?>
            mdui.alert('You have installed before !', 'Warning',function(){},{history:false});
        <?php } ?>
    </script>
</body>

</html>