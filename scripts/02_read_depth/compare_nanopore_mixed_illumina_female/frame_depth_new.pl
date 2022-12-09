#!/usr/bin/perl
use warnings;
use strict;
# 
# Author: Ching-Ho Chang
# for Chang and Larracuente 2018. Heterochromatin-enriched assemblies reveal the sequence and organization of the Drosophila melanogaster Y chromosome
# calculate sum of depth, average and median F/M for each 10kb window
#
my $i=0;
my $sum =0;
my $sum2 =0;
my $med=0;
my $j=0;
my $start=1;
my $base;
my @ratio;
my $ave;

# a subfunction for calculating median
sub median
{
    my @vals = sort {$a <=> $b} @_;
    my $len = @vals;
    if($len%2)  {
    #odd
    return $vals[int($len/2)];
             }
    else {
    #even
    return ($vals[int($len/2)-1] + $vals[int($len/2)])/2;
    }
}

open (input_file,"$ARGV[0]");
#input depth file from samtools 
print "$ARGV[0]\n";
$ARGV[0] =~/(\S+).out/ || die;
my $name=$1;
#the new output file name as *_2.out
open (OUT,">$1_2.out");
while(my $line=<input_file>){
	my @linearray=split(/\s+/,$line);
	#filtered the region with 1 or less depth 
	next if ($linearray[2]+$linearray[3]<=1);
	#put the median into a array 
	$ratio[$i]=$linearray[2]/($linearray[3]+1);
	#sum of depth in two different samples
	$sum=$sum+$linearray[2];
	$sum2=$sum2+$linearray[3];
	$i++;
	
	null:
	if((($linearray[1] >=10000*($j+1)  || $linearray[0] ne $name) && $start !=1 )){
		$med=median(@ratio);
		$med= 'NA' if ($i==0);
		@ratio=0;
		$ave=$sum/($sum2+1);
		$base=$j*10000+5000;
		#Output the average and median of Female/Male read coverage for each 10kb window
		print OUT "$name\t$base\t$i\t$sum\t$sum2\t$ave\t$med\n";
		$j++;
		$i=0;
		$sum=0;
		$sum2=0;
		$j=0 if $linearray[0] ne $name;
		$name=$linearray[0];
		goto null;}
	$start++;
	$name=$linearray[0];
	$base=$linearray[1];}
