<?php

// Load credentials from a file in your home directory
// Command line options:
//     --ipam-credentials-file='/some/other/path.json'

function loadJSONFromFile($filename)
{
    $contents = file_get_contents($filename);
    assert(strlen($contents)>0);
    $json_stuff=json_decode($contents, true);
    if ($json_stuff === null)
    {
        fwrite(STDERR, "Bad json file: $filename" . PHP_EOL);
        exit(1);
    }
    return $json_stuff;
}

$my_home_dir = posix_getpwuid(posix_getuid())['dir'];

$shortopts = "";
$longopts = array(
    'ipam-credentials-file::', // This is optional
);
$default_options = array(
    'ipam-credentials-file' => "$my_home_dir/.config/IAS/some-awesome-project/ipam_credentials.json",
);

$options = getopt($shortopts, $longopts) + $default_options;

$ipam_credentials = loadJSONFromFile($options['ipam-credentials-file']);

print("Options:\n");
var_dump($options);

print("Credentials:\n");
var_dump($ipam_credentials);
