<?php

// TODO:设置错误级别
error_reporting(E_ALL);
//打开错误提示
ini_set("display_errors", "1");
//定义分隔符常量
define('DS', DIRECTORY_SEPARATOR);
//定义项目目录
define('APP_PATH', dirname(dirname(__FILE__)) . DS . "application" . DS);
//定义web根目录
define('WWW_ROOT', dirname(dirname(__FILE__)) . DS);
//定义站点名
$siteName = "XFS-TEST";
//安装锁目录(文件名)
$lockFile = '.' . DS . "install.lock";
//检查是否已经安装过
if (is_file($lockFile)) {
    exit('You have installed our programme before!Please delete the file <font color=red> /install/install.lock </font> and then try it again!');
}
if (isset($_POST['statu']) && $_POST['statu'] == 1) {
    //执行安装
    $result = [];
    $result['title'] = 'Error';
    $result['statu'] = 0;
    $hostname = trim($_POST['database']['hostname']);
    $sqlType = trim($_POST['database']['sqlType']);
    $port = trim($_POST['database']['port']);
    $database = trim($_POST['database']['database']);
    $username = trim($_POST['database']['username']);
    $password = trim($_POST['database']['password']);
    $prefix = trim($_POST['database']['prefix']);
    $adminUsername = trim($_POST['admin']['username']);
    $adminPassword = trim($_POST['admin']['password']);
    $adminPasswordAgain = trim($_POST['admin']['passwordAgain']);
    //检查输入
    if (!isset($hostname) || empty($hostname)) {
        $result['message'] = 'Your "Hostname" is not filled in';
        exit(json_encode($result));
    }
    if (!isset($port) || empty($port)) {
        $result['message'] = 'Your "Port" is not filled in';
        exit(json_encode($result));
    }
    if (!isset($username) || empty($username)) {
        $result['message'] = 'Your "Username" is not filled in';
        exit(json_encode($result));
    }
    if (!isset($password) || empty($password)) {
        $result['message'] = 'Your "Password" is not filled in';
        exit(json_encode($result));
    }
    if (!isset($prefix) || empty($prefix)) {
        $result['message'] = 'Your "Prefix" is not filled in';
        exit(json_encode($result));
    }
    if (!isset($adminUsername) || empty($adminUsername)) {
        $result['message'] = 'Your "Admin Username" is not filled in';
        exit(json_encode($result));
    }
    if (!isset($adminPassword) || empty($adminPassword)) {
        $result['message'] = 'Your "Admin Password" is not filled in';
        exit(json_encode($result));
    }
    if (!isset($adminPasswordAgain) || empty($adminPasswordAgain)) {
        $result['message'] = 'Your "Admin Password Again" is not filled in';
        exit(json_encode($result));
    }
    if ($adminPassword != $adminPasswordAgain) {
        $result['message'] = 'Your "Admin Password Again" is not eqauled with "Admin Password"';
        exit(json_encode($result));
    }
    //判断是否为IP地址
    preg_match("/^((2(5[0-5]|[0-4]\d))|1\d{2}|[1-9]?\d)(\.((2(5[0-5]|[0-4]\d))|1\d{2}|[1-9]?\d)){3}$/", $hostname, $isHostname);
    if (!$isHostname && !($hostname == "localhost")) {
        $result['message'] = 'Your "Hostname" is not true';
        exit(json_encode($result));
    }
    //判断是否为端口号
    preg_match("/^6[0-4]\d{3}|65[0-4]\d{2}|655[0-2]\d|6553[0-5]|[0-5]?\d{0,4}$/", $port, $isPort);
    if (!$isPort) {
        $result['message'] = 'Your "Port" is not true';
        exit(json_encode($result));
    }
    //判断admin用户名密码等
    preg_match("/^\w{5,16}$/", $adminUsername, $isAdminUsername);
    if (!$isAdminUsername) {
        $result['message'] = 'The "AdminUsername" must contain 6 to 16 characters and only digits or letters';
        exit(json_encode($result));
    }
    $isAdminPassword = mb_strlen($adminPassword);
    if (!($isAdminPassword <= 18 || $isAdminPassword >= 8)) {
        $result['message'] = 'The "AdminPassword" must contain 8 to 18 characters';
        exit(json_encode($result));
    }
    //检测能否读取安装文件
    $sqlFile = WWW_ROOT . 'install' . DS . "install.sql";
    $sql = @file_get_contents($sqlFile); //加@防止SQL错误导致不能继续运行
    if (!$sqlFile) {
        $result['message'] = 'Please check whether "' . WWW_ROOT . 'install' . DS . "install.sql" . '" has read permission';
        exit(json_encode($result));
    }
    // //替换表前缀
    // $sql = str_replace("`xiaoyewl_", "`{$prefix}", $sql);
    //检查是否安装了PDO扩展
    if (!extension_loaded('pdo')) {
        $result['message'] = 'Please check whether you have the PDO extension installed ';
        exit(json_encode($result));
    }
    //链接数据库
    try {
        $pdo = new PDO("{$sqlType}:host={$hostname};port={$port}", $username, $password, [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"
        ]);
        //开启事务
        $pdo->beginTransaction();
        $pdo->exec('use ' . $database);
        $pdo->exec($sql);
        $adminPassword = md5($adminPassword);
        $pdo->exec("update {$prefix}admin SET name = '{$adminUsername}',password = '{$adminPassword}'  ");
        //提交事务
        $pdo->commit();
    } catch (PDOException $e) {
        $result['message'] = 'Database connection failure , please check your database information and make sure your database is opening';
        $pdo->rollBack();
        exit(json_encode($result));
    }
    //释放资源
    $pdo = null;
    //替换数据库相关配置

    $databaseConfig = [
        // 数据库类型
        'type' => 'mysql',
        // 服务器地址
        'hostname' => $hostname,
        // 数据库名
        'database' => $database,
        // 用户名
        'username' => $username,
        // 密码
        'password' => $password,
        // 端口
        'hostport' => $port,
        // 连接dsn
        'dsn' => '',
        // 数据库连接参数
        'params' => [],
        // 数据库编码默认采用utf8
        'charset' => 'utf8',
        // 数据库表前缀
        'prefix' => $prefix,
        // 数据库调试模式
        'debug' => true,
        // 数据库部署方式:0 集中式(单一服务器),1 分布式(主从服务器)
        'deploy' => 0,
        // 数据库读写是否分离 主从式有效
        'rw_separate' => false,
        // 读写分离后 主服务器数量
        'master_num' => 1,
        // 指定从服务器序号
        'slave_no' => '',
        // 自动读取主库数据
        'read_master' => false,
        // 是否严格检查字段是否存在
        'fields_strict' => true,
        // 数据集返回类型
        'resultset_type' => 'array',
        // 自动写入时间戳字段
        'auto_timestamp' => false,
        // 时间字段取出后的默认时间格式
        'datetime_format' => 'Y-m-d H:i:s',
        // 是否需要进行SQL性能分析
        'sql_explain' => false,
    ];
    //检查是否为tp5框架安装
    if (@file_get_contents(APP_PATH . '../../application/database.php')) {
        $putConfig = @file_put_contents(APP_PATH . '../../application/database.php', "<?php\nreturn \n" . var_export($databaseConfig, true) . "\n;");
        if (!$putConfig) {
            $result['message'] = 'Installed wrong, make sure we can write in the path "' . APP_PATH . '../../application/database.php' . '"';
            exit(json_encode($result));
        }
    }
    if (@file_put_contents($lockFile, '安装锁')) {
        $result['title'] = 'Success';
        $result['statu'] = 1;
        $result['message'] = "Installed Success !!!";
        exit(json_encode($result));
    } else {
        $result['message'] = "Installed wrong, make sure we can write in the path \"{$lockFile}\"";
        exit(json_encode($result));
    }
    //返回json数据
    exit(json_encode($result));
}
require_once "install.html";
