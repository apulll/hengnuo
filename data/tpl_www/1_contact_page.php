<?php if(!defined("PHPOK_SET")){exit("<h1>Access Denied</h1>");} ?><?php $title=$page_rs['title'];?><?php $this->assign("title",$page_rs['title']); ?><?php $menutitle=$page_rs['title'];?><?php $this->assign("menutitle",$page_rs['title']); ?><?php $this->output("head","file"); ?>
<div class="banner"<?php if($page_rs['banner']){ ?> style="background-image:url('<?php echo $page_rs['banner']['gd']['auto'];?>')"<?php } ?>></div>
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
			<div class="detail">
				<div class="content" style="margin:0;">
					<div id="map" style="height:300px;width: 700px;"></div>
					<?php echo $page_rs['content'];?>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function initMap() {
        var uluru = {lat:36.820328, lng: 118.0475203};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 10,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDQEwkM0aSC_6I-OYI-cnPYYjBl0N7i5wU&callback=initMap"
    async defer></script>
<?php $this->output("foot","file"); ?>