<?php if(!defined("PHPOK_SET")){exit("<h1>Access Denied</h1>");} ?><?php $title = $cate_rs ? $cate_rs['title'].' - '.$page_rs['title'] : $page_rs['title'];?>
<?php $title=$title;?><?php $this->assign("title",$title); ?><?php $menutitle=$page_rs['title'];?><?php $this->assign("menutitle",$page_rs['title']); ?><?php $this->output("head","file"); ?>
<div class="banner"<?php if($page_rs['banner']){ ?> style="background-image:url('<?php echo $page_rs['banner']['gd']['auto'];?>')"<?php } ?>></div>

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
					Your Positison：
					<a href="<?php echo $sys['url'];?>" title="<?php echo $config['title'];?>">Home</a>
					<span class="arrow">&gt;</span> <a href="<?php echo $page_rs['url'];?>" title="<?php echo $page_rs['title'];?>"><?php echo $page_rs['title'];?></a>
					<?php if($cate_rs){ ?>
					<span class="arrow">&gt;</span> <a href="<?php echo $cate_rs['url'];?>" title="<?php echo $cate_rs['title'];?>"><?php echo $cate_rs['title'];?></a>
					<?php } ?>
				</span>
			</div>
			<ul class="product clearfix" style="padding-left:7px;">
				<?php $tmpid["num"] = 0;$rslist=is_array($rslist) ? $rslist : array();$tmpid["total"] = count($rslist);$tmpid["index"] = -1;foreach($rslist AS $key=>$value){ $tmpid["num"]++;$tmpid["index"]++; ?>
				<?php $thumb = currentDefine($value['thumb']);?>
				<li>
					<div class="img"><a href="<?php echo $value['url'];?>" title="<?php echo $value['title'];?>"><img src="<?php echo $thumb;?>" border="0" id="product_<?php echo $value['id'];?>" /></a></div>
					<h4><a href="<?php echo $value['url'];?>" title="<?php echo $value['title'];?>"><?php echo $value['title'];?></a></h4>
				</li>
				<?php } ?>
			</ul>
		</div>
		<?php $this->output("block_pagelist","file"); ?>
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