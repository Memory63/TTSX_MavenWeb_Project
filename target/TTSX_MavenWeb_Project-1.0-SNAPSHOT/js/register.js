$(function(){

	var error_name = true;
	var error_password = true;
	var error_check_password = true;
	var error_email = true;
	var error_check = true;


	$('#user_name').blur(function() {
		check_user_name();
	});

	$('#pwd').blur(function() {
		check_pwd();
	});

	$('#cpwd').blur(function() {
		check_cpwd();
	});

	$('#email').blur(function() {
		check_email();
	});

	$('#allow').click(function () {
		if ($(this).is(':checked')) {
			error_check = false;
			$(this).siblings('span').hide();
		}
	});

	function check_allow() {
		if (!$("#allow").is(':checked')) {
			error_check = true;
			$(".error_tip2").html('请勾选同意');
			$(".error_tip2").show();
		}
	}


	/* 检查用户名是否存在，和输入是否正确 */
	function check_user_name(){
		var username = $.trim($('#user_name').val())
        var len = username.length;
		if(len<3||len>20) {
			$('#error_username').css('color','red');
			$('#user_name').next().html('请输入3-20个字符的用户名')
			$('#user_name').next().show();
			error_name = true;
		} else {
			/* 检查用户是否可用 */
			$.ajax({
				url:'checkUsername',
				type:'post',
				data:'username='+username,
				dataType:'text',
				success:function (data) {
					if(data==0){
						$('#error_username').css('color','#00ff00');
						error_name=false;
						$('#user_name').next().html('用户名可用')
						$('#user_name').next().show();
					}else{
						$('#error_username').css('color','red');
						error_name=true;
						$('#user_name').next().html('用户名已存在')
						$('#user_name').next().show();
					}
				}
			});
		}
	}

	function check_pwd(){
		var len = $('#pwd').val().length;
		if(len<3||len>20)
		{
			$('#pwd').next().html('密码最少8位，最长20位')
			$('#pwd').next().show();
			error_password = true;
		}
		else
		{
			$('#pwd').next().hide();
			error_password = false;
		}		
	}


	function check_cpwd(){
		var pass = $('#pwd').val();
		var cpass = $('#cpwd').val();

		if(pass!=cpass)
		{
			$('#cpwd').next().html('两次输入的密码不一致')
			$('#cpwd').next().show();
			error_check_password = true;
		}
		else
		{
			$('#cpwd').next().hide();
			error_check_password = false;
		}		
		
	}

	function check_email(){
		var re = /^[a-z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$/;

		if(re.test($('#email').val()))
		{
			$('#email').next().hide();
			error_email = false;
		}
		else
		{
			$('#email').next().html('你输入的邮箱格式不正确')
			$('#email').next().show();
			error_check_password = true;
		}

	}

	//注册，提交表单
	$("#sub").click(function () {


		check_user_name();
		check_pwd();
		check_cpwd();
		check_email();
		check_allow();

		if (error_name == false && error_password == false && error_check_password == false && error_email == false && error_check == false) {
			$(".reg_sub").removeAttr("disabled");
			$.ajax({
				url: 'register',
				type: 'post',
				data: JSON.stringify($('#reg_form').serializeJSON()),
				contentType: 'application/json;charset=UTF-8',
				success: function (data) {
					if (data == 1) {
						alert("注册成功");
						window.location="login";
						return true;
					} else {
						$(".reg_sub").attr("disabled", "true");
						alert("注册失败");
						return false
					}
				}
			})
		} else {
			$(".reg_sub").attr("disabled", "true");
			return false;
		}
	})
})