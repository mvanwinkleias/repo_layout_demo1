realbin=__FILE__
if File.lstat(realbin).symlink?
        realbin=File.readlink(__FILE__)
end

project_lib_dir = File.expand_path('../src/lib/ruby2',File.dirname(realbin))

$:.unshift('/opt/IAS/lib/ruby2')
$:.unshift(File.expand_path(project_lib_dir,File.dirname(realbin)))

# puts project_lib_dir
