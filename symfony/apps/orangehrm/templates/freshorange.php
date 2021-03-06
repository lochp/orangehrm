<?php 

// Allow header partial to be overridden in individual actions
// Can be overridden by: slot('header', get_partial('module/partial'));
include_slot('header', get_partial('global/header'));
?>
<style>
#lms{
	font-weight:700;
	font-size:1.7em;
	color:#004a99;
	opacity:1;
  position:absolute;
  top:0;
  left:37%;
  top:30px;
  margin-left:auto;
  margin-right:auto;
  width:300px;
}
@media only screen 
and (max-width : 600px) {
	#lms{
  left:30%;
	}
@media only screen 
and (max-width : 800px) {
	#lms{
		opacity:0;
	}
/* Styles */
}
</style>
    </head>
    <body>
      
        <div id="wrapper">
            
            <div id="branding">
                <img src="<?php echo theme_path('images/logo.png')?>" width="318" height="67" alt="UpskillsHRM"/><div id="lms">Human Resources System</div>
                <a href="http://www.upskills.com/" class="subscribe" target="_blank">Upskills Main Site</a>
                <a href="#" id="welcome" class="panelTrigger"><?php echo __("Welcome %username%", array("%username%" => $sf_user->getAttribute('auth.firstName'))); ?></a>
               
                <div id="welcome-menu" class="panelContainer">
                    <ul>
                        <li><a href="<?php echo url_for('admin/changeUserPassword'); ?>"><?php echo __('Change Password'); ?></a></li>
                        <li><a href="<?php echo url_for('auth/logout'); ?>"><?php echo __('Logout'); ?></a></li>
                    </ul>
                </div>
                <div id="help-menu" class="panelContainer">
                    <ul>
                      <li></li>
                        <li><a href="http://10.0.1.15:8080/orange/orangehrm-3.1.1/symfony/web/webres_521db8499614c0.51100681/uploadfiles.php" ><?php echo __('Upload Files!'); ?></a></li>
                      
                    </ul>
                </div>
            </div> <!-- branding -->      
            
            <?php include_component('core', 'mainMenu'); ?>

            <div id="content">

                  <?php echo $sf_content ?>

            </div> <!-- content -->
          
        </div> <!-- wrapper -->
        
        <div id="footer">
            <?php include_partial('global/copyright');?>
        </div> <!-- footer -->        
        
        
<?php include_slot('footer', get_partial('global/footer'));?>