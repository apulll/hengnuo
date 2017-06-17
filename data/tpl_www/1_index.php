<?php if(!defined("PHPOK_SET")){exit("<h1>Access Denied</h1>");} ?><?php $menutitle="网站首页";?><?php $this->assign("menutitle","网站首页"); ?><?php $this->output("head","file"); ?>
<?php $list = phpok('picplayer');?>
<?php if($list['total']){ ?>
<div class="indexbanner"<?php if($list['project']['height']){ ?> style="height:<?php echo $list['project']['height'];?>px;"<?php } ?>>
	<div class="bd">
	<ul>
		<?php $list_rslist_id["num"] = 0;$list['rslist']=is_array($list['rslist']) ? $list['rslist'] : array();$list_rslist_id["total"] = count($list['rslist']);$list_rslist_id["index"] = -1;foreach($list['rslist'] AS $key=>$value){ $list_rslist_id["num"]++;$list_rslist_id["index"]++; ?>
		<li><a href="<?php echo $value['link'];?>" target="<?php echo $value['target'];?>" title="<?php echo $value['title'];?>"><img src="images/blank.gif" _src="<?php echo $value['banner']['filename'];?>" width="980" alt="<?php echo $value['title'];?>"<?php if($list['project']['height']){ ?> style="height:<?php echo $list['project']['height'];?>px;"<?php } ?> /></a></li>
		<?php } ?>
	</ul>
	</div>
	<div class="hd">
	<ul>
		<?php $tmpid["num"] = 0;$list['rslist']=is_array($list['rslist']) ? $list['rslist'] : array();$tmpid["total"] = count($list['rslist']);$tmpid["index"] = -1;foreach($list['rslist'] AS $key=>$value){ $tmpid["num"]++;$tmpid["index"]++; ?>
		<li></li>
		<?php } ?>
	</ul>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$(".indexbanner").slide({'autoPlay':true,'switchLoad':'_src','mainCell':'.bd ul'});
});
</script>
<?php } ?>
<div class="main index clearfix">
		<?php $list = phpok('product');?>
	<div class="pfw">
		<div class="title"><h3><?php echo $list['project']['title'];?></h3><a class="more" href="<?php echo $list['project']['url'];?>">More</a></div>
		<ul class="product clearfix">
			<?php $tmpid["num"] = 0;$list['rslist']=is_array($list['rslist']) ? $list['rslist'] : array();$tmpid["total"] = count($list['rslist']);$tmpid["index"] = -1;foreach($list['rslist'] AS $key=>$value){ $tmpid["num"]++;$tmpid["index"]++; ?>
			<?php $thumb = current($value['thumb']);?>
			<li>
				<div class="img"><a href="<?php echo $value['url'];?>" title="<?php echo $value['title'];?>"><img src="<?php echo $thumb['gd']['thumb'];?>" border="0" id="product_<?php echo $value['id'];?>" /></a></div>
				<h4><a href="<?php echo $value['url'];?>" title="<?php echo $value['title'];?>"><?php echo $value['title'];?></a></h4>
			</li>
			<?php } ?>
		</ul>
	</div>
	
	<div class='clear'></div>
	<div class="left">
		
		<?php $list = phpok('news');?>
		<div class="pfw">
			<div class="title"><h3><?php echo $list['project']['title'];?></h3><a class="more" href="<?php echo $list['project']['url'];?>">More</a></div>
			<ul class="artlist">
				<?php $list_rslist_id["num"] = 0;$list['rslist']=is_array($list['rslist']) ? $list['rslist'] : array();$list_rslist_id["total"] = count($list['rslist']);$list_rslist_id["index"] = -1;foreach($list['rslist'] AS $key=>$value){ $list_rslist_id["num"]++;$list_rslist_id["index"]++; ?>
				<li><a href="<?php echo $value['url'];?>" title="<?php echo $value['title'];?>"><?php echo phpok_cut($value['title'],'15','…');?></a><?php if($value['dateline'] + 24 * 3600 > $sys['time']){ ?> <img src="tpl/www/images/new.gif" /><?php } ?></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="right">
		<?php $arc = phpok('about');?>
		<div class="pfw clearfix">
			<div class="title"><h3><?php echo $arc['title'];?></h3><a class="more" href="<?php echo $arc['url'];?>">More</a></div>
			<div class="about"><?php if($arc['thumb']){ ?><img src="<?php echo $arc['thumb']['gd']['thumb'];?>" border="0" align="left" style="margin-right:10px;width:80px;" /><?php } ?><?php echo $arc['note'];?></div>
		</div>
		<?php $contact = phpok('contact');?>
		<div class="pfw clearfix">
			<div class="title"><h3><?php echo $contact['title'];?></h3><a class="more" href="<?php echo $contact['url'];?>">More</a></div>
			<div class="about">
				<div>Company：<?php echo $contact['company'];?></div>
				<div>Address：<?php echo $contact['address'];?></div>
				<div>Tel：<?php echo $contact['tel'];?></div>
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