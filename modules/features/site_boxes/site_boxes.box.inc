<?php

/**
 * Implementation of hook_default_box().
 */
function site_boxes_default_box() {
  $export = array();
  $box = new stdClass;
  $box->disabled = FALSE; /* Edit this to true to make a default box disabled initially */
  $box->api_version = 1;
  $box->delta = 'testbox';
  $box->plugin_key = 'simple';
  $box->title = 'Testbox';
  $box->description = 'My featurized Box';
  $box->options = array(
    'body' => 'Test box body. Nothing useful. Only filler text. Test box body. Nothing useful. Only filler text. Test box body. Nothing useful. Only filler text. Test box body. Nothing useful. Only filler text. Test box body. Nothing useful. Only filler text. Test box body. Nothing useful. Only filler text. Test box body. Nothing useful. Only filler text. Test box body. Nothing useful. Only filler text. Test box body. Nothing useful. Only filler text. ',
    'format' => '1',
  );

  $export['testbox'] = $box;
  return $export;
}
