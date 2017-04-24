#!/usr/bin/env perl


##THIS IS in BASH MODULE 3 ###


use POSIX;
use strict;
use warnings;
use 5.010;
use Getopt::Long qw(GetOptions);

my $cfolder;
my $ffile;
GetOptions(
    'c=s' => \$cfolder,
    'f=s' => \$ffile,
) or die "Usage: $0 -c customerDataFolder -f dataFile\nBoth arugments are required\n\n";


#if(!defined $ARGV[0]){
#    die "\nThis is HELP Function!\n-c customerDataFolder -f dataFile\nBoth arugments are require                                                                                                    d\n\n";
#}

if($0 eq '--help'){
    die "\nThis is HELP Function!\n-c customerDataFolder -f dataFile\nBoth arugments are required                                                                                                    \n\n";
}


if (!$cfolder || !$ffile) {
    die "Usage: $0 -c customerDataFolder -f dataFile\nBoth arugments are required\n\n";
}

my $mm = strftime("%m", localtime(time));
my $ts = strftime(".%Y-%d-%m", localtime(time));

#print "$mm $ts \n";


print "-------\n";


my $newscript = "$ffile$ts";

print "working on /home/student\n";
print "Checking for data structure $newscript\n";
print "\n";

if (-e "/home/student/$cfolder/$mm") {
        print "Getting file from customer server\n";
} else {
        print "Customer $cfolder folder is missing\n";
        print "Creating folder\n";
        print "Getting file from customer server\n";
        print "\n";
#print "mkdir /home/student/$cfolder/$mm";
    system "mkdir /home/student/$cfolder/$mm";
}
print "\n";

#print "scp bd81217\@icarus.cs.weber.edu:/home/hvalle/submit/cs3030/files/$ffile /home/student/$c                                                                                                    folder/$mm/$newscript";


system "scp bd81217\@icarus.cs.weber.edu:/home/hvalle/submit/cs3030/files/$ffile /home/student/$c                                                                                                    folder/$mm/$newscript";


print "\nFile located at [$cfolder/$mm/$newscript]\n\n";
