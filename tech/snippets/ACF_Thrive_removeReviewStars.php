<?php
# Removes the star rating on thrive if there's no ACF field containing a reference or review

$referenceField = 'reference';

if(!get_field($referenceField) ) {
	echo '<style>.thrv-rating {display:none}</style>';
}