#!/usr/bin/perl
use warnings;
use strict;
use Crypt::CBC;
use MIME::Base64;
print "Enter string u want to encrypt?";
my $KEY = <>;
my $string = 'The Prestige';
print "input: $string\n";

my $enc = encryptString( $string );
print "encrypted binary: $enc\n";

my $mime = encode_base64($enc);
print "MIME: $mime\n";

my $mime_decode = decode_base64($mime);
print "MIME_decode: $mime_decode\n";

my $dec = decryptString( $enc );
print "decrypted: $dec\n";

my $mime_dec = decryptString( decode_base64($mime) );
print "decrypted_mime: $mime_dec\n";

############################################################
sub encryptString {
   my $string = shift;
  
   my $cipher = Crypt::CBC->new(
      -key        => $KEY,
      -cipher     => 'Blowfish',
      -padding  => 'space',
      -add_header => 1
   );

   my $enc = $cipher->encrypt( $string  );
   return $enc; 
}

###################################################################

sub decryptString {
   my $string = shift;
   
   my $cipher = Crypt::CBC->new(
      -key        => $KEY,
      -cipher     => 'Blowfish',
      -padding  => 'space',
      -add_header => 1
   );

   my $dec = $cipher->decrypt( $string  );
   return $dec; 
}

#############################################################3

