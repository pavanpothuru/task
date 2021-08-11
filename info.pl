#!/usr/local/bin/perl

use CGI;
use JSON;

print "Content-type: text/html\n\n";

$query = new CGI;

my $CustomerID  = $query->param("CustomerID");
my $ProductName  = $query->param("ProductName");
my $Domain  = $query->param("Domain");
my $StartDate  = $query->param("StartDate");
my $DurationMonths  = $query->param("DurationMonths");

open(OUT,">>details.txt") or die print "Not able to add in file or file doesn't exists";
print OUT "\n$CustomerID $ProductName $Domain $StartDate $DurationMonths";

open(IN,"details.txt") or die print "Not able to open file or file doesn't exists";
my @lines = <IN>;
print "<table border=1 style='width:60%' align='center'>";
print "</br></br><tr><td><b>CustomerID</b></td><td><b>Product name</b></td><td><b>Domain</b></td><td><b>Start date</b></td><td><b>Duration</b></td></tr>";
foreach my $line (@lines) {
	my @arr = split(/\s/,$line);
	print "<tr><td>$arr[0]</td><td>$arr[1]</td><td>$arr[2]</td><td>$arr[3]</td><td>$arr[4]</td></tr>";
}
