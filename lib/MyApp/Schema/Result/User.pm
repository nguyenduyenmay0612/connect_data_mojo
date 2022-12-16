use utf8;
package MyApp::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::User

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp");

=head1 TABLE: C<users>

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 username

  data_type: 'varchar'
  is_nullable: 0
  size: 25

=head2 pass

  data_type: 'varchar'
  is_nullable: 0
  size: 11

=cut

__PACKAGE__->add_columns(
  "username",
  { data_type => "varchar", is_nullable => 0, size => 25 },
  "pass",
  { data_type => "varchar", is_nullable => 0, size => 11 },
);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2022-12-16 15:20:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SpDB9WQlfI2YPGynhgYRKw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
