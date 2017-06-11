<?php if(!defined("PHPOK_SET")){exit("<h1>Access Denied</h1>");} ?><?php $title = $rs['title'].' - '.$cate_rs['title'].' - '.$page_rs['title'];?>
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
					Your Position：
					<a href="<?php echo $sys['url'];?>" title="<?php echo $config['title'];?>">Home</a>
					<span class="arrow">&gt;</span> <a href="<?php echo $page_rs['url'];?>" title="<?php echo $page_rs['title'];?>"><?php echo $page_rs['title'];?></a>
					<?php if($cate_rs){ ?>
					<span class="arrow">&gt;</span> <a href="<?php echo $cate_rs['url'];?>" title="<?php echo $cate_rs['title'];?>"><?php echo $cate_rs['title'];?></a>
					<?php } ?>
				</span>
			</div>
			<div class="detail">
				<h1><?php echo $rs['title'];?></h1>
				<div class="date_hits_tags">
					Release date：<span><?php echo date('d-m-y',$rs['dateline']);?></span>&nbsp;&nbsp;&nbsp;
					Browse times：<span class="hits"><?php echo $rs['hits'];?></span>
					
				</div>
				<div class="content"><?php echo $rs['content'];?></div>
				<div class="np">
					<p>The previous topic：
						<?php $prev = phpok_prev($rs);?>
						<?php if($prev){ ?>
						<a href="<?php echo $prev['url'];?>" title="<?php echo $prev['title'];?>"><?php echo $prev['title'];?></a>
						<?php } else { ?>
						None
						<?php } ?>
					</p>
					<p>The next topic：
						<?php $next = phpok_next($rs);?>
						<?php if($next){ ?>
						<a href="<?php echo $next['url'];?>" title="<?php echo $next['title'];?>"><?php echo $next['title'];?></a>
						<?php } else { ?>
						None
						<?php } ?>
					</p>
				</div>
				
			</div>
		</div>
	</div>
</div>

<?php $this->output("foot","file"); ?>