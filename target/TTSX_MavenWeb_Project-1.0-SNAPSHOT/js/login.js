$(function () {
    var error_username=false;
    var error_password=false;
    var error_captcha=false;

    /* 刷新验证码 */
    $("#captcha").click(function () {
        $(this).attr("src","/TTSX_MavenWeb_Project/captcha?n="+Math.random());
    });

    $("#username").blur(function () {
        check_username();
    })

    $("#password").blur(function () {
        check_password();
    })

    $("#code").blur(function () {
        check_captcha();
    })

    /* 验证用户名 */
    function check_username(){
        var username = $("#username").val().trim();
        if(username.length>=3&&username.length<=20){
            $(".user_error").text('');
            error_username=true;
        }else{
            $(".user_error").text('请输入3-20个字符的用户名').css("color","red").show();
            error_username=false;
        }
    }

    /* 验证密码 */
    function check_password(){
        var password= $("#password").val().trim();
        if(password.length>=3&&password.length<=20){
            $(".pwd_error").text('');
            error_password=true;
        }else{
            $(".pwd_error").text('请输入3-20个字符的密码').css("color","red").show();
            error_password=false;
        }
    }

    /* 验证验证码时候输入正确 */
    function check_captcha(){
        var code = $("#code").val().trim();
        if(code.length!=0){
            $.ajax({
                url:'captchaCheck',
                type:'post',
                data:'code='+code,
                success:function (data) {
                    if(data==1){
                        $("#codeMsg").text('ok').css("color","#00ff00");
                        error_captcha=true;
                    }else{
                        $("#codeMsg").text('error').css("color","red");
                        $("#captcha").attr("src","/TTSX_MavenWeb_Project/captcha?n="+Math.random());
                        error_captcha=false;
                    }
                }
            });
        }else{
            $("#captcha").attr("src","/TTSX_MavenWeb_Project/captcha?n="+Math.random());
            $("#codeMsg").text('请输入验证码').css("color","red");
            error_captcha=false;
        }
    }

    /* 提交验证，提交数据所有正确才可提交 */
    $("#sub").click(function () {

        check_username();
        check_password();
        check_captcha();

        window.setTimeout(main,500)
    })
    function main(){
        if(error_username==true&&error_password==true&&error_captcha==true){
            $.ajax({
                url:'login',
                type:'post',
                data:$('#user_form').serialize(),
                success:function (data) {
                    if(data==1){
                        alert("登陆成功");
                        window.location="index";
                    }else{
                        alert("用户名或密码错误");
                        $("#captcha").attr("src","/TTSX_MavenWeb_Project/captcha?n="+Math.random());
                        return false;
                    }
                }
            });
            // alert("未知错误,请联系管理员");
            // return false;
        }else{
            $("#captcha").attr("src","/TTSX_MavenWeb_Project/captcha?n="+Math.random());
            return false;
        }
    }
});
