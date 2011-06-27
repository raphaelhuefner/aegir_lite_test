<?php

/**
 * Implementation of hook_context_default_contexts().
 */
function site_boxes_context_default_contexts() {
  $export = array();
  $context = new stdClass;
  $context->disabled = FALSE; /* Edit this to true to make a default context disabled initially */
  $context->api_version = 3;
  $context->name = 'testcontext';
  $context->description = '';
  $context->tag = 'testing';
  $context->conditions = array(
    'sitewide' => array(
      'values' => array(
        1 => 1,
      ),
    ),
  );
  $context->reactions = array(
    'block' => array(
      'blocks' => array(
        'boxes-testbox' => array(
          'module' => 'boxes',
          'delta' => 'testbox',
          'region' => 'right',
          'weight' => 0,
        ),
      ),
    ),
  );
  $context->condition_mode = 0;

  // Translatables
  // Included for use with string extractors like potx.
  t('testing');

  $export['testcontext'] = $context;
  return $export;
}
