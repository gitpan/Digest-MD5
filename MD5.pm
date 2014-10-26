package Digest::MD5;

use strict;
use vars qw($VERSION @ISA @EXPORT);

$VERSION = '1.9953';  # $Date: 1998/10/23 12:23:46 $

require Exporter;
*import = \&Exporter::import;
@EXPORT = qw(md5_bin md5_hex md5_base64);

require DynaLoader;
@ISA=qw(DynaLoader);
Digest::MD5->bootstrap($VERSION);

*reset = \&new;

1;
__END__

=head1 NAME

Digest::MD5 - Perl interface to the MD5 Message-Digest Algorithm

=head1 SYNOPSIS

 # Procedural style
 use Digest::MD5  qw(md5_bin md5_hex md5_base64);

 $digest = unpack("H*", md5_bin($data));
 $digest = md5_hex($data);
 $digest = md5_base64($data);
    

 # OO style
 use Digest::MD5 ();

 $ctx = Digest::MD5->new;

 $ctx->add($data);
 $ctx->addfile(*FILE);

 $digest = $ctx->digest;
 $digest = $ctx->hexdigest;
 $digest = $ctx->b64digest;

=head1 DESCRIPTION

The C<Digest::MD5> module allows you to use the RSA Data Security
Inc. MD5 Message Digest algorithm from within Perl programs.  The
algorithm takes as input a message of arbitrary length and produces as
output a 128-bit "fingerprint" or "message digest" of the input.

The C<Digest::MD5> module provide a procedural interface for simple
use, as well as an object oriented interface that can handle messages
of arbitrary length and which can read files directly.

The digest can be delivered in three formats:

=over 8

=item I<binary>

16 bytes of binary data.  This is the most compact form, but it is not
well suited for printing or embedding in places that can't handle
arbitrary data.

=item I<hex>

A 32 characters long string of hexadecimal digits.  This is the most
common way to present MD5 digests.

=item I<base64>

A 22 character long string of printable characters.  This is the
base64 encoded representation of the digest with the 2 bytes of
padding removed.  The L<MIME::Base64> tells you more about this
encoding.

=back

=head1 FUNCTIONS

The following functions are exported.

=over 4

=item md5_bin($data,...)

This function will concatenate all the data given as argument as the
message and return the binary MD5 digest.

=item md5_hex($data,...)

Same as md5_bin(), but will return the digest in hexadecimal form.

=item md5_base64($data,...)

Same as md5_bin(), but will return the digest as a base64 encoded string.

=back

=head1 METHODS

The following methods are available:

=over 4

=item $md5 = MD5->new

The constructor returns a new C<MD5> object which encapsulate the
state of the MD5 message-digest algorithm.  You can add data to the
object and finally ask for the digest.

If called as a instance method (i.e. $md5->new) it will just reset the
state the object to the state of a newly created object.  No new
object is created in this case.

=item $md5->reset

This is just an alias for $md5->new.

=item $md5->add($data,...)

The $data provided as argument are appended to the message we
calculate the digest for.  The return value is the $md5 object itself.

=item $md5->addfile($io_handle)

The $io_handle is read until EOF and the content is appended to the
message we calculate the digest for.  The return value is the $md5
object itself.

=item $md5->digest

Return the binary digest for the message.  Note that the C<digest>
operation is effectively a destructive, read-once operation. Once it
has been performed, the MD5 context object must be C<reset> before
being used to calculate another digest value.

=item $md5->hexdigest

Same as $md5->digest, but will return the digest in hexadecimal form.

=item $md5->b64digest

Same as $md5->digest, but will return the digest as a base64 encoded
string.

=back


=head1 EXAMPLES

The simplest way to use this library is to import the md5_hex()
function (or one of its cousins):

    use Digest::MD5 qw(md5_hex);
    print "Digest is ", md5_hex("foobarbaz"), "\n";

The above example would print out the message

    Digest is 6df23dc03f9b54cc38a0fc1483df6e21

provided that the implementation is working correctly.  The same
checksum can also be calculated in OO style:

    use Digest::MD5 ();
    
    $md5 = Digest::MD5->new;
    $md5->add('foo', 'bar');
    $md5->add('baz');
    $digest = $md5->digest();
    
    print "Digest is ", unpack("H*", $digest), "\n";

With OO style you can break the message arbitrary.  This means that we
are no longer limited to have space for the whole message in memory.
We can handle messages of any size.

This is useful when calculating checksum for files:

    use Digest::MD5 ();

    my $file = shift || "/etc/passwd";
    open(FILE, $file) or die "Can't open '$file': $!";
    binmode(FILE);

    $md5 = Digest::MD5->new;
    while (<FILE>) {
        $md5->add($_);
    }
    close(FILE);
    print $md5->b64digest, " $file\n";

Or we can use the builtin addfile method to read the file much faster:

    use Digest::MD5 ();

    my $file = shift || "/etc/passwd";
    open(FILE, $file) or die "Can't open '$file': $!";
    binmode(FILE);

    print Digest::MD5->new->addfile(*FILE)->hexdigest, " $file\n";

=head1 SEE ALSO

L<SHA>, L<HMAC::MD5>,
L<MIME::Base64>

=head1 COPYRIGHT

This library is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

 Copyright 1998 Gisle Aas.
 Copyright 1995-1996 Neil Winton.
 Copyright 1991-1992 RSA Data Security, Inc.

The MD5 algorithm is defined in RFC 1321. The basic C code
implementing the algorithm is derived from that in the RFC and is
covered by the following copyright:

=over 4

=item

Copyright (C) 1991-2, RSA Data Security, Inc. Created 1991. All
rights reserved.

License to copy and use this software is granted provided that it
is identified as the "RSA Data Security, Inc. MD5 Message-Digest
Algorithm" in all material mentioning or referencing this software
or this function.

License is also granted to make and use derivative works provided
that such works are identified as "derived from the RSA Data
Security, Inc. MD5 Message-Digest Algorithm" in all material
mentioning or referencing the derived work.

RSA Data Security, Inc. makes no representations concerning either
the merchantability of this software or the suitability of this
software for any particular purpose. It is provided "as is"
without express or implied warranty of any kind.

These notices must be retained in any copies of any part of this
documentation and/or software.

=back

This copyright does not prohibit distribution of any version of Perl
containing this extension under the terms of the GNU or Artistic
licences.

=head1 AUTHORS

The original MD5 interface was written by Neil Winton
(C<N.Winton@axion.bt.co.uk>).

This release was made by Gisle Aas <gisle@aas.no>

=cut
