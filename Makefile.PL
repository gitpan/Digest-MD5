require 5.004;
use strict;
use Config qw(%Config);
use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	   => 'Digest::MD5',
    'VERSION_FROM' => 'MD5.pm',
    'dist'         => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
);
