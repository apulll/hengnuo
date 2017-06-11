<?php if(!defined("PHPOK_SET")){exit("<h1>Access Denied</h1>");} ?><?php $this->output("head_open","file"); ?>
<?php if($type == "picture"){ ?>
	<div style="margin-top:3px;"><img src="<?php echo $rs['filename'];?>" onload="javascript:if(this.width>600)this.width=600;"></div>
	<?php $rs_gd_id["num"] = 0;$rs['gd']=is_array($rs['gd']) ? $rs['gd'] : array();$rs_gd_id["total"] = count($rs['gd']);$rs_gd_id["index"] = -1;foreach($rs['gd'] AS $key=>$value){ $rs_gd_id["num"]++;$rs_gd_id["index"]++; ?>
	<div style="margin-top:3px;"><img src="<?php echo $value['filename'];?>" onload="javascript:if(this.width>600)this.width=600;"></div>
	<?php } ?>
<?php }elseif($type == "video"){ ?>
	<div id="video" style="position:relative;z-index: 100;width:600px;height:400px;"><div id="a1">
		<p style="text-align:center"><embed type="application/x-shockwave-flash" class="edui-faked-video" pluginspage="http://www.macromedia.com/go/getflashplayer" src="js/vcastr.swf?xml={vcastr}{channel}{item}{source}../../<?php echo $rs['filename'];?>{/source}{duration}{/duration}{title}{/title}{/item}{/channel}{config}{isAutoPlay}false{/isAutoPlay}{isLoadBegin}false{/isLoadBegin}{/config}{plugIns}{beginEndImagePlugIn}{url}js/image.swf{/url}{source}{/source}{type}beginend{/type}{scaletype}exactFil{/scaletype}{/beginEndImagePlugIn}{/plugIns}{/vcastr}" width="400px" height="300px" wmode="transparent" play="true" loop="false" menu="false" allowscriptaccess="never" allowfullscreen="true"/></p>
	</div></div>
<?php } else { ?>
<div class="table">
	<div class="title">
		附件名称：
		<span class="note"><?php echo $rs['title'];?></span>
	</div>
</div>
<div class="table">
	<div class="title">
		文件路径：
		<span class="note"><?php echo $rs['filename'];?>，<a href="<?php echo admin_url('res_action','download');?>&id=<?php echo $rs['id'];?>" title="下载附件">点这里下载</a></span>
	</div>
</div>
<div class="table">
	<div class="title">
		上传时间：
		<span class="note"><?php echo date("Y-m-d",$rs['addtime']);?></span>
	</div>
</div>
<?php } ?>


<?php $this->output("foot_open","file"); ?>