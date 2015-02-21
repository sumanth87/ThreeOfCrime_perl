#Title: THREE OF A CRIME
#Author : Sumanth Kumar Bandi

use strict;
use 5.014;

my $range = 9;
my $count=0,my $i=0,my $exit=0,my $restart=0;
my @loser;
my $pass;
my $continue=0,my $round=0,my $winner=0;
my @player=('PLAYER1','PLAYER2','PLAYER3');


start:							#START THE GAME
my $heredoc = << "END";
 	----------------------------------------------------------------------------
	

	*****************Welcome to THREE OF A CRIME********************************


	----------------------------------------------------------------------------
END
print $heredoc;


#Generating Perpetrators
my @perpetrators = ( int(rand($range)), int(rand($range)), int(rand($range)) );
print "Total no. of Players: ",$#player+1,"\t\nPlayers are: @player\n","The perpetrators are: @perpetrators\n";


#While starts: code for the game-----------------------------------------------------------------------------------
while($winner==0 && $#loser<2)
{
my @random = ( int(rand($range)), int(rand($range)), int(rand($range)) );
$round++;

	#Loop to find the perpetrators from the criminals list
	foreach my $y(@random) 
	{
	
	if (grep { $_ eq $y } @perpetrators)
	{$count++;print "***";}
	}

print "\t\n---------------Round $round -------------\n","The criminals are: @random\n";
print "\nFrom the above criminals the number of perpetrators are: $count \n";
my $c=0;

	#Loop for each player
	LINE:	foreach my $x(@player)
	{
	my @entry;
	
	
		if (grep { $_ eq $x } @loser)	#If the player is eliminated
		{next LINE;}
		$pass=0;

		print ">>>>HELLO\n\tPlayer: ",$x,"\n To PASS press ENTER ,else press anyother key: ";
		$pass=<>;
		next if($pass=='\n');		#Check for PASS
	
			#Taking i/p from player and checking for correct match			
			for($i=0;$i<3;$i++)
			{
			print "\nEnter the possible perpetrator no.$i(from 0 to 9):";
			my $z=<>;
				foreach my $w(@perpetrators)	
				{					
					if($w == $z)
					{$c++;print "\n--Found perpetrator\n"}
				}
			
			}#for end
		
		#Deciding winner/loser 		
		if($c<3)	
		{push @loser,$x; 
		print "Eliminated contestant/'s:", @loser," \n";
		}#if end
		else
		{$winner=$x;goto finish;}

	$c=0;
	}#foreach end

$count=0;

print "To exit press '1', else press any other key: ";
$exit=<>;
if($exit==1)
{$exit=0;goto out;}

}#while ends-----------------------------------------------------------------------------

finish:

print "\n\n\t~~~~~~WINNER IS: $winner\n\n";
$winner=0;

out:
print "To restart press 1:";
$restart=<>;
if($restart==1)
{$restart=0;goto start;}


# End of Program	------------------------
