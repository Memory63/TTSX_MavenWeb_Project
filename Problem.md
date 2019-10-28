# 遇到的问题

### Ajax获取表单数据，并发送json数据

> * serializeJSON方法返回一个JS对象，并非JSON字符串。可以使用 JSON.stringify 转换成字符串
>```js
>    data:JSON.stringify($('#reg_form').serializeJSON()),
>```

### ajax异步请求

> * 因为是异步请求，所有执行流程不会从上而下执行

### 三目运算符真是个好东西

### 设置项目默认访问Controller

> * 方法一：
>    - 在mvc配置文件中配置

>```xml
> <!-- 定义无Controller的path<->view直接映射 -->
> <mvc:view-controller path="/" view-name="redirect:login" />
>```

> * 在web.xml配置文件中配置

> ```xml
><welcome-file-list>
>   <welcome-file>login</welcome-file>
></welcome-file-list>
>```

> * 方法二：
>    - 在controller类和该类方法上注解路径(“/”)

>```java
> @Controller
> @RequestMapping("/")
> public class index {
>   @RequestMapping(value = "/", method = RequestMethod.GET)
>   public String index(Model model){
>     return "index";
>   }
> }
>```

> * web.xml文件配置

>```xml
> <welcome-file-list>
>    <welcome-file></welcome-file>
> </welcome-file-list>
>```

> * 方法三：
>    - 在默认页面index.jsp内加

>```jsp
>    <meta http-equiv="refresh" content="0; url=login">
>```

### 使用shiro  realm 登录之后，怎么在session中存放用户的id

> * 重新去表里查询，再存到session中

>```java
> //获取登录之后，shiro保存的session
> Session session = subject.getSession();
>```

### 购物车使用ajax无法接受数据和转发

> * 因为ajax是异步请求，不会刷新页面，它会把请求都存到xxx东西里面(记不清了)
> * 所以后端handler不能重定向和跳转，返回基本类型或对象类型

### 购物怎么异步删除，并刷新局部区域

> * 删除成功后，使用jQuery或js移除那个商品标签即可
> * 删除以后，购物显示数据和总价没有实现
> * 复选框选中，出问题

### 使用shiro-redis-cache进行缓存时，一直无法触发

> * 原因：
>   - shiro的realm中继承错误类，当时我继承`AuthenticatingRealm`类
>   - 应该继承`AuthorizingRealm`类(这个类可以认证用户和验证权限)，
>   - 源码中简介的继承了缓存CachingRealm（带有缓存实现）

### 登录成功之后，怎么保存信息

> * 只能存到session中
