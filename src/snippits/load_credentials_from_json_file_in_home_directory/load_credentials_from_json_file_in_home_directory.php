<?php

// Load credentials from a file in your home directory
// Command line options:
//     --ipam-credentials-file='/some/other/path.json'

// COPY/PASTE (doesn't change)
function loadJSONFromFile($filename)
{
    $contents = file_get_contents($filename);
    assert(strlen($contents)>0);
    return json_decode($contents);
}

$my_home_dir = posix_getpwuid(posix_getuid())['dir'];
// End COPY/PASTE

// Boilerplate code for options
$shortopts = "";
$longopts = array(
    'ipam-credentials-file::', // This is optional
);
$default_options = array(
    'ipam-credentials-file' => "$my_home_dir/.config/IAS/some-awesome-project/ipam_credentials.json",
);

// Addition of associative arrays in PHP is UNION with left side
// preferred
$options = getopt($shortopts, $longopts) + $default_options;

$ipam_credentials = loadJSONFromFile($options['ipam-credentials-file']);
// End Boilerplate code for options

print("Options:\n");
var_dump($options);

print("Credentials:\n");
var_dump($ipam_credentials);
