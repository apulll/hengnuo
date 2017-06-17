<?php if(!defined("PHPOK_SET")){exit("<h1>Access Denied</h1>");} ?><?php $title = $rs['title'].' - '.$cate_rs['title'].' - '.$page_rs['title'];?>
<?php $title=$title;?><?php $this->assign("title",$title); ?><?php $menutitle=$page_rs['title'];?><?php $this->assign("menutitle",$page_rs['title']); ?><?php $this->output("head","file"); ?>
<script type="text/javascript">
function order_create()
{
	$.dialog({
		'title':"订购咨询服务",
		'lock':true,
		'drag':false,
		'content':document.getElementById('zxform'),
		'fixed':true
	});
}
$(document).ready(function(){
	$("#furl").val('<?php echo $sys['url'];?><?php echo $rs['url'];?>');
	$("#form_furl").hide();
	$("#postform").submit(function(){
		if(!$("#fullname").val()){
			$.dialog.alert('请填写您的姓名');
			return false;
		}
		if(!$("#mobile").val()){
			$.dialog.alert('请留下您的手机号');
			return false;
		}
		if(!$("#note").val()){
			$.dialog.alert('请填写您要咨询的内容');
			return false;
		}
		$(this).ajaxSubmit({
			'url':api_url('post','save'),
			'type':'post',
			'dataType':'json',
			'success':function(rs){
				if(rs.status == 'ok'){
					$.dialog.alert('感觉您提交的咨询服务，我们客服会尽快与您取得联系',function(){
						$.phpok.reload();
					},'succeed');
				}else{
					$.dialog.alert(rs.content);
					return false;
				}
			}
		});
		return false;
	});
});

</script>
<div class="banner"<?php if($page_rs['banner']){ ?> style="background-image:url('<?php echo $page_rs['banner']['gd']['auto'];?>')"<?php } ?>></div>
<div id="zxform" style="display:none;">
	<form method="post" class="form" id="postform">
	<input type="hidden" name="id" value="zxservice" />
	<?php $list = phpok('zxform');?>
	<div class="table">
		<div class="l">产品名称：</div>
		<div class="r"><input type="text" name="title" id="title" value="<?php echo $rs['title'];?>" class="input noborder red" readonly /></div>
	</div>
	<?php $tmpid["num"] = 0;$list=is_array($list) ? $list : array();$tmpid["total"] = count($list);$tmpid["index"] = -1;foreach($list AS $key=>$value){ $tmpid["num"]++;$tmpid["index"]++; ?>
	<div class="table" id="form_<?php echo $value['identifier'];?>">
		<div class="l"><?php echo $value['title'];?>：</div>
		<div class="r"><?php echo $value['html'];?></div>
	</div>
	<?php } ?>
	<?php if($sys['is_vcode'] && function_exists('imagecreate')){ ?>
	<div class="table" id="form_<?php echo $value['identifier'];?>">
		<div class="l">验证码：</div>
		<div class="r">
			<input class="vcode"  type="text" name="_chkcode" id="_chkcode" />
			<img src="" border="0" align="absmiddle" id="vcode" class="hand" />
		</div>
	</div>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#vcode").phpok_vcode();
		$("#vcode").click(function(){
			$(this).phpok_vcode();
		});
	});
	</script>
	<?php } ?>
	<div class="table">
		<div class="l">&nbsp;</div>
		<div class="r"><input type="submit" value="提交" class="large button blue" /></div>
	</div>
	</form>
</div>
<div class="main clearfix">
	<div class="left">
		<?php $this->output("block_catelist","file"); ?>
		<?php $this->output("block_contact","file"); ?>
	</div>
	<div class="right">
		<div class="pfw">
			<div class="title">
				<h3><?php echo $cate_rs ? $cate_rs['title'] : $page_rs['title'];?></h3>
				<span class="breadcrumbs">
					Your position： ：
					<a href="<?php echo $sys['url'];?>" title="<?php echo $config['title'];?>">Home</a>
					<span class="arrow">&gt;</span> <a href="<?php echo $page_rs['url'];?>" title="<?php echo $page_rs['title'];?>"><?php echo $page_rs['title'];?></a>
					<?php if($cate_rs){ ?>
					<span class="arrow">&gt;</span> <a href="<?php echo $cate_rs['url'];?>" title="<?php echo $cate_rs['title'];?>"><?php echo $cate_rs['title'];?></a>
					<?php } ?>
				</span>
			</div>
			<div class="product clearfix">
				
				

			</div>

			<div class="detail product_info">
				<div class="content"><?php echo $rs['content'];?></div>
				
				
			</div>
		</div>
	</div>
</div>

<?php $this->output("foot","file"); ?>