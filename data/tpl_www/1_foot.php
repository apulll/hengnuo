<?php if(!defined("PHPOK_SET")){exit("<h1>Access Denied</h1>");} ?>
<div class="foot">
	<div class="copyright"><?php echo $config['ext']['content'];?></div>
	<?php if($sys['debug']){ ?><div class="debug"><?php echo debug_time('1','1','1','1');?></div><?php } ?>
</div>


<?php echo $app->plugin_html_ap("phpokbody");?></body>
</html>