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

$options = getopt($shortopts, $longopts);

// Set default value for options:
$ipam_credentials_file = $options['ipam-credentials-file']
    ?? "$my_home_dir/.config/IAS/some-awesome-project/ipam_credentials.json";

// print("ipam_credentials_file: " . $ipam_credentials_file . "\n");

$ipam_credentials = loadJSONFromFile($ipam_credentials_file);
// End Boilerplate code for options

var_dump($ipam_credentials);
