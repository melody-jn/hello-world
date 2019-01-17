### 提供http服务 访问80端口返回页面信息

页面信息包含：

1. Hello World  作为校验访问服务是否正确，同时会输出容器的hostname

2. 如果设置了环境变量text 会在页面返回这个环境变量的value 作为校验环境变量是否生效，以及做LB规则匹配时使用

3. 如果设置了COOKIE环境变量，会在浏览器访问时塞入以该环境变量的value为key的cookie，cookie的value为<cookie_value>-<container_hostname>

### 同时在启动容器时会打印日志：logglogloglog 生成日志文件/var/hchan.txt

### 在容器启动后会持续生成日志 每秒钟一条 且会吧日志输出到/var/hehe.txt文件中

### 容器内包含命令 vim curl,没有bash只有sh
