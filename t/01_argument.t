BEGIN
{
	$| = 1; print "1..3\n";
}

my $loaded;

use strict;

use Carp;

use SQL::Generator;

printf "ok %d\n", ++$loaded;

	eval
	{
		my $el = new SQL::Generator::Argument
		(
			token => 'FUNCTION', argtypes => { ALL => 1 },

			token_printf => '[%s]',	param_printf => '(%s)',

			pre => '<sql-statement>',

			post => '</sql-statement>',
		);

		$el->param( { name => 'murat', 	email => 'muenalan@cpan.org', telefon => '0800-shoe' } );

		printf "totext: %s\n", $el->totext();

		$el->param( \'eins' );

		printf "totext: %s\n", $el->totext();

		$el->param( 'eins' );

		printf "totext: %s\n", $el->totext();

		$el->param( [ qw/eins zwei drei/ ] );

		printf "totext: %s\n", $el->totext();
	};

	if($@)
	{
        	croak $@;

        	print 'not ';
	}

print STDERR "provocate an error\n";

printf "ok %d\n", ++$loaded;

	eval
	{
		my $el = new SQL::Generator::Argument
		(
			token => 'FUNCTION', argtypes => { ARRAY => 1 },

			token_printf => '[%s]',	param_printf => '(%s)',

			pre => '<sql-statement>',

			post => '</sql-statement>',
		);

		$el->param( { name => 'murat', 	email => 'muenalan@cpan.org', telefon => '0800-shoe' } );

		printf "totext: %s\n", $el->totext();

		$el->param( \'eins' );

		printf "totext: %s\n", $el->totext();

		$el->param( 'eins' );

		printf "totext: %s\n", $el->totext();

		$el->param( [ qw/eins zwei drei/ ] );

		printf "totext: %s\n", $el->totext();
	};

printf "ok %d\n", ++$loaded;
