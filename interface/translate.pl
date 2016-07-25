sub get_translation{
  #print "$ARGV[0]";
  #my ($name,$id,$category)=@_; # Tableau des paramètres

  my @arg_list = @_;
  my $name = $arg_list[0];
  my $category = $arg_list[1];
  my $id = $arg_list[2];
  open(DF,"./exp/tri3c/decode_2fmllr/log/decode.1.log") || die "Erreur d'ouverture du fichier decode.1.log\n";
  open(FMLLR,"./exp/tri3b/decode/log/decode.1.log") || die "Erreur d'ouverture du fichier decode_pass1.1.log\n";
  open(R,">./result/$name/$category/test$id.txt") || die "Erreur de creation de Collection\n";
   
   my $uterrance = $name.'_test'.$id;

   while (my $ligne = <DF>){
	my @words = split(' ',$ligne);
	
 	if($words[0] eq $uterrance){

	   my $size = scalar @words;

           for(my $i = 1; $i < $size; $i++){	       	
		if($i == ($size-1) )
		{
			
			print R "$words[$i]\n";
		 }
		else
		{
			
			print R "$words[$i] ";
		}
 			
	   }
	}
	
   }

   
   while (my $ligne = <FMLLR>){
	my @words = split(' ',$ligne);
	
 	if($words[0] eq $uterrance){

	   my $size = scalar @words;

           for(my $i = 1; $i < $size; $i++){	       	
		if($i == ($size-1) )
		{
			
			print R "$words[$i]\n";
		 }
		else
		{
			
			print R "$words[$i] ";
		}
 			
	   }
	}
	
   }

   close(F);
   close(R);
  
 }
get_translation($ARGV[0],$ARGV[1],$ARGV[2]);
