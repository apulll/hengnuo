<?php if(!defined("PHPOK_SET")){exit("<h1>Access Denied</h1>");} ?><?php echo tpl_head(array('title'=>$title,'css'=>"tpl/www/css/style.css,artdialog.css",'js'=>"tpl/www/js/global.js,jquery.artdialog.js",'html5'=>"true"));?>
<body>
<header class="clearfix">
	<div class="logo"><a href="<?php echo $sys['url'];?>" title="<?php echo $config['title'];?>"><img src="<?php echo $config['logo'];?>" alt="<?php echo $config['title'];?>" /></a></div>
</header>
<nav class="menu">
<ul>
	<?php $list = phpok('menu');?>
	<?php $list_id["num"] = 0;$list['rslist']=is_array($list['rslist']) ? $list['rslist'] : array();$list_id["total"] = count($list['rslist']);$list_id["index"] = -1;foreach($list['rslist'] AS $key=>$value){ $list_id["num"]++;$list_id["index"]++; ?>
	<li<?php if($menutitle == $value['title']){ ?> class="current"<?php } ?><?php if(!$list_id['index']){ ?> style="margin-left:4px;"<?php } ?>>
		<a href="<?php echo $value['url'];?>" title="<?php echo $value['title'];?>" target="<?php echo $value['target'];?>"><?php echo $value['title'];?></a>
		<?php if($value['sonlist']){ ?>
		<ul>
			<?php $value_sonlist_id["num"] = 0;$value['sonlist']=is_array($value['sonlist']) ? $value['sonlist'] : array();$value_sonlist_id["total"] = count($value['sonlist']);$value_sonlist_id["index"] = -1;foreach($value['sonlist'] AS $k=>$v){ $value_sonlist_id["num"]++;$value_sonlist_id["index"]++; ?>
			<li><a href="<?php echo $v['url'];?>" title="<?php echo $v['title'];?>" target="<?php echo $v['target'];?>"><?php echo $v['title'];?></a></li>
			<?php } ?>
		</ul>
		<?php } ?>
	</li>
	<?php } ?>
</ul>
</nav>