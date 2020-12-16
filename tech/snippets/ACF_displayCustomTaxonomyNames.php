<?php

# Assumes an Advanced Custom Field, Custom Taxonomy is in place.
# Prints out all of the entries for the current post

$taxonomyName = 'services';

$terms = get_the_terms( $post->ID , $taxonomyName ); 
$num_entries = count($terms);
$this_entry = 0;

foreach ( $terms as $term ) {

    $term_link = get_term_link( $term, $taxonomyName );
    if ( is_wp_error( $term_link ) )
        continue;

	$this_entry++;
	   	echo $term->name;
    if ($this_entry < $num_entries) {
    	echo ", ";
	}
}

