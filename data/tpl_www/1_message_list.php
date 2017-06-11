<?php if(!defined("PHPOK_SET")){exit("<h1>Access Denied</h1>");} ?><?php $title = $cate_rs ? $cate_rs['title'].' - '.$page_rs['title'] : $page_rs['title'];?>
<?php $title=$title;?><?php $this->assign("title",$title); ?><?php $menutitle=$page_rs['title'];?><?php $this->assign("menutitle",$page_rs['title']); ?><?php $this->output("head","file"); ?>
<div class="banner"<?php if($page_rs['banner']){ ?> style="background-image:url('<?php echo $page_rs['banner']['gd']['auto'];?>')"<?php } ?>></div>
<script type="text/javascript">
$(document).ready(function(){
	$("#postform").submit(function(){
		
		$(this).ajaxSubmit({
			'url':api_url('post','save'),
			'type':'post',
			'dataType':'json',
			'success':function(rs){
				if(rs.status == 'ok'){
					$.dialog.alert('Feel you submit the message, we will process your message as soon as possible',function(){
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
<div class="main clearfix">
	<div class="left">
		<?php $this->output("block_contact","file"); ?>
	</div>
	<div class="right">
		<div class="pfw">
			<div class="title">
				<h3><?php echo $page_rs['title'];?></h3>
				<span class="breadcrumbs">
					Your position：
					<a href="<?php echo $sys['url'];?>" title="<?php echo $config['title'];?>">Home</a>
					<span class="arrow">&gt;</span> <a href="<?php echo $page_rs['url'];?>" title="<?php echo $page_rs['title'];?>"><?php echo $page_rs['title'];?></a>
				</span>
			</div>
			<div class="message_post">
			<form method="post" class="form" id="postform">
			<input type="hidden" name="id" value="<?php echo $page_rs['identifier'];?>" />
			<?php $list = phpok('_fields','pid='.$page_rs['id'].'&fields_format=1&in_title=1');?>
			<?php $tmpid["num"] = 0;$list=is_array($list) ? $list : array();$tmpid["total"] = count($list);$tmpid["index"] = -1;foreach($list AS $key=>$value){ $tmpid["num"]++;$tmpid["index"]++; ?>
			<div class="table clearfix" id="form_<?php echo $value['identifier'];?>">
				<div class="l"><?php echo $value['title'];?>：</div>
				<div class="r"><?php echo $value['html'];?></div>
			</div>
			<?php } ?>
			<div class="table clearfix">
				<div class="l">&nbsp;</div>
				<div class="r"><input type="submit" value="Submit" class="large button blue" /></div>
			</div>
			</form>
			</div>
		</div>
		
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$(".thumb").mouseover(function(){
		var pid = $(this).attr('data-id');
		var thumb = $(this).attr('data');
		$("#product_"+pid).attr("src",thumb);
		$(".thumb[data-id="+pid+"]").removeClass("hover");
		$(this).addClass('hover');
	});
});
</script>
<?php $this->output("foot","file"); ?>