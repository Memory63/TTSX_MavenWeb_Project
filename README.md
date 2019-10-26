# 项目名：天天生鲜(TTSX_MavenWeb_Project)

## 功能

### 注册：
>   - 验证用户名是否重复；(ajax)✔  
>   - 用户名是否3-20字符；(js)✔ 
>   - 密码至少3-20；(js)✔  
>   - 邮箱格式要正确 且不能为空；(js+正则)✔  
>   - 如果验证没通过，则不发送注册请求(js)✔  
>   - 密码存储密文✔  
>   - 注册成功后显示注册成功，然后跳转到登录页面。✔  
		 
### 登录时:
>   - 添加验证码；✔  
>   - 异步校验验证码，验证码不正确不能发送登录请求；✔  
>   - 用户名和密码不能为空，否则不发送登录请求；✔  
>   - 登录错误时，显示提示信息"用户名或密码错误"；✔  
>   - 用户名和邮箱均可登录；😒  
>   - 添加记住我功能，一周内登录自动填充用户名；(shiro)✔  
>   - 登录成功后，显示登录成功，然后跳转首页。(ajax)✔  
		  
### 首页：
>   - index.jsp😁  
>   - 显示 "欢迎您,xxx"✔  
>   - 显示商品的所有分类😂  
>   - 显示每个分类的商品，点击每个商品，进入商品详情页面🤔😂  
>   - "查看更多"，显示对应类别的商品列表页面："list.html"😁  

### 列表页面：
>   - list.html	✔	  
>   - 使用默认排序，点击价格时根据价格排序。(动态sql)😁  
>   - 点击每个商品，进入商品详情页✔  
>   - 添加分页功能(pageHelper插件)😊  
>   - 完成左边栏，新品推荐功能(商品需要记录上架时间)🤔  

### 商品详情页面：
>   - detail.html✔  
>   - 完成基本信息的展示(图片，标题，描述，价格，总价，商品详情)😊  
>   - 完成增加，减少商品数量功能(总价要随之更新)👌  
>   - 点击“加入购物车”，将商品存入用户购物车(需要身份认证)(用户id、商品id、商品数量)🤔😉 
>   - 点击“加入购物车”，将右上角“购物车角标数字异步更新”🤔异步老出错

### 购物车页面：
>   - cart.html ✔ 
>   - 完成基本信息的展示  ✔
>   - 购物车删除功能  ✔
>       - 删除登录用户下购物车中的商品✔

### 优化
>   - 对于商品的查询，都通过缓存，改善查询效率🤔
			  
### 定义后台系统  
>   - 完成商品的添加(基本信息，图片上传)	  
>   - 商品的删除  
>   - 商品的修改  
>   - 建立两种角色：user /  admin  
>   - 两种权限：product:query  product:update  
>   - product:update权限的才可以堆商品进行 添加和修改  

## 遇到的问题  		  

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

> * 暂没解决

### 购物怎么异步删除，并刷新局部区域

> * 删除成功后，使用jQuery或js移除那个商品标签即可


			  	  


